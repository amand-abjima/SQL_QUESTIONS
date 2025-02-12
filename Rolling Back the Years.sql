/*Use SQL date functions to format the release dates of music albums in SQL queries.

Write a query to return the Title and Release_date fields from the Album table.

Add a calculated column using the CONVERT function to format the release date in a standard UK format.

***** (The date style code for UK dates is 103.) *****

Add another calculated column using the FORMAT function to format the release date.
ou can use the letters d, M and y in different combinations to format a date.

Use either the FORMAT or DATENAME function to calculate the name of the day of the week for each release date.

Add a WHERE clause to show albums released in your year of birth. You can use the YEAR function to extract 
the year from the album release date.

Change the WHERE clause to show albums released on the same day of the week as the day on which you were born.
You can use the FORMAT or DATENAME function to return the day of the week for your own date of birth.

*/

SELECT * FROM ALBUM;

SELECT TITLE,
       RELEASE_DATE
	   FROM ALBUM;

SELECT TITLE,
       RELEASE_DATE,
	   CONVERT(VARCHAR(30),RELEASE_DATE,103) AS UK_release_date
	   FROM ALBUM;


SELECT TITLE,
       RELEASE_DATE,
	   CONVERT(VARCHAR(30),RELEASE_DATE,103) AS UK_release_date,
	   FORMAT(RELEASE_DATE,'ddd dd MMM yyyy') AS Long_date
	   FROM ALBUM;
 
-- USING FORMAT():

SELECT TITLE,
       RELEASE_DATE,
	   FORMAT(RELEASE_DATE,'dddd') AS Day_of_week
	   FROM ALBUM;

----------------------------------------- OR --------------------------------------------------------

-- USING DATENAME():

SELECT TITLE,
       RELEASE_DATE,
	   DATENAME(dw,RELEASE_DATE) AS Day_of_week 

	   ---------------- OR --------------------

	   -- DATENAME(WEEKDAY,RELEASE_DATE) AS Day_of_week

	   FROM ALBUM;

SELECT TITLE,
       RELEASE_DATE
	   FROM ALBUM
	   WHERE YEAR(RELEASE_DATE) = '1999';

SELECT TITLE,
       RELEASE_DATE,
	   FORMAT(RELEASE_DATE,'dddd') AS Day_of_week
	   FROM ALBUM
	   WHERE FORMAT(RELEASE_DATE,'dd/MM/yyyy') = '08/06/1999';

SELECT TITLE,
       RELEASE_DATE,
	   DATENAME(WEEKDAY,RELEASE_DATE) AS Day_of_week
	   FROM ALBUM
	   WHERE DATENAME(WEEKDAY,RELEASE_DATE) = DATENAME(WEEKDAY,'06-08-1999');



