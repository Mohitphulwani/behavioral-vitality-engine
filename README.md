# Author
Mohit Phulwani Location: Seattle, WA

Credentials: MS in Business Analytics | BA in Economics & Psychology

Focus: Bridging the gap between behavioral economics and cloud-native data science.

# behavioral-vitality-engine
A Cloud-Native Market Intelligence Engine using Bayesian Decay and K-Means to predict customer vitality ($P-Alive$) and reclaim $287K in at-risk revenue.
#  Behavioral Vitality Engine: Stochastic Revenue Recovery
### *Quantifying Brand Memory Decay & Reclaiming $287,137 in At-Risk Portfolio Value*

---

##  Project Executive Summary
Traditional e-commerce analytics often fail by treating customer loss as a binary, deterministic event. This framework shifts that perspective to a **Stochastic Survival Model**, hypothesizing that customer engagement is a **Latent State (Vitality)** driven by **Habit Strength** (Frequency) and **Temporal Decay** (Recency).

By analyzing a **2.5 million user portfolio** via Google BigQuery and Python, this project identifies a **700-day "Psychological Cliff"** where brand recall collapses and prescribes an automated roadmap to reclaim **$287,137 in annual revenue** through targeted "Causal Nudges."

---

##  Methodology & The "Science"

### 1. Latent State Estimation ($P-Alive$)
Moving beyond standard RFM, I developed a **Stochastic Vitality Score** using an exponential decay function:
* **The Decay Constant ($\lambda = 0.05$):** Models the rate at which a customer’s probability of being "active" fades over time.
* **The 700-Day Cliff:** Modeling revealed that brand memory fades to near zero after ~700 days of inactivity, regardless of historical monetary value.
* **Habitual Resistance:** The model weights total order frequency as "Vitality Armor"—higher purchase counts increase a customer's resilience to time-based decay.

### 2. High-Dimensional Clustering (K-Means)
Using `Scikit-Learn`, I performed K-Means clustering on behavioral vectors to segment the portfolio based on current health vs. historical economic value:
* **Champions (31.22% Revenue Core):** High Vitality / High Value. *Strategy: Protection via Loyalty Rewards.*
* **At-Risk VIPs:** Low Vitality / High Value. *Strategy: Urgent Rescue via High-Incentive Win-Backs.*
* **New Potentials:** High Vitality / Low Value. *Strategy: Habit Formation.*
* **Hibernating (26.25% Revenue Share):** Zero Vitality. *Strategy: Deprioritize to maximize marketing profit margins.*

### 3. Prescriptive Choice Architecture
The engine moves from descriptive to **Prescriptive Analytics**. Each user is programmatically assigned a **"Nudge"** (e.g., High-Incentive Win-Back, Loyalty Early Access) based on their specific cluster and decay stage, transforming raw data into an operational $287K recovery roadmap.

---

##  The Technical Stack
* **Data Engineering:** Google BigQuery (SQL) using Window Functions for high-performance event sequencing.
* **Modeling:** Python (Pandas, NumPy, Scikit-Learn) for latent state estimation and clustering.
* **BI & UI:** Tableau Executive Command Center featuring a dynamic "Save-List" and "Urgency Slider."

---


## Key Strategic Insights
* **Revenue Anchor:** **31.22%** of total revenue is anchored in the Champion segment. The strategy shifts from acquisition-heavy spend to **Core Protection**.
* **Diagnostic Warning:** **26.25%** of historical revenue is currently "Hibernating," quantifying the total financial loss of past inaction.
* **Strategic Lift:** Targeted interventions for At-Risk VIPs yield a projected **$287,137 annual revenue recovery.**

---

