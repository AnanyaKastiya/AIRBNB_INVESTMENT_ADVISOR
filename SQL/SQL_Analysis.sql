create database airbnb_investment;
use airbnb_investment;
show tables;
select *
from airbnb
limit 10;

#Query 1.Top Revenue Neighbourhoods
select neighbourhood_cleansed, round(avg(estimated_revenue_l365d),2) as avg_revenue
from airbnb
group by neighbourhood_cleansed
order by avg_revenue desc
limit 10;

#Query 2.Best Room Types
select room_type,round(avg(estimated_revenue_l365d),2) as avg_revenue
from airbnb
group by room_type
order by avg_revenue desc;

#Query 3.Superhost Impact
select host_is_superhost,round(avg(estimated_revenue_l365d),2) as avg_revenue
from airbnb
group by host_is_superhost;

#Query 4.Top Investment Neighbourhoods
select neighbourhood_cleansed,round(avg(investment_score),2) as avg_investment_score
from airbnb
group by neighbourhood_cleansed
order by avg_investment_score desc
limit 10;

#Query 5.Occupancy Analysis
select neighbourhood_cleansed,round(avg(occupancy_rate),2) as avg_occupancy
from airbnb
group by neighbourhood_cleansed
order by avg_occupancy desc
limit 10;

#Query 6.Property Type Performance
select property_type,round(avg(estimated_revenue_l365d),2)as avg_revenue
from airbnb
group by property_type
order by avg_revenue desc
limit 15;

#Query 7.Grade Distribution
select investment_grade, count(*) as listings
from airbnb
group by investment_grade
order by investment_grade;

#Query 8.Top 10 Investment Opportunities
select name,neighbourhood_cleansed,investment_score,estimated_revenue_l365d
from airbnb
order by investment_score desc
limit 10;

#Query 9.Luxury property Analysis
select luxury_property,round(avg(estimated_revenue_l365d),2) as avg_revenue
from airbnb
group by luxury_property;

#Query 10.Revenue Tier Analysis
select revenue_tier, count(*) as listings,round(avg(estimated_revenue_l365d),2) as avg_revenue
from airbnb
group by revenue_tier;

#Query 11.Top 10 Neighbourhoods with Highest Occupancy and Revenue
select neighbourhood_cleansed,
		round(avg(occupancy_rate),2)as avg_occupancy,
        round(avg(estimated_revenue_l365d),2) as avg_revenue
from airbnb
group by neighbourhood_cleansed
having avg(occupancy_rate)>30
order by avg_revenue desc
limit 10;

#Query 12.Revenue by Investment Grade
select investment_grade,
		round(avg(occupancy_rate),2)as avg_occupancy,
        round(avg(estimated_revenue_l365d),2) as avg_revenue
from airbnb
group by investment_grade
order by investment_grade;

#Query 13.Top 5 Listings Within each Neighbourhood
with ranked_listings as(
	select name,neighbourhood_cleansed,investment_score,
			row_number()over(
				partition by neighbourhood_cleansed
                order by investment_score desc) as rn
	from airbnb
)
select *
from ranked_listings
where rn=1
order by investment_score desc
limit 5;








