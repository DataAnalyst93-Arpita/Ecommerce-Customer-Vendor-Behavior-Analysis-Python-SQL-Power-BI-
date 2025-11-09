# Ecommerce-Customer-Vendor-Behavior-Analysis-Python-SQL-Power-BI-
A leading e-commerce company wants to understand customer churn, vendor performance, and delivery efficiency to improve profitability and retention. This project performs data cleaning (Python), business analysis (SQL), and dashboard visualization (Power BI) to uncover actionable insights.
🧍‍♀️ Customer & Vendor Analysis

This section focuses on understanding customer behavior, churn patterns, vendor performance, and their impact on overall sales and retention.

The goal of this analysis was to identify key business drivers such as:

Which customer segments have the highest churn?

Which vendors are most profitable and reliable?

How do product category and delivery success affect customer satisfaction and repeat purchases?

🧠 Customer Analysis
🔹 Objectives

To analyze customer churn and retention patterns across regions.

To evaluate purchase frequency, average order value, and repeat purchase rate.

To identify demographic or regional trends influencing churn.

🔹 Methods & Techniques

Data Cleaning: Standardized customer names, region labels, and churn statuses.

EDA (Python): Used groupby(), value_counts(), and correlation checks to study churn distribution.

SQL Queries: Aggregated churn metrics by region, gender, and join date using CASE WHEN logic.

Power BI Visualization:

Donut chart → Active vs. Churned customers

Bar chart → Churn Rate % by Region

Line chart → Monthly New Customers and Retention Trends

🔹 Key Findings

Overall churn rate: 51.9%

Highest churn: North America (55.1%), Europe (54.1%), Africa (52.6%)

Repeat Purchase Rate: 80.7% (loyal customer base exists)

Customers with multiple payment options and consistent delivery success show higher retention.

🔹 Insights

Retention marketing and loyalty campaigns are required in high-churn regions.

Strengthening delivery and refund processes can improve customer experience.

Personalized offers can convert occasional buyers into repeat customers.

🏭 Vendor Analysis
🔹 Objectives

To assess vendor contribution to total revenue and order success.

To evaluate vendor performance based on average rating, product count, and onboarding trend.

To identify underperforming vendors and potential improvement areas.

🔹 Methods & Techniques

Python (Pandas): Merged vendor data with order metrics using merge() and calculated vendor revenue shares.

SQL Queries:

Ranked vendors by revenue using RANK() and CTE.

Calculated vendor-wise delivery success rates.

Power BI Visuals:

Bar chart → Top Vendors by Revenue

Bubble chart → Vendor Revenue vs. Rating (bubble size = total products)

Line chart → Vendors Onboarded Over Time

🔹 Key Findings

Vendors with avg rating > 4.0 drive the majority of sales.

Low-rated vendors (< 3.0) correlate strongly with higher return and cancellation rates.

Vendor onboarding has steadily increased across 2023–2024, indicating strong marketplace expansion.

🔹 Insights

Encourage top-performing vendors through incentives and visibility boosts.

Train or monitor low-performing vendors to improve product quality and service reliability.

Vendor quality directly influences customer satisfaction and platform trust.

🚚 Delivery Status Insights (Linked to Vendors and Customers)

Delivery Success Rate: 33.1%

Returns & Cancellations: Account for nearly 67% of total orders.

Categories like Clothing and Electronics have higher return ratios.

Delivery performance varies by region — improved logistics partnerships could lower churn.

💡 Business Impact

Reduced manual reporting through SQL & Power BI integration.

Identified churn hotspots and vendor inefficiencies impacting sales.

Delivered actionable insights that help teams focus on:

Customer Retention

Vendor Quality Improvement

Delivery Optimization

Revenue Growth through Targeted Campaigns

⚙️ How the Workflow Connects
📊 Raw Data (CSV)
       ↓
🐍 Python (Pandas Cleaning & EDA)
       ↓
🗃️ SQL Server (Business Queries & KPI Calculation)
       ↓
📈 Power BI (Visualization & DAX Insights)
       ↓
🧠 Strategic Recommendations


This flow represents a complete data analytics lifecycle, from cleaning and modeling to visualization and storytelling.

🧩 Technologies Used

Python (Pandas, NumPy) • SQL Server (CTEs, Window Functions, Joins) • Power BI (Power Query, DAX, Data Modeling) • Excel (Data Validation, Pivot Tables)
