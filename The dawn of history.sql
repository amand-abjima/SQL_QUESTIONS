/*Create a query to list the first 5 events in chronological order.

Write a query to show the first 5 events (in date order) from the tblEvent table:

*/

SELECT * FROM TBLEVENT;

SELECT TOP 5 EVENTNAME AS WHAT,EVENTDETAILS AS DETAILS FROM TBLEVENT ORDER BY EVENTDATE;