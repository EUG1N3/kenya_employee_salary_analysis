WITH dept_avg AS (
  SELECT department, AVG(salary_kes) AS avg_salary
  FROM employees
  GROUP BY department
)
SELECT e.full_name, e.department, e.salary_kes,
  ROUND(e.salary_kes - a.avg_salary) AS above_avg_by
FROM employees e
JOIN dept_avg a ON e.department = a.department
WHERE e.salary_kes > a.avg_salary
ORDER BY above_avg_by DESC, full_name ASC;
