/*Use date functions in SQL queries to calculate the length of concert tours

Write a query to return the following fields from the Tour table.

Add a calculated column using the DATEDIFF function to work out the length of each tour in days.

Add another column to calculate the daily revenue of a tour by dividing its gross by its length in days. 
Sort the results in descending order of this column.

Add a WHERE clause to show only the tours which lasted 1000 days or longer.
*/

SELECT * FROM TOUR;

SELECT TOUR_NAME,
       START_DATE,
	   END_DATE,
	   TOUR_GROSS_$
	   FROM TOUR;

SELECT TOUR_NAME,
       START_DATE,
	   END_DATE,
	   TOUR_GROSS_$,
	   DATEDIFF(DAY,START_DATE,END_DATE) AS TOUR_DAYS
	   FROM TOUR;

SELECT TOUR_NAME,
       START_DATE,
	   END_DATE,
	   TOUR_GROSS_$,
	   DATEDIFF(DAY,START_DATE,END_DATE) AS TOUR_DAYS,
	   (TOUR_GROSS_$/DATEDIFF(DAY,START_DATE,END_DATE)) AS REVENUE_PER_DAY
	   FROM TOUR
	   ORDER BY REVENUE_PER_DAY DESC;

SELECT TOUR_NAME,
       START_DATE,
	   END_DATE,
	   TOUR_GROSS_$,
	   DATEDIFF(DAY,START_DATE,END_DATE) AS TOUR_DAYS,
	   (TOUR_GROSS_$/DATEDIFF(DAY,START_DATE,END_DATE)) AS REVENUE_PER_DAY
	   FROM TOUR
       WHERE DATEDIFF(DAY,START_DATE,END_DATE) >= 1000
	   ORDER BY REVENUE_PER_DAY DESC;