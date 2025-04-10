--What is the total amount of debt owed by all countries in the dataset?
select
 CAST(SUM(debt) / 1000000 AS numeric(12, 2)) AS total_debt_in_millions
from "assignment".international_debt_with_missing_values idwmv;
--How many distinct countries are recorded in the dataset?
select 
 count(distinct country_name) as unique_countries
from international_debt_with_missing_values idwmv ;

--What are the distinct types of debt indicators, and what do they represent?
select 
distinct indicator_name
from international_debt_with_missing_values idwmv;

--Which country has the highest total debt, and how much does it owe?
select distinct country_name,
sum(debt) as total_debt
from international_debt_with_missing_values idwmv
group by country_name order by sum(debt) desc
limit 2;

--What is the average debt across different debt indicators?
select distinct(indicator_name),
avg (debt)
from international_debt_with_missing_values idwmv 
group by indicator_name;

--Which country has made the highest amount of principal repayments?
select distinct country_name,
sum(debt)
from international_debt_with_missing_values idwmv 
where indicator_name like '%Principal repayments%' 
group by country_name
having sum(debt) >= 0
order by sum(debt) desc;

--What is the most common debt indicator across all countries?
select indicator_name,
count(indicator_name)
from international_debt_with_missing_values idwmv 
group by indicator_name
order by count (indicator_name) desc;

--Identify any other key debt trends and summarize your findings.

select *
from international_debt_with_missing_values idwmv 








