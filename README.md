# RetailOS: End-to-End Cloud ETL & BI Intelligence Hub

![Azure](https://img.shields.io/badge/Azure-Data%20Factory-blue?style=for-the-badge&logo=microsoftazure)
![SQL](https://img.shields.io/badge/Azure-SQL%20Database-orange?style=for-the-badge&logo=microsoftsqlserver)
![Power BI](https://img.shields.io/badge/PowerBI-Bento%20Grid-yellow?style=for-the-badge&logo=powerbi)

An enterprise-grade Business Intelligence solution that transforms raw retail data into actionable insights using a modern cloud stack. This project demonstrates the full lifecycle of a data professional: from architecting cloud pipelines to designing high-impact, "liquid glass" executive dashboards.

## 🚀 Project Overview
This repository contains the architecture and implementation of a Retail Intelligence system. The project moves beyond simple visualization by implementing a robust ETL (Extract, Transform, Load) process in the cloud, ensuring data integrity and scalability.

### **Core Objectives:**
*   **Automated Cloud ETL:** Ingesting raw `.csv` data from Azure Data Lake Gen2 into Azure SQL Database.
*   **Database Engineering:** Architecting a relational schema optimized for analytical queries with automated record tracking.
*   **Advanced DAX Modeling:** Building a star-schema model with a custom Date Table to enable sophisticated Time Intelligence.
*   **UI/UX Design:** Implementing a "Bento Grid" layout with high-contrast, neon-obsidian aesthetics for executive-level readability.

---

## 🛠️ Technical Stack
| Layer | Technology | Purpose |
| :--- | :--- | :--- |
| **Storage** | Azure Data Lake Gen2 | Raw data landing zone (Bronze Layer) |
| **Orchestration** | Azure Data Factory | Automated ETL Pipelines and schema mapping |
| **Compute** | Azure SQL Database | Structured Data Warehouse (Gold Layer) |
| **Analytics** | Power BI Desktop | Semantic modeling and DAX development |
| **Design** | AI-Generated Bento Grid | Premium "Liquid Glass" UI/UX canvas background |

---

## 🏗️ Architecture & Implementation

### **1. Cloud Data Engineering**
The pipeline begins in **Azure Data Factory**, where a `Copy Data` activity orchestrates the movement of retail records from a data lake to a production-ready SQL environment.
*   **Schema Enforcement:** Explicitly mapping source CSV columns to SQL data types to ensure data quality.
*   **Automation:** Leveraged `DEFAULT GETDATE()` and `IDENTITY` keys in SQL to automate metadata tracking (Upload Time) and primary key generation.

### **2. Semantic Modeling & DAX**
The Power BI model utilizes a dedicated **Date Table** to move beyond default "Auto Date/Time" features, allowing for customized fiscal and calendar analysis.
**Key Measures Developed:**
*   **Net Revenue:** Calculated as `SUM(FinalAmount)` to track actual earnings.
*   **Discount Rate %:** A `DIVIDE` function logic used to measure the efficiency of promotional spend.
*   **Average Order Value (AOV):** A custom measure used to evaluate customer spend behavior per transaction.

### **3. UI/UX Design Strategy**
The visual layer utilizes a **Bento Grid** layout, providing a structured, modular feel.
*   **High-Contrast Aesthetic:** Uses a neon cyan and electric purple palette against a dark obsidian "liquid glass" background.
*   **Actionable Insights:** Prioritizes high-level KPIs (Total Units, Gross/Net Revenue) while providing granular drill-downs into Product and Aisle performance.

---

## 📂 Repository Structure
```text
├── SQL_Scripts/
│   └── Create_Retail_Table.sql    # Table definitions, constraints, and identity keys
├── PowerBI_Project/
│   └── RetailOS.pbip              # PBIP format for Git-based version control
├── Data_Source/
│   └── grocery_chain_data.csv     # Raw retail dataset (Source)
└── Assets/
    └── dashboard_preview.jpg      # High-resolution screenshot of the final UI
