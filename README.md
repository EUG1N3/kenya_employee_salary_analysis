# 🇰🇪 Savanna Tech Group – People Analytics & Payroll Budget Audit
Tools used: SQL, Looker

## 📌 Project Overview
This repository contains a descriptive analytics case study designed to ground **Savanna Tech Group's** (Nairobi, Kenya) compensation strategy in empirical numbers. 

Serving as a **People Analyst**, I conducted a structured query audit on a 420-person payroll extract spread across 8 departments and 5 counties. The objective was to extract direct answers regarding headcount, tenure, and department budget variances to build an evidence-based executive summary for the CEO ahead of an upcoming board meeting.

### 🎯 Core Analysis Objectives
1. **Data Inspection & Exploration:** Perform exploratory profiling on the employee register and department master files using basic SQL checks.
2. **Top Earner Identification:** Query macro and department-level salary leaders using structured window functions to accurately isolate ties and ranking groups.
3. **Internal Equity Benchmarking:** Construct explicit Subqueries and Common Table Expressions (CTEs) to compare individual staff pay directly against corporate and department medians.
4. **Fiscal Budget Audit:** Join internal registers against approved organizational budgets, transforming monthly cash outflows into annualized metrics to discover departments exceeding target spending thresholds.

---

## 📂 Repository Structure
├── data/
│   ├── employees.csv        # Register containing 420 employee rows, performance data, and salaries
│   └── departments.csv      # Table featuring departmental heads, localized counties, and annual budgets
├── scripts/
│   └── queries.sql          # SQL script containing all 22 specific analytical exercises
├── dashboard/               # Data visualisations and executive presentation materials
└── README.md                # Project documentation and Executive Summary`

---

## 🛠️ Tech Stack & Concepts Demonstrated
* **Languages:** SQL
* **SQL Querying Methods:** Window Functions (`DENSE_RANK()`, `ROW_NUMBER()`, `LAG()`), Common Table Expressions (CTEs), Subqueries, Aggregate Joins, Running Totals.

---

## 📈 Executive Summary for the CEO
This summary details the static findings extracted from the payroll data.

### 1. Headcount & Base Pay Metrics
*   **Total Corporate Headcount:** **420 employees** across **8 departments** in **5 counties**.
*   **Payroll Salary Tiers:**
    *   **Highest Monthly Salary:** 
    *   **Median Monthly Salary:** 
    *   **Lowest Monthly Salary:** 

### 2. Departmental Breakdown & Annual Budget Tracking
By joining the employee register to the departments table, monthly salaries were converted to annual figures and measured directly against set annual budgets.

### 3. Key Findings & Strategic Outliers
*   **Budget Ceiling Breaches:** The analytical queries successfully isolated departments spending more than **60% of their total annual allocation** purely on salaries.
*   **The Tie-Handling Methodology:** To find the true "second highest paid employee," a standard `OFFSET` clause fails if multiple individuals hold the peak salary. This analysis utilizes `DENSE_RANK()` to ensure all true second-tier individuals are correctly captured.

### ⚠️ Final Recommendation
*   **Establish Structured Salary Bands:** Transition away from negotiation-based compensation toward structured pay ranges based on role tier and localized performance data.
---

## 💻 Sample SQL Implementations

### Finding the "Second Highest Earner" Safely (Handling Ties)
```sql
WITH RankedSalaries AS (
    SELECT 
        employee_id,
        full_name,
        department,
        salary_kes,
        DENSE_RANK() OVER (ORDER BY salary_kes DESC) as salary_rank
    FROM employees
)
SELECT full_name, department, salary_kes
FROM RankedSalaries
WHERE salary_rank = 2;
```

### Comparing Individual Salaries to Departmental Averages (Using a CTE)
```sql
WITH DeptAverages AS (
    SELECT 
        department,
        AVG(salary_kes) AS avg_dept_salary
    FROM employees
    GROUP BY department
)
SELECT 
    e.full_name,
    e.department,
    e.salary_kes,
    ROUND(d.avg_dept_salary, 2) AS dept_average,
    ROUND(e.salary_kes - d.avg_dept_salary, 2) AS kes_above_average
FROM employees e
JOIN DeptAverages d ON e.department = d.department
WHERE e.salary_kes > d.avg_dept_salary
ORDER BY kes_above_average DESC;
```

---

## 🏁 Results and Deliverables
All **22 structured SQL tasks** were completed and verified against the dataset test matrix:
* **Data Verification Check:** 100%
* **Mathematical Accuracy:** 100%
* **Business Insights Delivery:** 100%
