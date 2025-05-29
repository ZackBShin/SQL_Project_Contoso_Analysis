# Intermediate SQL - Sales Analysis

## Overview
This project presents a cohort-based analysis of customer retention and churn trends using the Contoso database, a fictional dataset commonly used for business analytics demonstrations. The primary objective is to explore how customer behavior evolves over time, identify patterns in churn rates, and generate actionable insights for improving customer retention. The analysis includes data visualizations such as pie charts and segmented bar charts, highlighting differences in churn across yearly cohorts. My motivation for this project stems from a desire to deepen my skills in data storytelling and business intelligence, while also building practical experience with real-world analytical thinking that supports strategic decision-making in customer lifecycle management.

SQL Queries? Check them out here: [project_sql_contoso folder](Project_Contoso_Analysis)

## Business Questions
1. **Customer Segmentation Analysis:** Who are our most valuable customers? 
2. **Cohort Analysis:** How do different customer groups generate revenue?
3. **Customer Retention Analysis:** Who hasn't purchased recently?

## Tools I Used
For my journey delving into the Contoso database, I utilized several key tools:
- **SQL:** for querying and analyzing structured data from the dataset.
- **PostgreSQL:** as the database management system for storing and managing the data.
- **DBeaver:** as the primary code editor for writing and running scripts.
- **Git & GitHub:** for version control and collaboration, tracking changes and managing project development.
- **ChatGPT:** for visualization. 


## Analysis Approach

### 1. Customer Segmentation Analysis
- Categorized customers based on total lifetime value (LTV)
- Assigned customers to High, Mid, and Low-value segments
- Calculated key metrics: Total Revenue

Query: [1_customer_segmentation.sql](/Project_Contoso_Analysis/1_customer_segmentation.sql)

**Visualization:**

![Customer Segmentation](/images/customer_ltv_pie_chart.png)

**Key Findings:**
- High-value customers (top 25%) drive 66% of the revenue ($135.4M)
- Mid-value customers (middle 50%) drive 32% of revenue ($66.6M)
- Low-value customers (bottom 25%) account for only 2% of revenue ($4.3M)

**Business Insights**
- High-value: Offer premium membership program to 12,372 VIP customers, as losing one of these high-value customers can significantly impact revenue.
- Mid-Value: Create incentives for upgrade paths through personalized promotions, potential to shift mid-value customers up to high-value
- Low-Value: Design engagement campaigns and price-sensitive promotions to increase purchase frequency


### 2. Cohort Analysis

- Tracked revenue and customer count per cohort
- Cohorts were grouped by year of first purchase
- Analyzed customer retention at a cohort level

Query: [2_cohort_analysis.sql](/Project_Contoso_Analysis/2_cohort_analysis.sql)

**Visualization:**

![Cohort Analysis](/images/customer_revenue.png)

**Key Findings:**
- Revenue per customer shows an alarming decreasing trend over time
- 2022-2024 cohorts are consistently performing worse than earlier cohorts
- NOTE: Although net revenue is increasing, this is likely due to a larger customer base, which is not reflective of customer value

**Business Insights:**
- Value extracted from customers is decreasing over time and calls for further inquiry.
- In 2023, we saw a drop in number of customers acquired, which is concerning.
- With both lowering LTV and decreasing customer acquisition, the company is facing a potential revenue decline.


### 3. Customer Segmentation Analysis

- Identified customers at risk of churning
- Analyzed last purchase patterns
- Calculated customer-specific metrics

Query: [3_retention_analysis.sql](/Project_Contoso_Analysis/3_retention_analysis.sql)

**Visualization:**

![Customer Retention](/images/customer_retention.png)

**Key Findings:**
- Cohort churn stabilizes at about 90% after 2-3 years, indicating a predictable long-term retention pattern.
- Retention rates are consistently low at around 8-10% across all cohorts. This suggests retention issues are systemic.
- Newer cohorts from 2022 or 2023 show similar churn trajectory, signaling that future cohorts will follow the same pattern without intervention.

**Business Insights:**
- Strengthen early engagement strategies to target the first 1-2 years with incentives to improve long-term retention such as promotions, loyalty rewards, etc.
- Re-engage high-value churned customers by focusing on targeted win-back campaigns.
- Predict and preempt churn risk and use customer-specific warning indicators to intervene with at-risk users.

## Strategic Recommendations

1. **Maximize Customer Retention:**
    - Implement personalized engagement by analyzing behavioral and transactional data to send personalized product recommendations.
    - Introduce tiered loyalty and reward programs to incentivize long-term engagement.
    - Regularly send out check-in and customer satisfaction surveys and inventories to tailor future products and services.

2. **Re-Engage Churned Customers:**
    - Launch segmented email/social campaigns with discount incentives to entice churned customers to return.
    - Provide social proof of customer success stories, testimonials, or new features, emphasizing the growth of the company to target older cohorts.

3. **Target Customers Effectively by Cohort:**
    - Understand cohort behavior by breaking down customer lifetime value, retention rates, and channel effectiveness by cohort.
    - Build cohort specific offers such as loyalty revival campaigns, and tailor advertising for churned customers by cohort year.
    - Optimize marketing timing by preparing materials and implementing campaigns close to significant drop-off points.