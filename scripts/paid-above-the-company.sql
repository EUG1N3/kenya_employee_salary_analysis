SELECT COUNT(employee_id) AS above_average
FROM employees
WHERE salary_kes > (SELECT AVG(salary_kes) FROM employees);