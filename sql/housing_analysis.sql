
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

---Step 4 Trend over time in the Netherlands
select hp."TIME_PERIOD", AVG(hp."OBS_VALUE") as avg_price_index_nl
from house_price_index_cleaned hp
where hp.geo = 'Netherlands'
group by hp."TIME_PERIOD"
order by hp."TIME_PERIOD" desc;


--- Step 5 Netherlands vs EU comparison
--- Calculate average house price index per country 
select hp.geo, hp."TIME_PERIOD", avg(hp."OBS_VALUE") as avg_price_index
from house_price_index_cleaned hp
group by hp.geo, hp."TIME_PERIOD"
order by avg_price_index DESC;