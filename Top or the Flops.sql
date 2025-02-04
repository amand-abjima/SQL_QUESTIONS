/*Use the IIF function and CASE expression to create calculated columns in a SQL query based on a list of music albums.

Write a query to select the Title and US_Billboard_200_peak columns from the Album table, sorting the results 
alphabetically by Title.

Add a calculated column using the IIF function which labels the album as a Chart Topper if its peak chart position is 1,
or a Chart Flopper for any other position. You can see the syntax of the IIF function below:

******* IIF( Condition to test, Answer if true, Answer if false) ********

Perhaps it's unfair to call an album a flop just because it didn't reach the number 1 spot.
Modify your calculated column to categorise albums according to the table below:

Peak chart position              Description

Is equal to 1                    Chart Topper

Is less than or equal to 10      TOP 10

Anything else                    CHART FLOPPER

You can nest one IIF function inside another to do this using the following syntax:

**IIF( First condition, Answer if true, IIF( Second condition, Answer if true, Answer if false)) **


The RIAA categorises albums based on sales according to the following criteria:

SALES(MILLIONS)          CATEGORY

10 OR MORE               DIAMOND

2 OR MORE                MULTI-PLATINUM

1 OR MORE                PLATINUM

0.5 OR MORE              GOLD

ANYTHING ELSE             NA

Add the US_sales_(m) column to your query then add a calculated column using a CASE expression to categorise albums 
according to the table shown above. Here's a reminder of the CASE expression syntax:

**** CASE

     WHEN Condition 1 THEN Answer 1

     WHEN Condition n THEN Answer n

     ELSE Final answer

     END  ****

*/

SELECT * FROM ALBUM;

SELECT TITLE,US_BILLBOARD_200_PEAK FROM ALBUM ORDER BY TITLE;

SELECT TITLE,
       US_BILLBOARD_200_PEAK,
	   IIF(US_BILLBOARD_200_PEAK = 1,'CHART TOPER','CHART FLOPPER') AS CHART_SUCCESS 
       FROM ALBUM 
	   ORDER BY TITLE;

SELECT TITLE,
       US_BILLBOARD_200_PEAK,
	   IIF(US_BILLBOARD_200_PEAK = 1,'CHART TOPER',IIF(US_BILLBOARD_200_PEAK <= 10,'TOP 10','CHART FLOPPER')) AS CHART_SUCCESS 
       FROM ALBUM 
	   ORDER BY TITLE;

SELECT TITLE,
       US_BILLBOARD_200_PEAK,
	   IIF(US_BILLBOARD_200_PEAK = 1,'CHART TOPER',IIF(US_BILLBOARD_200_PEAK <= 10,'TOP 10','CHART FLOPPER')) AS CHART_SUCCESS,
	   [US_SALES_(M)],
	   CASE WHEN [US_SALES_(M)] >= 10 THEN 'DIAMOND'
	        WHEN [US_SALES_(M)] >= 2 THEN 'MULTI-PLATINUM'
	        WHEN [US_SALES_(M)] >= 1 THEN 'PLATINUM'
	        WHEN [US_SALES_(M)] >= 0.5 THEN 'GOLD'
	   ELSE 'NA'
	   END AS 'SALES_SUCCESS'
       FROM ALBUM 
	   ORDER BY TITLE;



