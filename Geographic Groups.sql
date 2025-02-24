/*	Write SQL queries to group concerts by multiple different geographic columns and create basic aggregations.

Write a query using the Venue and Show tables to display the aggregations shown below for each venue.

We've sorted the list in descending order of the count of shows.

Make another version of the same query which shows the same statistics for different cities. 
You'll need to keep the Venue table in the query so that you have something to join the City table to!

Make another version of the same query which groups the data by Country.


*/

SELECT * FROM VENUE;

SELECT * FROM SHOW;

SELECT * FROM CITY;

SELECT * FROM COUNTRY;

SELECT * FROM CONTINENT;

SELECT V.VENUE,
       COUNT(S.SHOW_ID) AS 'COUNT_OF_SHOWS',
	   SUM(S.TICKETS_SOLD) AS 'SUM_TICKETS_SOLD',
	   CAST(AVG(CAST(REVENUE_$ AS DECIMAL)) AS DECIMAL(18,2)) AS 'AVG_REVENUE_$'
	   FROM VENUE V JOIN SHOW S
	   ON V.VENUE_ID = S.VENUE_ID
	   GROUP BY V.VENUE
	   ORDER BY COUNT(S.SHOW_ID) DESC;

SELECT C.CITY,
       COUNT(S.SHOW_ID) AS 'COUNT_OF_SHOWS',
	   SUM(S.TICKETS_SOLD) AS 'SUM_TICKETS_SOLD',
	   CAST(AVG(CAST(REVENUE_$ AS DECIMAL)) AS DECIMAL(18,2)) AS 'AVG_REVENUE_$'
	   FROM CITY C JOIN VENUE V 
	   ON C.CITY_ID = V.CITY_ID JOIN 
	   SHOW S ON V.VENUE_ID = S.VENUE_ID
	   GROUP BY C.CITY
	   ORDER BY COUNT(S.SHOW_ID) DESC;
       
SELECT CU.COUNTRY,
       COUNT(S.SHOW_ID) AS 'COUNT_OF_SHOWS',
	   SUM(S.TICKETS_SOLD) AS 'SUM_TICKETS_SOLD',
	   CAST(AVG(CAST(REVENUE_$ AS DECIMAL)) AS DECIMAL(18,2)) AS 'AVG_REVENUE_$'
	   FROM COUNTRY CU JOIN CITY C
	   ON CU.COUNTRY_ID = C.COUNTRY_ID JOIN 
	   VENUE V ON V.CITY_ID = C.CITY_ID JOIN 
	   SHOW S ON V.VENUE_ID = S.VENUE_ID
	   GROUP BY CU.COUNTRY
	   ORDER BY COUNT(S.SHOW_ID) DESC;    

SELECT CU.COUNTRY,
       COUNT(S.SHOW_ID) AS 'COUNT_OF_SHOWS',
	   SUM(S.TICKETS_SOLD) AS 'SUM_TICKETS_SOLD',
	   CAST(AVG(CAST(REVENUE_$ AS DECIMAL)) AS DECIMAL(18,2)) AS 'AVG_REVENUE_$'
	   FROM COUNTRY CU JOIN CITY C
	   ON CU.COUNTRY_ID = C.COUNTRY_ID JOIN 
	   VENUE V ON V.CITY_ID = C.CITY_ID JOIN 
	   SHOW S ON V.VENUE_ID = S.VENUE_ID
	   GROUP BY CU.COUNTRY
	   ORDER BY COUNT(S.SHOW_ID) DESC;  

SELECT CN.CONTINENT,
       CU.COUNTRY,
	   C.CITY,
	   V.VENUE,
       COUNT(S.SHOW_ID) AS 'COUNT_OF_SHOWS',
	   SUM(S.TICKETS_SOLD) AS 'SUM_TICKETS_SOLD',
	   CAST(AVG(CAST(REVENUE_$ AS DECIMAL)) AS DECIMAL(18,2)) AS 'AVG_REVENUE_$'
	   FROM CONTINENT CN JOIN COUNTRY CU
	   ON CN.CONTINENT_ID = CU.CONTINENT_ID JOIN
	   CITY C ON CU.COUNTRY_ID = C.COUNTRY_ID JOIN
	   VENUE V ON V.CITY_ID = C.CITY_ID JOIN 
	   SHOW S ON V.VENUE_ID = S.VENUE_ID
	   GROUP BY CN.CONTINENT, CU.COUNTRY,C.CITY,V.VENUE
	   ORDER BY COUNT(S.SHOW_ID) DESC;
       