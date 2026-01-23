/* =============================================================================
PHASE 1: GLOBAL MARKET INTELLIGENCE ENGINE 
OBJECTIVE: Transform raw e-commerce logs into a Strategic Behavioral Data Mart.
STRATEGY: Using Window Functions instead of Correlated Subqueries for stability.
============================================================================= */

CREATE OR REPLACE TABLE `portfolio-project-2-growth.market_intelligence.customer_gold_record` AS

WITH 
-- 1. DATA UNIFICATION: Merging Sales, Products, and Users
raw_base AS (
  SELECT 
    oi.user_id,
    oi.order_id,
    oi.product_id,
    oi.sale_price,
    p.cost AS product_cost,
    p.category AS product_category,
    p.brand,
    u.country,
    u.traffic_source,
    oi.created_at,
    oi.status
  FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  JOIN `bigquery-public-data.thelook_ecommerce.products` AS p ON oi.product_id = p.id
  JOIN `bigquery-public-data.thelook_ecommerce.users` AS u ON oi.user_id = u.id
  WHERE oi.status NOT IN ('Cancelled', 'Returned')
),

-- 2. FIRST CATEGORY IDENTIFIER (De-correlation Step)

first_purchases AS (
  SELECT 
    user_id,
    product_category AS first_purchase_category
  FROM (
    SELECT 
      user_id, 
      product_category,
      ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at ASC) as rn
    FROM raw_base
  )
  WHERE rn = 1
),

-- 3. SEQUENTIAL ANALYSIS: Tracking the 'DNA' of the journey
sequenced_journey AS (
  SELECT 
    *,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at) AS order_sequence,
    LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS prev_order_at,
    FIRST_VALUE(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS customer_acquisition_date
  FROM raw_base
),

-- 4. BEHAVIORAL VELOCITY: Calculating Recency and Intervals
velocity_metrics AS (
  SELECT 
    user_id,
    country,
    traffic_source,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(sale_price) AS total_revenue,
    SUM(sale_price - product_cost) AS total_gross_profit,
    DATE_DIFF(DATE('2024-01-01'), DATE(MAX(created_at)), DAY) AS recency_days,
    SAFE_DIVIDE(COUNT(DISTINCT order_id), DATE_DIFF(DATE(MAX(created_at)), DATE(MIN(created_at)), YEAR) + 1) AS orders_per_year
  FROM sequenced_journey
  GROUP BY 1, 2, 3
),

-- 5. RFM SCORING: Applying Quintile Ranking (1-5)
rfm_scoring AS (
  SELECT 
    v.user_id,
    v.total_revenue,
    v.recency_days,
    NTILE(5) OVER(ORDER BY v.recency_days DESC) AS r_score,
    NTILE(5) OVER(ORDER BY v.total_orders ASC) AS f_score,
    NTILE(5) OVER(ORDER BY v.total_revenue ASC) AS m_score
  FROM velocity_metrics v
),

-- 6. PSYCHOLOGICAL SEGMENTATION
strategic_segments AS (
  SELECT 
    user_id,
    (r_score + f_score + m_score) AS rfm_total,
    CASE 
      WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'CHAMPION'
      WHEN r_score >= 3 AND f_score >= 3 THEN 'LOYALIST'
      WHEN r_score <= 2 AND m_score >= 4 THEN 'AT RISK - BIG SPENDER'
      WHEN r_score <= 2 AND f_score <= 2 THEN 'HIBERNATING'
      WHEN r_score >= 4 AND f_score <= 2 THEN 'NEW POTENTIAL'
      ELSE 'STANDARD'
    END AS behavioral_segment
  FROM rfm_scoring
)

-- 7. FINAL GOLDEN RECORD 
SELECT 
  v.*,
  s.behavioral_segment,
  s.rfm_total,
  fp.first_purchase_category,
  SAFE_DIVIDE(v.total_gross_profit, v.total_revenue) AS lifetime_margin_pct
FROM velocity_metrics v
JOIN strategic_segments s ON v.user_id = s.user_id
JOIN first_purchases fp ON v.user_id = fp.user_id;