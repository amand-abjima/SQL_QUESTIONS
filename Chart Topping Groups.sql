/*Use SQL queries to group a list of music artists and create statistics related to their albums.

Write a query which joins the Artist table to the Album table using an inner join on the Artist_ID column. 
Select the Artist column and run the query.

Add a GROUP BY clause to group the rows by the Artist column.

Now add columns to calculate the following values for each artist:

****** Value to calculate ******

• The count of albums.

• The sum of US sales.

• The average of US sales.

Sort the query in descending order of the count of albums and run the query again.

Add a WHERE clause to the query so that it only includes albums which reached number 1 in the US Billboard 200 chart.

Add a HAVING clause which filters the results to show only artists with average sales of 10 million or more.

*/

SELECT * FROM ARTIST;

SELECT * FROM ALBUM;

SELECT AR.ARTIST
       FROM ARTIST AR JOIN ALBUM AL 
	   ON AR.ARTIST_ID = AL.ARTIST_ID;

SELECT AR.ARTIST
       FROM ARTIST AR JOIN ALBUM AL 
	   ON AR.ARTIST_ID = AL.ARTIST_ID
	   GROUP BY AR.ARTIST;

SELECT AR.ARTIST,
       COUNT(AL.ALBUM_ID) AS 'COUNT_OF_ALBUMS',
	   CAST(SUM([US_SALES_(M)]) AS DECIMAL(10,2)) AS 'SUM_OF_SALES_(M)',
	   CAST(AVG([US_SALES_(M)]) AS DECIMAL(10,2)) AS 'AVG_OF_SALES_(M)'
       FROM ARTIST AR JOIN ALBUM AL 
	   ON AR.ARTIST_ID = AL.ARTIST_ID
	   GROUP BY AR.ARTIST
	   ORDER BY 'COUNT_OF_ALBUMS' DESC;


SELECT AR.ARTIST,
       COUNT(AL.ALBUM_ID) AS 'COUNT_OF_ALBUMS',
	   CAST(SUM([US_SALES_(M)]) AS DECIMAL(10,2)) AS 'SUM_OF_SALES_(M)',
	   CAST(AVG([US_SALES_(M)]) AS DECIMAL(10,2)) AS 'AVG_OF_SALES_(M)'
       FROM ARTIST AR JOIN ALBUM AL 
	   ON AR.ARTIST_ID = AL.ARTIST_ID
	   WHERE AL.US_BILLBOARD_200_PEAK = 1
	   GROUP BY AR.ARTIST
	   ORDER BY 'COUNT_OF_ALBUMS' DESC;

SELECT AR.ARTIST,
       COUNT(AL.ALBUM_ID) AS 'COUNT_OF_ALBUMS',
	   CAST(SUM([US_SALES_(M)]) AS DECIMAL(10,2)) AS 'SUM_OF_SALES_(M)',
	   CAST(AVG([US_SALES_(M)]) AS DECIMAL(10,2)) AS 'AVG_OF_SALES_(M)'
       FROM ARTIST AR JOIN ALBUM AL 
	   ON AR.ARTIST_ID = AL.ARTIST_ID
	   WHERE AL.US_BILLBOARD_200_PEAK = 1
	   GROUP BY AR.ARTIST
	   HAVING CAST(AVG([US_SALES_(M)]) AS DECIMAL(10,2)) >= 10
	   ORDER BY 'COUNT_OF_ALBUMS' DESC;
