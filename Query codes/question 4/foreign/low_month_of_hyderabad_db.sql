SELECT monthname(date) as low_month,avg(visitors) as low_month_visitor
FROM foreign_visitors
WHERE district='hyderabad'
GROUP BY monthname(date)
order by low_month_visitor asc