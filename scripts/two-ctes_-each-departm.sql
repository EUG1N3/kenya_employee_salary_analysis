WITH dept_totals AS (
  SELECT department, SUM(salary_kes) AS monthly_bill
  FROM employees
  GROUP BY department
),
company_total AS (
  SELECT SUM(salary_kes) AS total_bill FROM employees
)
SELECT d.department, d.monthly_bill,
  ROUND(CAST(100.0 * d.monthly_bill / c.total_bill AS NUMERIC), 1) AS share_pct,
  RANK() OVER (ORDER BY d.monthly_bill DESC) AS bill_rank
FROM dept_totals d
CROSS JOIN company_total c
ORDER BY bill_rank;
