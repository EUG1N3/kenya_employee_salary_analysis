SELECT full_name, department, hire_date
FROM employees
WHERE hire_date < DATE '2016-01-01'
  AND performance_rating = 5
ORDER BY hire_date ASC, full_name ASC;
