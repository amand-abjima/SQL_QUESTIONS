/* Use a WHERE clause to show all of the events between two given dates.

Create a query which lists out all of the events which took place in February 2005:
*/

SELECT * FROM TBLEVENT;

SELECT EVENTNAME AS WHAT,EVENTDATE AS 'WHEN' FROM TBLEVENT WHERE EVENTDATE BETWEEN '2005-02-01' AND '2005-02-28';