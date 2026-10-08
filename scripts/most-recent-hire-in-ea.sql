SELECT department, full_name, hire_date
FROM (
  SELECT department, full_name, hire_date,
    ROW_NUMBER() OVER (PARTITION BY department ORDER BY hire_date DESC) AS rn
  FROM employees
) numbered
WHERE rn = 1
ORDER BY department;
