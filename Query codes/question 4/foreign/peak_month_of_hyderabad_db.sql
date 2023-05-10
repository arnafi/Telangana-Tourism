SELECT monthname(date) as peak_month,avg(visitors) as peak_month_visitor
FROM foreign_visitors
WHERE district='hyderabad'
GROUP BY monthname(date)
order by peak_month_visitor desc 