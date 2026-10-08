WITH banded AS (
  SELECT CASE 
    WHEN salary_kes < 80000 THEN 'Under 80k'
    WHEN salary_kes < 150000 THEN '80k to 150k'
    WHEN salary_kes < 250000 THEN '150k to 250k'
    ELSE '250k and above'
  END AS salary_band
  FROM employees
)
SELECT salary_band, COUNT(*) AS employees
FROM banded
GROUP BY salary_band
ORDER BY employees DESC;
