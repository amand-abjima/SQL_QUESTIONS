/*Add joins to SQL queries to return values from multiple tables in a database of music.

Write a query to return the following fields from the Show table.

Include the Venue and City tables in the query. Use the diagram below to help with your joins.

Include the Venue field in the SELECT list and filter the results to show only shows which 
took place in the city of " Manchester ".

Add the Tour and Artist tables to the query.

Include the Artist and Tour_name columns in the query and sort the shows in ascending order of date.
*/

SELECT * FROM SHOW;

SELECT * FROM CITY;

SELECT * FROM VENUE;

SELECT * FROM TOUR;

SELECT * FROM ARTIST;

SELECT A.ARTIST,
       T.TOUR_NAME,
       S.SHOW_DATE,
       V.VENUE,
       S.LEG,
	   S.TICKETS_SOLD 
	   FROM ARTIST A JOIN TOUR T ON A.ARTIST_ID = T.ARTIST_ID JOIN
	   SHOW S ON S.TOUR_ID = T.TOUR_ID JOIN 
	   VENUE V ON S.VENUE_ID = V.VENUE_ID JOIN
	   CITY C ON C.CITY_ID = V.CITY_ID
	   WHERE C.CITY = 'MANCHESTER'
	   ORDER BY S.SHOW_DATE ASC;

