WITH yearly_visitors as (
SELECT district,year,SUM(visitors) as visitors_per_year_by_district
FROM foreign_visitors
GROUP BY district,year
)

select district, avg(cagr) as CAGR
from
(

select district, year, visitors_per_year_by_district, (visitors_per_year_by_district/prev_visitors - 1) as cagr
from(

SELECT district,year,visitors_per_year_by_district,
lag(visitors_per_year_by_district, 1,0) over 
(partition by district order by year) as prev_visitors
from yearly_visitors 
order by district,year
) as alias1
) as alias2
group by district
order by CAGR DESC limit 3