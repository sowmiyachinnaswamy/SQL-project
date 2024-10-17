use sowmiya;
select * from ev_survey;
 
-- 1. query to merge two columns and display the first letter in capital

select brand,city,concat(upper(left(city,1)),lower(substring(city,2))," ",
upper(left(Brand,1)),lower(substring(Brand,2))) as brandcity from ev_survey;

-- 2.write a query to find the names of the brands which are not repeated
-- also find the brands which are released in the year 2017 which is not repeated.

select distinct(brand) from ev_survey;
select distinct(brand) from ev_survey where `Model Year`=2017;

-- 3.find the total number of district has electric vehicle running 

select count(District) from ev_survey

-- 4. write a query to find the average electric range of the vehicle 

select avg(`Electric Range`) from ev_survey;

-- 5.find the electric Range which is higher and lower avg electric range

select (`Electric Range`) from ev_survey
where (`Electric Range`) >(select avg(`Electric Range`) from ev_survey);

select (`Electric Range`) from ev_survey
where (`Electric Range`) <(select avg(`Electric Range`) from ev_survey);

-- 6.write a query to display the common colums from both the table

select ev.make as make,ev.model as model, ev.`Postal Code`as PC from ev_survey as ev
cross join Ev_type as t
on ev.model=t.model;

-- 7.find the electric range between 100-200

select * from ev_survey where `Electric Range` between 100 and 200;
select * from ev_survey where `Electric Range` not between 100 and 200;

-- 8.dropping column

alter table ev_survey drop column `Vehicle Location`;

-- 9. finding highest electric range

select State,max(`Electric Range`) as max_range from ev_survey
group by state order by max_range;

-- 10.finding lowest electric range
select State,min(`Electric Range`) as min_range from ev_survey
group by state order by min_range;

-- 11.find the null values from the table
select * from ev_survey where `Electric Range` is null;
