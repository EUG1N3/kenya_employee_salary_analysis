SELECT full_name, job_title, salary_kes
FROM employees
WHERE county = 'Nairobi' AND department = 'Engineering'
ORDER BY salary_kes DESC, full_name ASC