SELECT department,
  ROUND(AVG(CASE WHEN gender = 'Female' THEN salary_kes END)) AS avg_female,
  ROUND(AVG(CASE WHEN gender = 'Male' THEN salary_kes END)) AS avg_male,
  ROUND(AVG(CASE WHEN gender = 'Male' THEN salary_kes END)) - ROUND(AVG(CASE WHEN gender = 'Female' THEN salary_kes END)) AS gap
FROM employees
GROUP BY department
ORDER BY department;
