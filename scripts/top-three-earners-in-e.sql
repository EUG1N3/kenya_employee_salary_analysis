SELECT department, full_name, salary_kes, rank_in_department
FROM (
  SELECT department, full_name, salary_kes,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary_kes DESC, full_name) AS rank_in_department
  FROM employees
) ranked
WHERE rank_in_department <= 3
ORDER BY department, rank_in_department;
