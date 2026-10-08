SELECT salary_kes, COUNT(*) AS employees
FROM employees
GROUP BY salary_kes
HAVING COUNT(*) >= 3
ORDER BY employees DESC, salary_kes DESC;
