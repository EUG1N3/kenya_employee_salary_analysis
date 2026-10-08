SELECT department, ROUND(AVG(salary_kes)) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC