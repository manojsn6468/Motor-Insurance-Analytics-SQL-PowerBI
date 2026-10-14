# Motor Insurance Analytics | SQL & Power BI

## Project Overview
This project explores motor third-party liability insurance policy and claims data to understand claim patterns, portfolio performance, and risk differences across customer, vehicle, and geographic segments.

The analysis uses the **French Motor Third-Party Liability (TPL)** dataset. **SQL** supports data exploration and validation, while **Microsoft Power BI** provides interactive reporting and visual analysis.

## Tools & Skills
- **SQL:** MySQL-style querying, data quality checks, joins, aggregations, policy–claim linkage validation, and segment analysis
- **Power BI:** Data modeling, Power Query, DAX measures, and interactive dashboards
- **Analytical concepts:** Claim frequency, average claim severity, claims cost, segmentation, and portfolio risk

## SQL Analysis & Data Validation

The project includes two SQL scripts, **`SQL Notes.sql`** and **`SQL Notes 2.sql`**, using the `motor_insurance` database with `motor_policy` and `motor_claim` tables. These scripts document exploratory queries and validation performed before and during Power BI dashboard development.

### Data Quality & Relationship Checks (`SQL Notes.sql`)
- Count records in both policy and claims tables, and inspect policy field types with `DESCRIBE`.
- Compare total policy rows against `COUNT(DISTINCT IDpol)` to investigate duplicate policy IDs.
- Check key policy and claim attributes for `NULL` values.
- Use `GROUP BY` and `HAVING COUNT(*) > 1` to find policies associated with multiple claim records.
- Use `LEFT JOIN` to identify claim rows with no matching policy ID.
- Examine minimum, maximum, and average driver age, vehicle age, exposure, and claim amount.
- Explore policy distributions by region, fuel type, vehicle brand, area, and reported claim count.
- Count policies with and without reported claims using `ClaimNb`.

### Claims & Segment Analysis (`SQL Notes 2.sql`)
- Calculate total claim-record count, total claim amount, and average claim amount from the claims table.
- Join policy and claim tables on `IDpol` to summarize claim records and claim amounts by **region**, **vehicle fuel type**, and **vehicle brand**.
- Check for `NULL` and empty-string fuel-type values while validating a Power BI donut chart.
- Recheck unmatched claim rows and their total claim amount using `LEFT JOIN`.

**SQL techniques demonstrated:** `COUNT`, `COUNT(DISTINCT)`, `SUM`, `AVG`, `MIN`, `MAX`, `ROUND`, `GROUP BY`, `HAVING`, `ORDER BY`, `INNER JOIN`, `LEFT JOIN`, `IS NULL`, `TRIM`, and conditional filters.

> These files contain the SQL queries, not exported result tables. The README does not claim specific validation outcomes (such as zero duplicates or zero unmatched claims) without query outputs.

## Project Files

```text
Motor-Insurance-Analytics-SQL-PowerBI/
├── README.md
├── Insurance new.pbix
├── SQL Notes.sql
├── SQL Notes 2.sql
└── Screenshots/                   # Add when screenshots are available
    ├── Executive_Overview.png
    └── Customer_Vehicle_Analysis.png
```

## Dashboard Pages

### 1. Executive Overview
A high-level view of the insurance portfolio and claims experience.

**KPI cards**
- Total Policies
- Total Claims
- Total Claim Amount
- Average Claim Severity
- Claim Rate %

**Visual analyses**
- Claim Amount by Fuel Type
- Claims by Vehicle Brand
- Claims by Area
- Top 10 Regions by Claim Amount

**Interactive filters:** Region, Area, Vehicle Brand, and Fuel Type.

### 2. Customer & Vehicle Analysis
Examines how insurance claims differ across driver and vehicle characteristics.

**KPI cards**
- Total Claims
- Total Claim Amount
- Average Claim Severity

**Visual analyses**
- Average Claim Severity by Driver Age Group
- Claim Frequency by Driver Age Group
- Loss Cost per Exposure by Vehicle Age Group
- Top 5 High-Risk Regions
- Claim Frequency by Bonus-Malus Group
- Population Density vs Claim Frequency by Region

**Interactive filters:** Region, Vehicle Brand, Driver Age Group, and Vehicle Age Group.

> **Dashboard interpretation note:** Chart names describe the report's displayed labels. Validate the underlying DAX measures, axes, and definitions before drawing business conclusions from individual charts.

## Analytical Workflow
1. Review policy and claims datasets and their fields.
2. Use the supplied SQL scripts to check record counts, keys, missing values, policy-to-claim relationships, and claims by segment.
3. Prepare and transform data for reporting using Power Query.
4. Build the model and measures in Power BI.
5. Create interactive report pages for overall performance and customer/vehicle analysis.
6. Compare risk indicators across segments to support exploratory business analysis.

## Dataset
**Source:** French Motor Third-Party Liability Insurance dataset, available on Kaggle.

The dashboard is based on policy-level and claims-level data. Check the original dataset's terms and documentation before redistributing source files.

## Power BI File
Open **`Insurance new.pbix`** in Power BI Desktop to explore the interactive report.

## Dashboard Preview
Add screenshots of both Power BI report pages to a `Screenshots` folder and embed them here:

```markdown
![Executive Overview](Screenshots/Executive_Overview.png)
![Customer & Vehicle Analysis](Screenshots/Customer_Vehicle_Analysis.png)
```

## Business Questions Explored
- How are overall claim volume, claim amount, and average severity distributed?
- Which geographic areas and vehicle brands account for more claims?
- How do claim patterns vary by driver age and vehicle age?
- How do fuel type and bonus-malus categories relate to observed claims?
- Which regions merit closer risk review?

## Important Notes
- This is an **analytics and reporting** project, not a predictive machine-learning model.
- Observed correlations or high-risk segments do not by themselves establish causation.
- Refreshing the report on another computer may require updating local data-source paths in Power Query.

---
**Portfolio project:** Motor Insurance Analytics · SQL · Power BI
