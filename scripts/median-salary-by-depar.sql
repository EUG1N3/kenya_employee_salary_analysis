SELECT department,
  ROUND(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY salary_kes)::numeric) AS median_salary
FROM employees
GROUP BY department
ORDER BY median_salary DESC, department ASC;
