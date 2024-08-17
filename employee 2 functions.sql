select *  from employees
select age,case
when age < 50 then 'female'
when age > 50 then 'male'
else 'unknown age'
end as age_status
from employees

create or replace function checkage(age int)
returns varchar as $$
declare
age_status varchar;
begin
case
when age < 50 then age_status := 'female';
when age > 50 then age_status := 'male';
else age_status := 'unknown age';
end case;
return age_status;
end
$$ language plpgsql;
select checkage(20)

----
select * from employees

select ethnicity,
gender,
case
when ethnicity='black' and gender='female' then 'black female'
when ethnicity='asian'and gender='male' then 'asian male'
else 'unknown ethnicity or gender'
end as ethnicity_status
from employees

create or replace function check_ethnicity_gender(eth text,gender text)
returns text as $$
declare 
ethnicity_status text;
begin
case
when eth='black' and gender = 'female' then ethnicity_status := 'black female';
when eth ='asian'and gender = 'male' then ethnicity_status :=  'asian male';
else ethnicity_status := 'unknown ethnicity or gender';
end case;
return ethnicity_status;
end
$$ language plpgsql;

select check_ethnicity_gender('black','female')


SELECT ethnicity,
       gender,
       check_ethnicity_gender(ethnicity, gender) AS ethnicity_status
FROM employees;









