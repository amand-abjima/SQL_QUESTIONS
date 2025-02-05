/*Add calculated columns to a SQL query to work out the average length of songs in a list of albums.

Write a query to return the following columns from the Album table.

Add a calculated column to work out the total length of an album in seconds.

Add the Tracks column to your query and then create a calculated column to work out the average track length
in seconds for each album. Make sure that your result is a decimal number rather than an integer.

Add another calculated column which shows the average track length in minutes. You can divide the previous 
column by 60 to do this. Make sure the result can display up to 4 digits in total, with 2 digits 
after the decimal point.

Modify the query so that it returns albums whose average track length is 10 minutes or more. You can comment out 
the first two calculated columns you created to tidy up the results.

*/

SELECT * FROM ALBUM;

SELECT TITLE,ALBUM_MINS,ALBUM_SECS FROM ALBUM;

SELECT TITLE,ALBUM_MINS,ALBUM_SECS,(ALBUM_MINS*60)+ALBUM_SECS AS 'TOTAL_LENGTH_SECS' FROM ALBUM;

SELECT TITLE,
       ALBUM_MINS,
	   ALBUM_SECS,
	   (ALBUM_MINS*60)+ALBUM_SECS AS 'TOTAL_LENGTH_SECS',
	   TRACKS,
	   CAST(((ALBUM_MINS*60)+ALBUM_SECS) AS DECIMAL)/CAST(TRACKS AS DECIMAL) AS AVG_TRACK_LENGTH_SECS
	   FROM ALBUM;

SELECT TITLE,
       ALBUM_MINS,
	   ALBUM_SECS,
	   (ALBUM_MINS*60)+ALBUM_SECS AS 'TOTAL_LENGTH_SECS',
	   TRACKS,
	   CAST(((ALBUM_MINS*60)+ALBUM_SECS) AS DECIMAL)/CAST(TRACKS AS DECIMAL) AS AVG_TRACK_LENGTH_SECS,
	   CAST((CAST(((ALBUM_MINS*60)+ALBUM_SECS) AS DECIMAL)/CAST(TRACKS AS DECIMAL))/60 AS DECIMAL(4,2)) AS AVG_TRACK_LENGTH_MINS
	   FROM ALBUM;

SELECT TITLE,
       ALBUM_MINS,
	   ALBUM_SECS,
	   -- (ALBUM_MINS*60)+ALBUM_SECS AS 'TOTAL_LENGTH_SECS',
	   TRACKS,
	   -- CAST(((ALBUM_MINS*60)+ALBUM_SECS) AS DECIMAL)/CAST(TRACKS AS DECIMAL) AS AVG_TRACK_LENGTH_SECS,
	   CAST((CAST(((ALBUM_MINS*60)+ALBUM_SECS) AS DECIMAL)/CAST(TRACKS AS DECIMAL))/60 AS DECIMAL(4,2)) AS AVG_TRACK_LENGTH_MINS
	   FROM ALBUM
	   WHERE 
	   CAST((CAST(((ALBUM_MINS*60)+ALBUM_SECS) AS DECIMAL)/CAST(TRACKS AS DECIMAL))/60 AS DECIMAL(4,2)) >= 10;





