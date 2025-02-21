/*Use COUNT, MAX and MIN to show statistics about the rows in the events table.

Create a query to list out the following statistics from the table of events.

You'll need to use the COUNT, MAX and MIN functions respectively.

Your query won't need a GROUP BY, as you're not grouping by anything - just a SELECT and a FROM.

*/

SELECT * FROM TBLEVENT;

SELECT COUNT(*) AS 'NUMBER OF EVENTS',
       MAX(EVENTDATE) AS 'LAST DATE', 
	   MIN(EVENTDATE) AS 'FIRST DATE' 
	   FROM TBLEVENT;
