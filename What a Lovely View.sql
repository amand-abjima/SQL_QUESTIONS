/*Create a view in SQL Server to show a list of number 1 albums and fields from other tables.

In the What a Lovely View script, use the ALTER VIEW statement to add the US_sales_(m) field to the results.
Execute the script to update the view.
*/

SELECT * FROM ALBUM;

SELECT * FROM ARTIST;

SELECT * FROM RECORD_LABEL;

SELECT AL.ALBUM_ID,
       AL.TITLE,
	   AL.RELEASE_DATE,
	   AR.ARTIST,
	   RC.RECORD_LABEL
	   FROM ALBUM AL JOIN ARTIST AR
	   ON AL.ARTIST_ID = AR.ARTIST_ID 
	   JOIN RECORD_LABEL RC 
	   ON AL.RECORD_LABEL_ID = RC.RECORD_LABEL_ID
	   WHERE US_BILLBOARD_200_PEAK = 1;

CREATE VIEW Number_1_Albums
AS
SELECT AL.ALBUM_ID,
       AL.TITLE,
	   AL.RELEASE_DATE,
	   AR.ARTIST,
	   RC.RECORD_LABEL
	   FROM ALBUM AL JOIN ARTIST AR
	   ON AL.ARTIST_ID = AR.ARTIST_ID 
	   JOIN RECORD_LABEL RC 
	   ON AL.RECORD_LABEL_ID = RC.RECORD_LABEL_ID
	   WHERE US_BILLBOARD_200_PEAK = 1;

SELECT * FROM Number_1_Albums;

ALTER VIEW Number_1_Albums
AS
SELECT AL.ALBUM_ID,
       AL.[US_SALES_(M)],
       AL.TITLE,
	   AL.RELEASE_DATE,
	   AR.ARTIST,
	   RC.RECORD_LABEL
	   FROM ALBUM AL JOIN ARTIST AR
	   ON AL.ARTIST_ID = AR.ARTIST_ID 
	   JOIN RECORD_LABEL RC 
	   ON AL.RECORD_LABEL_ID = RC.RECORD_LABEL_ID
	   WHERE US_BILLBOARD_200_PEAK = 1;

SELECT * FROM Number_1_Albums;



