WITH domestic_yearly_visitors as (
SELECT district,year,SUM(visitors) as domestic_visitors_per_year_by_district
FROM domestic_visitors
GROUP BY district,year
),

foreign_yearly_visitors as (
SELECT district,year,SUM(visitors) as foreign_visitors_per_year_by_district
FROM foreign_visitors
GROUP BY district,year
),


all_district as (SELECT x.district,x.year,
(x.domestic_visitors_per_year_by_district+y.foreign_visitors_per_year_by_district) as visitors_per_year_by_district
FROM domestic_yearly_visitors x
JOIN foreign_yearly_visitors y
ON x.district=y.district and x.year=y.year)


select district, avg(cagr) as CAGR
from
(

select district, year, visitors_per_year_by_district, (visitors_per_year_by_district/prev_visitors - 1) as cagr
from(

SELECT district,year,visitors_per_year_by_district,
lag(visitors_per_year_by_district, 1,0) over 
(partition by district order by year) as prev_visitors
from all_district 
order by district,year
) as alias1
) as alias2
group by district
order by CAGR DESC limit 3