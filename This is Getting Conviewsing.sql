/* In a new script, create a query which joins your view to the Tour table using the Album_ID fields. 

In the This is Getting Conviewsing script, write a query using a GROUP BY clause to show the following 
statistics from the view:


*/

SELECT * FROM TOUR;

SELECT T.TOUR_NAME,
       START_DATE,
	   VW.TITLE,
	   VW.RELEASE_DATE,
	   VW.ARTIST,
	   VW.RECORD_LABEL
	   FROM TOUR T JOIN Number_1_Albums VW
	   ON T.ALBUM_ID = VW.ALBUM_ID;

SELECT VW.ARTIST,
       COUNT(VW.ALBUM_ID),
	   SUM(VW.[US_SALES_(M)])
	   FROM Number_1_Albums VW
	   GROUP BY VW.ARTIST;







