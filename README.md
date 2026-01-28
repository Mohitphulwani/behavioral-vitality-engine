# Behavioral Vitality Engine: Stochastic Revenue Recovery
**Quantifying Brand Memory Decay & Reclaiming $287,137 in At-Risk Portfolio Value**

##  Project Executive Summary
Traditional e-commerce analytics often fail by treating customer loss as a binary, deterministic event. This framework shifts that perspective to a **Stochastic Survival Model**, hypothesizing that customer engagement is a **Latent State (Vitality)** driven by **Habit Strength** (Frequency) and **Temporal Decay** (Recency).

By architecting a cloud-native pipeline using **Google BigQuery**, **Python**, and **Tableau**, I analyzed a 2.5 million user portfolio to identify a **700-day "Psychological Cliff"** where brand recall collapses. This engine prescribes an automated roadmap to reclaim **$287,137 in annual revenue** through targeted, data-driven interventions.

---

##  The Technical Architecture

### 1. SQL Data Orchestration (BigQuery)
Instead of basic queries, I built a **Strategic Behavioral Data Mart** designed for high-performance modeling:
* **Event Sequencing:** Utilized `ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY created_at)` to de-correlate user journeys and isolate "First Purchase" categories.
* **Feature Engineering:** Calculated **Recency, Frequency, and Monetary (RFM)** metrics and "Orders per Year" directly in the warehouse using `NTILE` functions to optimize downstream performance.
* **Modular Design:** Employed **Common Table Expressions (CTEs)** to create a "Customer Gold Record," ensuring a single source of truth for 2.5 million records.

### 2. Latent State Estimation ($P_{Alive}$)
In the Python modeling layer, I moved beyond deterministic logic to estimate the probability of a customer being "active":
* **Dynamic Decay Model:** $P_{Alive} = e^{-\lambda \cdot \text{Recency}}$, where the decay constant ($\lambda$) is dynamically adjusted based on historical purchase frequency.
* **"Vitality Armor":** The model weights total order frequency as a buffer; higher purchase counts increase a customer's resilience to time-based decay, mathematically representing habit strength.
* **The 700-Day Cliff:** Modeling revealed that brand salience collapses after ~700 days of inactivity, regardless of historical spend, creating a critical window for intervention.

### 3. Prescriptive Choice Architecture (Tableau & K-Means)
Using **Scikit-Learn K-Means Clustering**, I segmented the portfolio into four actionable personas, visualized in an executive **Tableau Command Center**:
* **At-Risk VIPs (Stop Leakage):** Low Vitality / High Value. **Nudge:** High-Incentive Win-Backs to prevent total churn.
* **New Potentials (Drive Growth):** High Vitality / Low Value. **Nudge:** Habit-Formation Streaks (Frequency-based rewards) to build "Vitality Armor."
* **Champions (Protect Core):** High Vitality / High Value. **Nudge:** Loyalty Early Access and exclusive rewards.
* **Hibernating:** Zero Vitality. **Strategy:** Deprioritize marketing spend to maximize profit margins.

---

##  Technical Stack
* **SQL (BigQuery):** Window Functions, CTEs, and NTILE-based RFM Scoring.
* **Python:** Pandas, NumPy, and Scikit-Learn for stochastic modeling and behavioral clustering.
* **Tableau:** Executive dashboard featuring a **Dynamic Save-List** and **Urgency Slider** for marketing operations.

---

##  Key Strategic Insights
* **Revenue Anchor:** **31.22%** of total revenue is anchored in the "Champion" segment. The strategy shifts from acquisition-heavy spend to **Core Protection**.
* **Diagnostic Warning:** **26.25%** of historical revenue is currently "Hibernating," quantifying the total financial loss of past inaction.
* **Strategic Lift:** Targeted interventions for At-Risk VIPs yield a projected **$287,137 annual revenue recovery**.

---
**Author:** Mohit Phulwani  
**Focus:** Bridging Behavioral Economics and Cloud-Native Data Science
