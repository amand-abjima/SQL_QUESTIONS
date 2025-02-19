/*Use outer joins in SQL queries to return every row from a table of concert tours.

Write a query to return the following columns from the Tour table, making a note
of how many rows the query returns.

Use an inner join to add the Album table to the query, using the Album_ID columns to join the tables.

Change the type of join so that your query returns every row from the Tour table.

Replace the Album_ID column in the SELECT list with the Title column from the Album table.

Use the ISNULL function to replace nulls in the Title column with the phrase No associated album.

Sort the results in ascending order of tour name.



*/

SELECT * FROM TOUR;

SELECT * FROM ALBUM;

SELECT T.TOUR_NAME,
       T.START_DATE,
	   T.ALBUM_ID
	   FROM TOUR T JOIN ALBUM A
	   ON T.ALBUM_ID = A.ALBUM_ID;

SELECT T.TOUR_NAME,
       T.START_DATE,
	   T.ALBUM_ID
	   FROM TOUR T LEFT JOIN ALBUM A
	   ON T.ALBUM_ID = A.ALBUM_ID;

SELECT T.TOUR_NAME,
       T.START_DATE,
	   A.TITLE
	   FROM TOUR T LEFT JOIN ALBUM A
	   ON T.ALBUM_ID = A.ALBUM_ID;

SELECT T.TOUR_NAME,
       T.START_DATE,
	   ISNULL(A.TITLE,'No associated album') AS 'ALBUM_TITLE'
	   FROM TOUR T LEFT JOIN ALBUM A
	   ON T.ALBUM_ID = A.ALBUM_ID
	   ORDER BY TOUR_NAME ASC;