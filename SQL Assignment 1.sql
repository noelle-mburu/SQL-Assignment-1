select *
from assignment.international_debt_with_missing_values idwmv ;

--What is the total amount of debt owed by all countries in the dataset?
select
 CAST(sum(debt)/1000000 as numeric (12,2)) as Total_debt_in_millions
from assignment.international_debt_with_missing_values;
 
--How many distinct countries are recorded in the dataset?
select 
 Count (distinct country_name) as Total_distinct_countries
from assignment.international_debt_with_missing_values;
 
--What are the distinct types of debt indicators, and what do they represent?

select distinct indicator_name
from assignment.international_debt_with_missing_values idwmv;

--Which country has the highest total debt, and how much does it owe?
select country_name,
 sum(debt) as Total_debt_per_country
from assignment.international_debt_with_missing_values 
 group by country_name
 order by sum(debt) desc
 limit 2;
 
--What is the average debt across different debt indicators?
select indicator_name,
 cast(avg(debt)/1000000 as numeric(10, 2)) as average_debt_in_millions
from assignment.international_debt_with_missing_values
 group by indicator_name
 order by avg(debt) asc;
 
--Which country has made the highest amount of principal repayments?
select country_name,
 cast(sum(debt)/1000000 as numeric (10,2)) as Total_principal_repayments_in_millions
from assignment.international_debt_with_missing_values
 where indicator_name Ilike '%Principal repayments%'
 and country_name is not null
 and debt is not null
 group by country_name
 order by Total_principal_repayments_in_millions desc
 limit 1;

 
--What is the most common debt indicator across all countries?
select indicator_name,
count(indicator_name) as count_of_debt_indicator
from assignment.international_debt_with_missing_values idwmv 
where indicator_name is not null
group by indicator_name
order by count(indicator_name) desc
limit 1;
 
--Identify any other key debt trends and summarize your findings.
