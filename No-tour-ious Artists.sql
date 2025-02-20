/*Use outer joins in SQL queries to return a list of music artists who don't have any associated concert tours.

Write a query to show the following columns from the Artist and Tour tables. You can use an inner join to begin with.
Sort the results in ascending order of Artist and Tour_name.

Change the type of join so that your query returns every row from the Artist table. 
You should end up with more results than previously.

Add a WHERE clause to return only artists who have no associated tours.

Add a calculated column which shows a message like the one shown below for artists with no tours:

*/

SELECT * FROM ARTIST;

SELECT * FROM TOUR;

SELECT A.ARTIST,
       T.TOUR_NAME
	   FROM ARTIST A JOIN TOUR T
	   ON A.ARTIST_ID = T.ARTIST_ID
	   ORDER BY A.ARTIST ASC,TOUR_NAME ASC;

SELECT A.ARTIST,
       ISNULL(T.TOUR_NAME,'No tours found for '+ A.ARTIST) AS 'TOUR_NAME'
	   FROM ARTIST A LEFT JOIN TOUR T
	   ON A.ARTIST_ID = T.ARTIST_ID
	   WHERE T.ARTIST_ID IS NULL
	   ORDER BY A.ARTIST ASC,TOUR_NAME ASC;





