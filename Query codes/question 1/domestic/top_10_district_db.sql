SELECT district,sum(visitors) as district_total_visitor
FROM domestic_visitors
GROUP BY district
ORDER BY district_total_visitor DESC LIMIT 10
