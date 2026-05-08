# Marketing Analytics – Comprehensive Academic Project
**University of Europe for Applied Sciences | MSc Data Science – Semester 2**

A solo comprehensive marketing analytics project for a fictional **independent online bookstore**, covering five analytical domains: customer segmentation, conjoint analysis, Google Analytics, keyword & social media strategy, and Tableau dashboarding.

---

## Project Structure

```
Marketing-Analytics/
├── 1_Task1/
│   ├── customer_data_generation.R         # Synthetic customer data generation
│   ├── Customer_Segmentation_Technique.R  # K-Means clustering
│   ├── Customer_Data_Visualizations.R     # 9 segmentation visualizations
│   └── Generated_customer_data.csv        # 1000-row synthetic dataset
├── 1_Task2/
│   └── Conjoint_DATA_ANALYSIS.R           # Conjoint analysis & part-worth utilities
├── 1_Task5/
│   ├── Tableau_Dashboard.twb              # Tableau workbook
│   └── IHME_GBD_2010_MORTALITY_...csv    # Dataset used for dashboard
└── Marketing Analytics Final Project Report.pdf
```

> Tasks 3 (Google Analytics) and 4 (Keywords & Social Media) are documented with screenshots in the final report PDF.

---

## Task 1 — Customer Segmentation (R)

**Business:** Independent online bookstore
**Objective:** Identify distinct customer groups to enable targeted marketing

### Data Generation
Generated **1,000 synthetic customers** using R (`dplyr`, `tidyr`) with the following features:

| Feature | Description |
|---------|-------------|
| `Age` | 18 – 65 years |
| `Income` | £20,000 – £100,000 |
| `PurchaseFrequency` | 1 – 20 purchases |
| `AvgSpend` | £10 – £50 per purchase |
| `PreferredGenre` | Fiction, Non-Fiction, Mystery, Romance, Sci-Fi |
| `TotalSpend` | Derived: PurchaseFrequency × AvgSpend |

### Segmentation Method: K-Means Clustering (K=3)
Clustered on: `Age`, `Income`, `PurchaseFrequency`, `AvgSpend`

### Visualizations Produced
1. Scatter plot — Income vs Age by cluster
2. Scatter plot — Purchase Frequency vs Avg Spend by cluster
3. Boxplot — Income distribution by cluster
4. Boxplot — Age distribution by cluster
5. Bar plot — Preferred genre proportion by cluster
6. Scatter plot — Cluster centroids overlaid (Income vs Age)
7. Pairwise scatter matrix — all features colored by cluster
8. Correlation heatmap — feature relationships
9. Histogram — Total Spend distribution by cluster

### Segment Profiles & Marketing Strategies

| Cluster | Profile | Recommended Strategy |
|---------|---------|----------------------|
| Cluster 1 | Young, lower income, frequent buyers of popular genres | Subscription bundles, loyalty rewards, genre-based newsletters |
| Cluster 2 | Mid-age, mid-income, balanced spending | Cross-sell recommendations, seasonal promotions, curated reading lists |
| Cluster 3 | Older, higher income, selective high-value buyers | Premium editions, author events, VIP early access campaigns |

### Tools
`R` · `dplyr` · `tidyr` · `ggplot2` · `GGally` · `ggcorrplot`

---

## Task 2 — Conjoint Analysis (R)

**Objective:** Understand how bookstore customers value different product attributes

### Setup
- **Attributes analyzed:** `PreferredGenre` (Fiction, Non-Fiction, Mystery, Romance, Sci-Fi) and `AvgSpend` (Low / Medium / High)
- **Method:** Full-profile conjoint using `caModel()` from the `conjoint` package
- **Profiles:** All combinations via `expand.grid()`
- **Output:** Part-worth utility coefficients per attribute level

### Key Output
Part-worth utilities visualized as a grouped bar chart — identifying which genre and price tier drives the highest customer preference.

### Business Insight
Results inform decisions such as which genres to prioritize in homepage placements and what price tier positioning maximizes perceived value.

### Tools
`R` · `conjoint` · `ggplot2`

---

## Task 3 — Google Analytics (Demo Account)

**Objective:** Demonstrate 5 types of web analytics using the Google Analytics demo account

| Analytics Type | Insight Extracted |
|---------------|------------------|
| Audience Overview | User demographics, sessions, bounce rate |
| Acquisition Overview | Traffic source breakdown (organic, paid, direct, referral) |
| Behavior Flow | User navigation paths through the site |
| Conversion Goals | Goal completions and conversion rates |
| Custom Report | Engagement metrics by device category |

> Full screenshots and explanations are documented in the **Final Report PDF**.

---

## Task 4 — Keywords & Social Media Marketing

**Objective:** Identify two long-tail keywords and design a social media ad for the bookstore

### Long-Tail Keywords Selected

| Keyword | Tool Used | Justification |
|---------|-----------|---------------|
| *"best mystery books for adults online"* | Google Keyword Planner / SEMrush | Moderate search volume, low keyword difficulty, high purchase intent |
| *"buy discounted fiction books with free shipping"* | Google Keyword Planner / SEMrush | Targets price-sensitive buyers, aligns with bookstore's value proposition |

**Selection criteria:** Search volume, keyword difficulty, domain authority alignment, and commercial intent relevance to the bookstore business.

### Social Media Ad
- **Platform:** Instagram / Facebook
- **Format:** Single image ad with headline, body copy, and CTA
- **Headline:** "Your Next Favourite Read is Just a Click Away"
- **CTA:** "Shop Now – Free Shipping on Orders Over £25"
- **Keywords embedded:** Organically included in ad copy

> Ad design and screenshot included in the **Final Report PDF**.

---

## Task 5 — Tableau Dashboard

**Objective:** Create a multi-chart Tableau dashboard using a real-world dataset

### Dataset
**IHME Global Burden of Disease (GBD) 2010 — Age-Specific Mortality by Country (1970–2010)**

### Dashboard Components

| Chart Type | Analysis |
|-----------|----------|
| Bar Chart | Mortality rates by country/region comparison |
| Line Chart | Mortality trends over time (1970–2010) |
| Map | Geographic distribution of mortality rates |

### File
`Tableau_Dashboard.twb` — open with Tableau Desktop or Tableau Public

> Dashboard screenshots and analysis commentary included in the **Final Report PDF**.

---

## Tools & Technologies

| Domain | Tools |
|--------|-------|
| Data Simulation | R (`dplyr`, `tidyr`) |
| Clustering | R (`stats` — kmeans) |
| Visualization | R (`ggplot2`, `GGally`, `ggcorrplot`) |
| Conjoint Analysis | R (`conjoint`) |
| Web Analytics | Google Analytics (Demo Account) |
| Keyword Research | Google Keyword Planner / SEMrush |
| Social Media | Instagram/Facebook Ad Designer |
| BI Dashboard | Tableau Desktop |

---

## How to Run the R Scripts

```r
# 1. Install required packages
install.packages(c("dplyr", "tidyr", "ggplot2", "GGally", "ggcorrplot", "conjoint"))

# 2. Run data generation first
source("1_Task1/customer_data_generation.R")
# → Outputs: customer_data.csv

# 3. Run segmentation and visualizations
source("1_Task1/Customer_Segmentation_Technique.R")
source("1_Task1/Customer_Data_Visualizations.R")

# 4. Run conjoint analysis
source("1_Task2/Conjoint_DATA_ANALYSIS.R")
```

> Update file paths in each script before running (currently set to a local Windows path).

---

## Report

The complete project report with all screenshots, analysis, interpretations, and marketing recommendations is available in:
📄 `Marketing Analytics Final Project Report.pdf`
