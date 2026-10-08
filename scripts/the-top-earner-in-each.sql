SELECT e.department, e.full_name, e.salary_kes
FROM employees e
WHERE e.salary_kes = (
  SELECT MAX(salary_kes)
  FROM employees
  WHERE department = e.department
)
ORDER BY e.department, e.full_name;
