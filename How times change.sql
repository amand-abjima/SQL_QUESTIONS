/*Run two SELECT queries to show the first and last events.

Create a query which uses two separate SELECT statements to show the first and last 2 events in date order from the tblEvent table:

Now redirect the output of this query to text, rather than to grid, to get something like this when you run it:

*/

SELECT * FROM TBLEVENT;

SELECT TOP 2 EVENTNAME AS 'WHAT',EVENTDATE AS 'WHEN' FROM TBLEVENT ORDER BY EVENTDATE ASC;

SELECT TOP 2 EVENTNAME AS 'WHAT',EVENTDATE AS 'WHEN' FROM TBLEVENT ORDER BY EVENTDATE DESC;