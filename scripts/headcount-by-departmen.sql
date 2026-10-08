SELECT department, COUNT(employee_id) AS headcount
FROM employees
GROUP BY department
ORDER BY headcount DESC