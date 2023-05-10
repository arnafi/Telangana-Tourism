WITH domestic_tourist as
(SELECT district,year,sum(visitors) as total_visitor
FROM domestic_visitors
WHERE year=2019
GROUP BY district,year),

foreign_tourist as (SELECT district,year,sum(visitors) as total_visitor
FROM foreign_visitors
WHERE year=2019
GROUP BY district,year),

foreign_domestic as (select dt.district,dt.year,(dt.total_visitor+ft.total_visitor) as Tourist
from domestic_tourist dt
join foreign_tourist ft
on dt.district=ft.district)


SELECT x.district,x.year,(x.tourist/y.population) as tourist_footfall_to_population_ratio
FROM foreign_domestic x
JOIN district_population y
ON x.district=y.district
order by tourist_footfall_to_population_ratio asc limit 5


