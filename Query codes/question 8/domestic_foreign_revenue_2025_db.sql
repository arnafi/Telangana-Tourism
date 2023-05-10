#visitors need average 4 days to explore hyderabad and they need 4143 rupee average per day
SELECT year,tourist_type,predicted_visitors,
((predicted_visitors*4143)*4) as Average_revenue
FROM foreign_domestic_visitor_2025