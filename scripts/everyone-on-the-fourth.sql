SELECT full_name, department, salary_kes
FROM (
  SELECT full_name, department, salary_kes,
    DENSE_RANK() OVER (ORDER BY salary_kes DESC) AS salary_rank
  FROM employees
) ranked
WHERE salary_rank = 4
ORDER BY full_name;
