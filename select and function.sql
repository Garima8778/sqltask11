CREATE OR REPLACE FUNCTION summarize_employees()
RETURNS TEXT AS $$
DECLARE
    total_employees INTEGER;
BEGIN
    -- Count all employees
    SELECT COUNT(*) INTO total_employees FROM employees;

    RETURN 'Total number of employees: ' 
END;
$$ LANGUAGE plpgsql;

select summarize_employees()