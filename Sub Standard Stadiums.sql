/*	Use subqueries in SQL to use aggregate functions as criteria for other queries.

Write a query to select the average of the Capacity field from the Venue table.

Wrap another query around the first to show the following fields for venues whose capacity is 
larger than average, sorting the results in ascending order of capacity.

Write a similar query to show all the venues whose capacity is smaller than average. 
Sort these results in descending order of capacity.

*/

SELECT * FROM VENUE;

SELECT AVG(CAPACITY) FROM VENUE;

SELECT VENUE,
       CAPACITY,
	   OPENING_DATE 
	   FROM VENUE 
	   WHERE CAPACITY > (SELECT AVG(CAPACITY) FROM VENUE)
	   ORDER BY CAPACITY ASC;

SELECT VENUE,
       CAPACITY,
	   OPENING_DATE
	   FROM VENUE
	   WHERE CAPACITY < (SELECT AVG(CAPACITY) FROM VENUE)
	   ORDER BY CAPACITY DESC;