

SELECT * FROM corona_virus.corona;

select * from corona_virus.corona; -- The dataset consists of 8 columns--
select count(*) as number_of_rows from corona_virus_dataset; -- The dataset consists of 78386 rows--

-- I had to alter the table in order to change the datatype from text to date--
Alter table corona_virus.corona
modify Date date;



-- case  questions --

-- 1. Write a code to check null values?. --
select count(*) as number_of_null_values 
from corona_virus.corona
where province is null; 
-- OR --
select sum(
case when province is null then 1 else 0 end) as count_of_province_null,
sum(case when country is null then 1 else 0 end) as count_of_country_null,
sum(case when latitude is null then 1 else 0 end) as count_of_latitiude_null,
sum(case when longitude is null then 1 else 0 end) as count_of_longitude_null,
sum(case when date is null then 1 else 0 end) as count_of_date_null,
sum(case when confirmed is null then 1 else 0 end) as count_of_confirmed_null,
sum(case when deaths is null then 1 else 0 end) as count_of_death_null,
sum(case when recovered is null then 1 else 0 end) as count_of_recovered_null
from corona_virus.corona;               


-- 2. This result shows that there are no null records, so there is no need to update --

-- 3. Check total number of rows
select count(*) as number_of_rows from corona_virus.corona;


-- 4. Check what is start_date and end_date--
select min(Date) as start_date, max(Date) as end_date
from corona_virus.corona;


-- 5. Number of month present in dataset --
SELECT timestampdiff(MONTH,'2020-01-22', '2021-06-13') as Number_of_Months
 from corona_virus.corona
limit 1;


-- 6. Find the monthly average for confirmed, deaths, recovered  --
SELECT monthname(date) AS month_name, date_format(date, '%m-%Y') as months, 
avg(confirmed) as Average_confirmed,
avg(deaths) as Average_deaths,
avg(recovered) as Average_recoverd
from corona_virus.corona
group by month_name, months;



-- 7. Find the most frequent value for confirmed, death, recovered each month --
SELECT
MONTHNAME(date) AS Month, confirmed
FROM corona_virus.corona
GROUP BY Month, confirmed
order by Confirmed desc
limit 1;

SELECT
MONTHNAME(date) AS Month, deaths
FROM corona_virus.corona
GROUP BY Month, deaths
order by Deaths desc
limit 1;

SELECT MONTHNAME(Date) AS Month, recovered
FROM corona_virus.corona
GROUP BY Month, recovered
ORDER BY recovered desc
LIMIT 1;



-- 8. Find minimum values for confirmed, deaths, and recovered cases per year --
select year(date) as YEAR,
min(confirmed) as minimum_value_for_confirmed,
min(deaths) as minimum_value_for_deaths,
min(recovered) as minimum_value_for_recovered
from corona_virus.corona
group by year;


-- 9. Find minimum values for confirmed, deaths, and recovered cases per year --
select year(date) as YEAR,
max(confirmed) as maximum_value_for_confirmed,
max(deaths) as maximum_value_for_deaths,
max(recovered) as maximum_value_for_recovered
from corona_virus.corona
group by year;


-- 10. The total number of case confirmed, deaths, recovered each month --
select monthname(date) as months,
sum(confirmed) as Total_number_of_Confirmed,
sum(deaths) as Total_number_of_Deaths,
sum(recovered) as Total_number_of_Recovered
from corona_virus.corona
group by months;


-- 11. Check how corona virus spread out with respect to confirmed case. E.g: total case confirmed, their average, variance and standard deviation  --
-- Sum --
select monthname(date) as months, 
sum(confirmed) as Number_of_Confirmed_case
from corona_virus.corona
group by months;
-- Average --
select monthname(date) as months, 
AVG(confirmed) as Average_Number_of_Confirmed_case,
ROUND(AVG(confirmed), 2) as Average_Number_of_Confirmed_case
from corona_virus.corona
group by months;
-- Variance --
select monthname(date) as months, 
var_pop(confirmed) as Variance_case,
ROUND(var_pop(confirmed), 2) as Variance_of_Confirmed_case
from corona_virus.corona
group by months;
-- Standard deviation of confirmed cases --
select monthname(date) as months, 
stddev_pop(confirmed) as StandardDeviation_of_Confirmed_case,
ROUND(stddev_pop(confirmed), 2) as StandardDeviation_of_Confirmed_case
from corona_virus.corona
group by months;


-- 12. Check how corona virus spread out with respect to death case. E.g: total case confirmed, their average, variance and standard deviation  --
-- Sum --
select monthname(Date) as months, 
sum(Deaths) as Number_of_Death_case
from corona_virus.corona
group by months;
-- Average --
select monthname(Date) as months, 
AVG(Deaths) as Average_Number_of_Death_case,
ROUND(AVG(Deaths), 2) as Average_Number_of_Death_case
from corona_virus.corona
group by months;
-- Variance --
select monthname(date) as months, 
var_pop(Deaths) as Variance_of_Death_case,
ROUND(var_pop(Deaths), 2) as Variance_of_Death_case
from corona_virus.corona
group by months;
-- Standard deviation --
select monthname(date) as months, 
stddev_pop(Deaths) as StandardDeviation_of_Death_case,
ROUND(stddev_pop(Deaths), 2) as StandardDeviation_of_Death_case
from corona_virus.corona
group by months;

-- 13. Check how corona virus spread out with respect to recovered case. E.g: total case confirmed, their average, variance and standard deviation  --
-- Sum --
select monthname(date) as months, 
sum(Recovered)  as Number_of_Recovered_case
from corona_virus.corona
group by months;
-- Average --
select monthname(date) as months, 
AVG(Recovered) as Average_Number_of_Recovered_case,
ROUND(AVG(Recovered), 2) as Average_Number_of_Recovered_case
from corona_virus.corona
group by months;
-- Variance --
select monthname(date) as months, 
var_pop(Recovered) as Variance_of_Recovered_case,
ROUND(var_pop(recovered), 2) as Variance_of_Recovered_case
from corona_virus.corona
group by months;
-- Standard deviation --
select monthname(date) as months, 
stddev_pop(Recovered) as StandardDeviation_of_Recovered_case,
ROUND(stddev_pop(recovered), 2) as StandardDeviation_of_Recovered_case
from corona_virus.corona
group by months;


-- 14. Find the country having the highest number of confirmed cases --
select country, 
sum(Confirmed) as Highest_number_of_confirmed
from corona_virus.corona
group by country
order by Highest_number_of_confirmed desc
limit 1;


-- 15 Find country having the lowest number of death case  --
select country, 
sum(Deaths) as Lowest_number_of_Death
from corona_virus.corona
group by country
order by Lowest_number_of_Death
limit 1;



-- 16. Find top 5 countries having the highest recovered cases --
select country,
sum(recovered) as Highest_Recovered_Cases
from corona_virus.corona
group by country
order by Highest_Recovered_Cases DESC
limit 5;

