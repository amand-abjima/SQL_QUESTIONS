/*Use the view designer in SQL Server Management Studio to create a view showing a list of concerts and locations.

Choose to create a new view using the view designer.

Create a new query which selects every column from your view, sorted in descending order of show revenue.

Go back to the design of your view and add the Opening_date column from the Venue table to it.

Add a filter to the Opening_date to show venues which opened since the 1st of January 2020.

Save and close the view and return to the query you wrote earlier. Execute the query again to see the new results.
*/

SELECT * FROM ALBUM;

SELECT * FROM ARTIST;

SELECT * FROM TOUR;

SELECT * FROM SHOW;

SELECT * FROM VENUE;

SELECT * FROM VENUE_TYPE;

SELECT * FROM VENUE_CATEGORY;

CREATE VIEW [Show me the money]
AS
SELECT DISTINCT AR.ARTIST,
       T.TOUR_NAME AS 'TOUR NAME',
	   S.SHOW_DATE AS 'SHOW DATE',
	   S.REVENUE_$ AS 'REVENUE $US',
	   V.VENUE AS 'VENUE NAME',
	   VT.VENUE_TYPE AS 'VENUE TYPE',
	   VC.VENUE_CATEGORY AS 'VENUE CATEGORY'
	   FROM ALBUM AL JOIN ARTIST AR 
	   ON AL.ARTIST_ID = AR.ARTIST_ID JOIN 
	   TOUR T ON AR.ARTIST_ID = T.ARTIST_ID JOIN 
	   SHOW S ON T.TOUR_ID = S.TOUR_ID JOIN 
	   VENUE V ON S.VENUE_ID = V.VENUE_ID JOIN
	   VENUE_TYPE VT ON V.VENUE_TYPE_ID = VT.VENUE_TYPE_ID JOIN 
	   VENUE_CATEGORY VC ON VT.VENUE_CATEGORY_ID = VC.VENUE_CATEGORY_ID;

SELECT * FROM [Show me the money] ORDER BY 'REVENUE $US' DESC;

ALTER VIEW [Show me the money]
AS
SELECT DISTINCT AR.ARTIST,
       T.TOUR_NAME AS 'TOUR NAME',
	   S.SHOW_DATE AS 'SHOW DATE',
	   S.REVENUE_$ AS 'REVENUE $US',
	   V.VENUE AS 'VENUE NAME',
	   VT.VENUE_TYPE AS 'VENUE TYPE',
	   VC.VENUE_CATEGORY AS 'VENUE CATEGORY',
	   V.OPENING_DATE AS 'OPENING DATE'
	   FROM ALBUM AL JOIN ARTIST AR 
	   ON AL.ARTIST_ID = AR.ARTIST_ID JOIN 
	   TOUR T ON AR.ARTIST_ID = T.ARTIST_ID JOIN 
	   SHOW S ON T.TOUR_ID = S.TOUR_ID JOIN 
	   VENUE V ON S.VENUE_ID = V.VENUE_ID JOIN
	   VENUE_TYPE VT ON V.VENUE_TYPE_ID = VT.VENUE_TYPE_ID JOIN 
	   VENUE_CATEGORY VC ON VT.VENUE_CATEGORY_ID = VC.VENUE_CATEGORY_ID
	   WHERE V.OPENING_DATE >= '2020-01-01';

SELECT * FROM [Show me the money] ORDER BY 'REVENUE $US' DESC;




