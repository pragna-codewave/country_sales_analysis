# Country Sales Data Analysis (SQL + Power BI Project)

## Project Overview
This project analyzes multi-country retail sales data using SQL and Power BI to generate business insights related to revenue, profit, customer behavior, and sales performance.

The dataset includes transactions from:
- Canada
- China
- India
- Nigeria
- UK
- US

The goal of this project is to simulate a real-world data analyst workflow:
- Data ingestion
- Data cleaning
- Data transformation
- SQL analysis
- Dashboard visualization
- Business insights generation

---

## Tools & Technologies
- SQL Server
- Excel
- Power BI

---

## Key Steps Performed

### 1. Database Creation
- Created database `country_data`
- Dropped existing database to ensure clean setup

### 2. Data Ingestion
- Created separate tables for each country
- Imported CSV files using BULK INSERT

### 3. Data Integration
- Combined all tables using UNION ALL
- Created a unified table `all_country_sales`

### 4. Data Cleaning
- Checked for NULL values
- Handled missing values using average and manual fixes
- Checked and removed duplicate records

### 5. Feature Engineering
Created new columns:
- Total_amount = (Price_per_Unit * Quantity_Purchased) - Discount_Applied
- Profit = Total_amount - (Cost_Price * Quantity_Purchased)

### 6. Data Analysis
Performed SQL analysis on:
- Revenue and profit by country
- Weekly and monthly trends
- Top products and sales representatives
- Store performance
- Customer behavior
- Payment methods
- Profit margins

---

## Key Insights

### Revenue and Profit by Country
- UK generated the highest revenue
- US generated the highest profit
- Revenue distribution is balanced across all countries

### Weekly Performance
- US and Nigeria showed strong weekly performance
- Canada showed relatively lower contribution

### Top Sales Representatives
- Jennifer Miller was the top performer
- Sales performance varies significantly across employees

### Store Location Performance
- New York is the highest performing location
- Other strong locations include Birmingham, Toronto, and London

### Profit Margin Analysis
- Profit margins are stable across all countries (~22–24%)
- US has the highest margin

### Customer Behavior
- Adults contribute the highest revenue
- All age groups contribute almost equally

### Payment Method Analysis
- Mobile payments generate the highest revenue
- Credit card and cash usage are also significant

### Monthly Sales Trend
- December has the highest sales
- June has the lowest sales
- Clear seasonal trend observed

### Top Categories by Profit
- Home & Kitchen is the most profitable category
- Clothing and Electronics follow closely

---

## Power BI Dashboard Features
- KPI cards (Total Sales, Profit, Orders)
- Monthly sales trend
- Daily sales analysis
- Category-wise performance
- Payment method distribution
- Country-wise comparison
- Interactive filters

---

## Business Recommendations
- Focus on high-performing locations like New York
- Increase promotions during low-performing months (May–June)
- Optimize pricing strategies to improve profit margins
- Promote digital payment methods
- Retain and reward top sales representatives
- Invest in high-performing categories

---

## Conclusion
This project demonstrates end-to-end data analysis using SQL and Power BI. It showcases data cleaning, transformation, analysis, and visualization, along with actionable business insights.

