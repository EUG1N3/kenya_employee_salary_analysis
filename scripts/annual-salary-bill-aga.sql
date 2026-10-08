SELECT d.department,
  SUM(e.salary_kes) * 12 AS annual_salary_bill,
  ROUND(CAST(100.0 * SUM(e.salary_kes) * 12 / d.annual_budget_kes AS NUMERIC), 1) AS budget_share_pct
FROM employees e
JOIN departments d ON e.department = d.department
GROUP BY d.department, d.annual_budget_kes
ORDER BY budget_share_pct DESC;
