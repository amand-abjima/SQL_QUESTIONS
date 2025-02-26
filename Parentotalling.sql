/*Use SQL queries to group a list of albums by multiple columns and create subtotals for the groups.

Write a query to group albums by their record label, creating the aggregate values shown below:

Add the phrase WITH ROLLUP to the end of the GROUP BY clause to create a total row.

Modify the query to include the Parent_company table and add an extra grouping column.

Use the ISNULL function to give the total and subtotal rows better labels.

*/

SELECT * FROM RECORD_LABEL;

SELECT * FROM ALBUM;

SELECT * FROM PARENT_COMPANY;

SELECT R.RECORD_LABEL,
       COUNT(A.ALBUM_ID) AS 'COUNT_OF_ALBUMS',
	   CAST(AVG(A.[US_SALES_(M)]) AS DECIMAL(18,2)) AS 'AVG_SALES_(M)'
	   FROM RECORD_LABEL R JOIN ALBUM A 
	   ON A.RECORD_LABEL_ID = R.RECORD_LABEL_ID
	   GROUP BY R.RECORD_LABEL;

SELECT ISNULL(PC.PARENT_COMPANY,'GRAND') AS PARENT_COMPANY,
       ISNULL(R.RECORD_LABEL,'TOTAL') AS RECORD_LABEL,
       COUNT(A.ALBUM_ID) AS 'COUNT_OF_ALBUMS',
	   CAST(AVG(A.[US_SALES_(M)]) AS DECIMAL(18,2)) AS 'AVG_SALES_(M)'
	   FROM ALBUM A JOIN RECORD_LABEL R
	   ON A.RECORD_LABEL_ID = R.RECORD_LABEL_ID JOIN
	   PARENT_COMPANY PC ON PC.PARENT_COMPANY_ID = R.PARENT_COMPANY_ID
	   GROUP BY PC.PARENT_COMPANY,R.RECORD_LABEL WITH ROLLUP;

