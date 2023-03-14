-- How many total crimes were reported in 2021?
USE chicago;

SELECT count(crime_id) AS "total reported crimes"
FROM crimes;

-- What is the count of Homicides, Battery and Assaults reported?

SELECT 
	crime_type,
	count(*) AS n_crimes
FROM 
	crimes
WHERE 
	crime_type IN ('homicide', 'battery', 'assault')
group BY 
	crime_type
order BY 
	n_crimes DESC;
    
CREATE VIEW chicago_crimes_view AS (
	SELECT
		cr.crime_id,
		cr.crime_date AS time_reported,
		cr.crime_type,
		cr.crime_description,
		cr.location_description,
		cr.street_name,
		co.community_name,
		co.population ,
		co.area_size,
		co.density,
		cr.arrest, 
		cr.domestic,
		w.temp_high, 
		w.temp_low, 
		w.precipitation,
		cr.latitude,
		cr.longitude
	FROM crimes AS cr
	JOIN community AS co
	ON cr.community_id = co.area_id
	JOIN weather AS w
	ON w.weather_date = date(cr.crime_date)
);

SELECT * FROM chicago_crimes_view LIMIT 10;

-- What are the top ten city streets that have had the most homicides?

 SELECT
 	street_name,
 	n_homicides
 from
	(SELECT
		street_name,
		count(*) AS n_homicides,
		rank() OVER (ORDER BY count(*) DESC) AS rnk
	FROM
		chicago_crimes_view
	WHERE
		crime_type = 'homicide'
	GROUP BY
		street_name
	ORDER BY
		count(*) DESC) AS tmp
WHERE 
	rnk <= 10;

SELECT get_crime_count_by_year(2021);

CALL crime_temp_stats('2021-01-01', '2021-01-04');

-- What is the number and types of reported crimes on Michigan Ave?	
	
SELECT
	crime_type,
	count(*) AS michigan_ave_crimes
FROM 
	chicago_crimes_view
WHERE 
	street_name like '%michigan ave%'
GROUP BY 
	crime_type
ORDER BY 
	michigan_ave_crimes desc

