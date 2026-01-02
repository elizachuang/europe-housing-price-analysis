
---Step 1 Exlopre the data
select distinct *
from housing_europe he
limit 15;

--- Step 2 Check for missing values
select *
from housing_europe he 
where he."OBS_VALUE" is null;

--- Step 3 create a cleaned table
create table house_price_index_cleaned as 
select he.geo , he."TIME_PERIOD" , he."OBS_VALUE" 
from housing_europe he
WHERE he."OBS_VALUE" is NOT null
order by he."OBS_VALUE" DESC;

