# RetailOS: Step-by-Step Build Guide

This guide outlines the end-to-end development process for the **RetailOS** project. It serves as a technical blueprint for data professionals looking to replicate this cloud-to-dashboard pipeline, bridging the gap between Data Engineering and Business Intelligence.

---

## Phase 1: Cloud Infrastructure & Data Engineering

### 1. Storage & Landing Zone (Bronze Layer)
*   Provisioned an **Azure Data Lake Gen2** account.
*   Created a container (`raw-data`) and uploaded the source retail `.csv` files to act as the initial landing zone.

### 2. Azure SQL Database (Gold Layer)
*   Provisioned an **Azure SQL Database** to serve as the structured data warehouse.
*   Executed the following T-SQL script to enforce schema types, automate primary key generation (`IDENTITY`), and track ingestion timestamps (`DEFAULT GETDATE()`):

```sql
CREATE TABLE dbo.RetailSales (
    RecordID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    StoreName NVARCHAR(100),
    TransactionDate DATE,
    Aisle NVARCHAR(50),
    ProductName NVARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalAmount DECIMAL(10, 2),
    DiscountAmount DECIMAL(10, 2),
    FinalAmount DECIMAL(10, 2),
    LoyaltyPoints INT,
    UploadedAt DATETIME2 DEFAULT GETDATE()
);
```

### 3. Orchestration with Azure Data Factory (ADF)
*   Created an ADF pipeline using the **Copy Data** activity.
*   Set the Source to the Gen2 Data Lake and the Sink to the Azure SQL Database.
*   Explicitly mapped the CSV columns to the SQL schema, ensuring data integrity and preventing truncation errors during pipeline execution.

---

## Phase 2: Semantic Modeling in Power BI

### 1. Data Ingestion
*   Connected Power BI Desktop to the Azure SQL Database using **Import Mode**.

### 2. Dimensional Modeling (Date Table)
To enable robust Time Intelligence and avoid the performance bloat of Power BI's "Auto Date/Time", a dynamic, custom Date table was generated using DAX:

```dax
DateTable = 
VAR MinYear = YEAR(MIN(RetailSales[TransactionDate]))
VAR MaxYear = YEAR(MAX(RetailSales[TransactionDate]))
RETURN
ADDCOLUMNS (
    CALENDAR ( DATE(MinYear, 1, 1), DATE(MaxYear, 12, 31) ),
    "Year", YEAR([Date]),
    "Month Short", FORMAT([Date], "MMM"),
    "Month Number", MONTH([Date])
)
```

### 3. Key Analytical Measures
Abstracted all business logic into explicit DAX measures stored in a dedicated `_KeyMeasures` table. Examples include:
*   **Net Revenue:** `SUM(RetailSales[FinalAmount])`
*   **Average Order Value (AOV):** `DIVIDE([Net Revenue], COUNTROWS(RetailSales), 0)`

---

## Phase 3: UI/UX & Visualization (Bento Grid)

### 1. Canvas Preparation
*   Utilized an AI-generated 16:9 high-contrast, "Liquid Glass" bento grid layout (deep obsidian with neon cyan/purple accents).
*   Imported the image as the Canvas Background with 0% transparency and "Fit" scaling.

### 2. Visual Architecture
*   **KPI Command Center (Top Right):** Utilized the Card (New) visual with transparent backgrounds to display Gross Revenue, Net Revenue, Discounts, and Units Sold.
*   **Trend Analysis (Top Left):** Implemented an Area Chart (Net Revenue by Month) with a custom cyan line, 85% area transparency, and high/low data labels.
*   **Categorical Performance (Bottom):** Deployed a Donut Chart for Store Share (Legend disabled, percentage detail labels enabled) and horizontal Bar Charts for Aisle/Product performance.

---

## Phase 4: CI/CD & Version Control

*   Saved the project in the **Power BI Project (`.pbip`)** format, exposing the underlying text-based metadata (`.json` and `.bim` files).
*   Configured a `.gitignore` file to exclude raw local data sets (`.csv`, `.xlsx`, `.json`) from version control.
*   Initialized a local Git repository and pushed the structured project files to GitHub for portfolio display.

***
Iswzr