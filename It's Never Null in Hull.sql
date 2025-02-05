/*Create calculated columns in SQL Server using the ISNULL function to handle nulls in the data.

Write a query to select the following fields from the Album table.

Use the ISNULL function to show the message No sales figures provided for albums which don't have any sales information.
You'll need to control the data type of the US_sales_(m) column to make this work.

Write another query to show the following fields from the Tour table.

Use the ISNULL function to replace any nulls in the Avg_show_attendance column with the phrase Not enough data.

Write another query to show the following columns from the Venue table.

Add a calculated column to work out the construction cost in pounds sterling. At the time of writing, 1 US dollar
is worth 0.8 British pounds. Replace any nulls with the phrase No cost data.



*/

SELECT * FROM ALBUM;

SELECT TITLE,[US_SALES_(M)] FROM ALBUM;

SELECT TITLE,
       ISNULL(CONVERT(VARCHAR(30),[US_SALES_(M)]),'No sales figures provided') AS [US_SALES_(M)]
	   FROM ALBUM;

SELECT * FROM TOUR;

--Divide Attendance by Shows to calculate the answer in the fourth column.

SELECT TOUR_NAME,
       SHOWS,
	   ATTENDANCE,
	   ATTENDANCE/SHOWS AS AVG_SHOW_ATTENDANCE
	   FROM TOUR;

SELECT TOUR_NAME,
       SHOWS,
	   ATTENDANCE,
	   ISNULL(CAST(ATTENDANCE/SHOWS AS VARCHAR(30)),'Not enough data') AS AVG_SHOW_ATTENDANCE
	   FROM TOUR;

SELECT * FROM VENUE;

SELECT VENUE, 
       ADDRESS,
	   CONSTRUCTION_COST_$M
	   FROM VENUE;

SELECT VENUE, 
       ADDRESS,
	   CONSTRUCTION_COST_$M,
	   ISNULL(CAST((CONSTRUCTION_COST_$M*0.8) AS VARCHAR(20)),'No cost data') ASCONSTRUCTION_COST_$M
	   FROM VENUE;




