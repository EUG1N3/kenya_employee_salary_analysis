WITH ranked AS (
  SELECT department, full_name, salary_kes,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary_kes DESC) AS salary_rank
  FROM employees
)
SELECT department, full_name, salary_kes
FROM ranked
WHERE salary_rank = 2
ORDER BY department, full_name;
