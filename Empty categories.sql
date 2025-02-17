/*	Create an inner join in a query, then change it to an outer join to show categories having no events.

Create a query which uses an inner join to link the categories table to the events table 
(they share a column/field called CategoryId):
The first few of the 459 events in reverse date order. We weren't sure of the correct
category for the first one.

Change the inner join to an outer join, so that you show for each category 
its events - even when there aren't any:

If you scroll down to the bottom of your query, you'll see you now have a couple of extra rows,
making 461 in total.

Add a WHERE clause to show only those categories which don't have any corresponding events:

*/

SELECT * FROM TBLEVENT;

SELECT * FROM TBLCATEGORY;

SELECT T1.EVENTNAME,
       T1.EVENTDATE,
	   T2.CATEGORYNAME
	   FROM TBLEVENT T1 JOIN
	   TBLCATEGORY T2
	   ON T1.CATEGORYID = T2.CATEGORYID
	   ORDER BY EVENTDATE DESC;

SELECT T1.EVENTNAME,
       T1.EVENTDATE,
	   T2.CATEGORYNAME
	   FROM TBLEVENT T1 FULL OUTER JOIN
	   TBLCATEGORY T2
	   ON T1.CATEGORYID = T2.CATEGORYID
	   ORDER BY EVENTDATE DESC;

SELECT T2.CATEGORYNAME
	   FROM TBLEVENT T1 FULL OUTER JOIN
	   TBLCATEGORY T2
	   ON T1.CATEGORYID = T2.CATEGORYID
	   WHERE T1.EVENTNAME IS NULL
	   ORDER BY EVENTDATE DESC;