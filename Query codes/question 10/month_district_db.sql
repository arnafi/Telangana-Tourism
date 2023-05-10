WITH domestic_yearly_visitors as (
SELECT district,date,year,SUM(visitors) as domestic_visitors_per_year_by_district
FROM domestic_visitors
GROUP BY district,year,date
),

foreign_yearly_visitors as (
SELECT district,date ,year,SUM(visitors) as foreign_visitors_per_year_by_district
FROM foreign_visitors
GROUP BY district,year,date
),


all_district as (SELECT x.district,x.year,x.date,
(x.domestic_visitors_per_year_by_district+y.foreign_visitors_per_year_by_district) as visitors_per_year_by_district
FROM domestic_yearly_visitors x
JOIN foreign_yearly_visitors y
ON x.district=y.district and x.year=y.year and x.date=y.date)



SELECT district,monthname(date) as peak_month,avg(visitors_per_year_by_district) as peak_month_visitor
FROM all_district
where district='Hyderabad' 
GROUP BY district,monthname(date)
order by district,peak_month_visitor desc limit 5

