/*Use basic inner joins to list music albums and their genres before applying filters to the list.

Write a query to show the Title and US_sales_(m) fields from the Album table.

Add a WHERE clause to show only gold or platinum certified albums, i.e. those with sales of 
at least 0.5 million but less than 10 million.

Modify the FROM clause to include the Subgenre table. Use an inner join to join it to the Album table 
using the Subgenre_ID columns. You can see a reminder of the join syntax below: 

Add the Subgenre column to the SELECT list and run the query.

Modify the FROM clause again to include the Genre table. Join it to the Subgenre table using the Genre_ID columns.

Add a condition to the WHERE clause to show only albums whose Genre is Metal.

Sort the results in ascending order of Title and run the query.


*/

SELECT * FROM ALBUM;

SELECT * FROM SUBGENRE;

SELECT * FROM GENRE;

SELECT * FROM SUBGENRE;

SELECT T1.TITLE,
       T1.[US_SALES_(M)],
	   T2.SUBGENRE
	   FROM ALBUM T1 JOIN SUBGENRE T2
	   ON T1.SUBGENRE_ID = T2.SUBGENRE_ID
	   WHERE [US_SALES_(M)] >= 0.5 AND
	   [US_SALES_(M)] <= 10;

SELECT T1.TITLE,
       T1.[US_SALES_(M)],
	   T2.SUBGENRE
	   FROM ALBUM T1 JOIN SUBGENRE T2
	   ON T1.SUBGENRE_ID = T2.SUBGENRE_ID
	   JOIN GENRE T3 ON T2.GENRE_ID = T3.GENRE_ID
	   WHERE T3.GENRE = 'METAL' AND [US_SALES_(M)] >= 0.5 AND
	   [US_SALES_(M)] <= 10
	   ORDER BY TITLE;

