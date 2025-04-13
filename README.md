SQL DOCUMENTATION FOR INTERNATIONAL DEBT WITH MISSING VALUES

QUERY 1.	What is the total amount of debt owed by all countries in the dataset?
select
 CAST(sum(debt)/1000000 as numeric (12,2)) as Total_debt_in_millions
from assignment.international_debt_with_missing_values;

EXPLANATION:
This question requires us to add the total debt from all the countries in the data set. This requires the use of the SUM function.
•	Since the answer is in trillions, we use the CAST function to convert the number into millions.
•	The SUM function adds up the numeric functions in the debt column.
•	The CAST function converts a value from one data type to another. In this case, from float4 to numeric (12, 2).
•	The Alias/As function is used to give the result column a clear name for reference purposes.

QUERY 
2.	How many distinct countries are recorded in the dataset?
select 
 Count (distinct country_name) as Total_distinct_countries
from assignment.international_debt_with_missing_values;

EXPLANATION:
This question requires us to count the number of unique countries within our dataset. This requires the use of the COUNT and DISTINCT functions. 
•	The COUNT function counts the number of DISTINCT country names.
•	The DISTINCT function ensures there are no duplicates counted.
•	The Alias/As function is used to give the result column a clear name for reference purposes.

QUERY 
3.	What are the distinct types of debt indicators, and what do they represent?
select distinct indicator_name
from assignment.international_debt_with_missing_values;

EXPLANATION:
This requires a list of each distinct debt indicator. Since there are duplicates within the indicator_name column, we use the DISTINCT function to list only the UNIQUE functions.
•	The DISTINCT function ensures there are no duplicate indicator names listed.

QUERY 
4.	Which country has the highest total debt, and how much does it owe?
select country_name,
 sum(debt) as Total_debt_per_country
from assignment.international_debt_with_missing_values 
 group by country_name
 order by sum(debt) desc
 limit 1;

EXPLANATION:
This requires us to sum the total debt per country and show the one with the highest debt. Since the country names have duplicates, we’ll use the GROUP BY function to group individual countries together.
•	SUM function adds up the debt in each group
•	Alias/As function gives the result column an identifiable name
•	GROUP BY function groups together countries with the same name/duplicates
•	ORDER BY DESC lists the result column in descending order
•	LIMIT function limits the results to 1 result

QUERY 
5.	What is the average debt across different debt indicators?
select indicator_name,
 cast(avg(debt)/1000000 as numeric(10, 2)) as average_debt
from assignment.international_debt_with_missing_values 
 group by indicator_name
 order by avg(debt) asc;

EXPLANATION:
This question requires an average of each debt indicator.
•	AVG function finds the average debt of each group
•	CAST function converts the data type from float4 to numeric (10, 2) and rounds the results into millions
•	GROUP BY function groups duplicates of each debt indicator together
•	ORDER BY ASC sorts the results in ascending order
•	Alias/As function gives the result column an identifiable name

QUERY 
6.	Which country has made the highest amount of principal repayments?
select country_name,
 cast(sum(debt)/1000000 as numeric (10,2)) as Total_principal_repayments_in_millions
from assignment.international_debt_with_missing_values
 where indicator_name Ilike '%Principal repayments%'
 and country_name is not null
 and debt is not null
 group by country_name
 order by Total_principal_repayments_in_millions desc
 limit 1;

EXPLANATION:
This question requires the sum of principle repayments to identify the highest one
•	SUM function adds the debt per country
•	CAST function converts the data type to numeric (10, 2)
•	Alias/As function gives the result column an identifiable name
•	WHERE acts filters the records
•	AND function ensures the country name and debt column cannot be null
•	ILIKE specifies the condition for the filter and is not case sensitive
•	GROUP BY groups the country name duplicates together
•	ORDER BY DESC sorts the results in descending order
•	LIMIT 1 limits the results to 1

QUERY 
7.	What is the most common debt indicator across all countries?
select indicator_name,
 count(indicator_name) as count_of_debt_indicator
from assignment.international_debt_with_missing_values idwmv 
 group by indicator_name
 order by count(indicator_name) desc
 limit 1;

EXPLANATION:
This question needs us to count the number of times an indicator name appears.
•	COUNT function counts the number of times an indicator appears across all countries
•	Alias/As function gives the result column an identifiable name
•	GROUP BY function groups indicator name duplicates together
•	ORDER BY DESC sorts the results in descending order
•	LIMIT 1 limits the results to 1to show us the most common debt indicator

INSIGHTS FROM THE DATA
•	There are 125 countries in debt in the data set out of 195 countries in the world. This amounts to 64% of the world in debt. This indicates an over-reliance on external financing in more than half of the world.
•	China owes 266.46 billion in debt. This highlights its dependence on external financing rather than domestic resources and revenue generation.
•	The average debt across the different debt indicators shows the varying debt instruments used by various countries across the world.
•	China has the highest amount of principal repayments indicating financial stability and proper resource allocation.
