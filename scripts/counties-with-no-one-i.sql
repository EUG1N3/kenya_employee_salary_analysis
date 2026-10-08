SELECT DISTINCT e.county
FROM employees e
WHERE NOT EXISTS (
  SELECT 1
  FROM employees d
  WHERE d.department = 'Data'
    AND d.county = e.county
)
ORDER BY e.county;
