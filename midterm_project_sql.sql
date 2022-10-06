create table emissions (
    Country varchar,
    Pollutant varchar,
    variable varchar,
    year_ int,
    powercode varchar,
    unit varchar,
    value_ varchar)
;
CREATE TABLE Temperature (
    AVG_Temp float,
    AVG_Temp_uncert float,
    country varchar,
    year_ int,
    month_ int,
    day_ int
);

-- select * from Temperature
-- where country='Australia' and year_=2000;

create table temperature_by_year as
select country, year_, avg(avg_temp) as yearly_avg_temp, avg(avg_temp_uncert) as yearly_avg_uncert
from temperature
group by country, year_
order by country, year_

create table temp_1990 as
select country, yearly_avg_temp, year_
from Temperature_by_year
where year_=1990
group by country, year_, yearly_avg_temp;

create table temp_2013 as
select country, yearly_avg_temp, year_
from Temperature_by_year
where year_=2013
group by country, year_, yearly_avg_temp;

create table emission_1990 as
select country, pollutant, powercode, variable,value_, unit, year_
from emissions
where pollutant='Greenhouse gases' and year_ = 1990 and variable= 'Total  emissions excluding LULUCF';

create table emission_2013 as
select country, pollutant, powercode, variable,value_, unit, year_
from emissions
where pollutant='Greenhouse gases' and year_ = 2013 and variable= 'Total  emissions excluding LULUCF';

-- select * from temperature_by_year

------QUESTION 1
select country, yearly_avg_temp, year_
from Temperature_by_year
where year_=1990
group by country, year_, yearly_avg_temp;

select country, yearly_avg_temp, year_
from Temperature_by_year
where year_=2013
group by country, year_, yearly_avg_temp;

-- select * from emissions
-- where country= 'Australia' and year_=2000

-----QUESTION 2
select country, pollutant, powercode, variable,value_, unit, year_
from emissions
where pollutant='Greenhouse gases' and year_ = 1990 and variable= 'Total  emissions excluding LULUCF';

select country, pollutant, powercode, variable,value_, unit, year_
from emissions
where pollutant='Greenhouse gases' and year_ = 2013 and variable= 'Total  emissions excluding LULUCF';

-- select count(*)
-- from temperature_by_year t
-- left join emissions e on t.country=e.country and t.year_=e.year_
-- where t.country='Australia' and t.year_=2000;

-- Count Check:
-- emissions year = 31
-- temperature year = 24
-- emissions countries = 63
-- temperature countries = 57

-- select distinct country, year_
-- from emissions;

-- select 63*31*47*12;

-------QUESTION 3
select temp_1990.country, (temp_2013.yearly_avg_temp - temp_1990.yearly_avg_temp) as difference_in_temp
from temp_2013
join temp_1990 on temp_1990.country=temp_2013.country
order by difference_in_temp desc;

------ Altering the value_ column data type in emission tables
alter table emission_1990 alter column value_ type float using value_::float;
alter table emission_2013 alter column value_ type float using value_::float;

------ QUESTION 4
select emission_1990.country, (emission_2013.value_ - emission_1990.value_) as difference_in_emission
from emission_2013
join emission_1990 on emission_1990.country=emission_2013.country
order by difference_in_emission desc;

---- Canada graph data (Tonnes of CO2 vs Celcius)
select e.country, e.value_ , yearly_avg_temp,e.year_
from emissions e
join temperature_by_year te on e.country = te.country and e.year_ = te.year_
where e.variable = 'Total  emissions excluding LULUCF' and e.pollutant = 'Greenhouse gases' and e.country = 'Canada'

---- Denmark graph data
select e.country, value_ , yearly_avg_temp,e.year_
from emissions e
join temperature_by_year te on e.country = te.country and e.year_ = te.year_
where e.variable = 'Total  emissions excluding LULUCF' and e.pollutant = 'Greenhouse gases' and e.country = 'Denmark'

-- All graph
select e.country, value_ , yearly_avg_temp,e.year_
from emissions e
join temperature_by_year te on e.country = te.country and e.year_ = te.year_
where e.variable = 'Total  emissions excluding LULUCF' and e.pollutant = 'Greenhouse gases'


