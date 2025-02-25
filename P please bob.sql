/*Combine CAST, AVG, COUNT, LEN, UPPER and LEFT to show the average length of event names by category initial.

Create a query which shows two statistics for each category initial:

1) The number of events for categories beginning with this letter; and
2) The average length in characters of the event name for categories beginning with this letter.


*/

SELECT * FROM TBLCATEGORY;

SELECT * FROM TBLEVENT;

SELECT SUBSTRING(C.CATEGORYNAME,1,1) AS 'CATEGORY INITIAL',
       COUNT(E.EVENTID) AS 'NUMBER OF EVENTS',
	   AVG(CAST(LEN(E.EVENTNAME) AS DECIMAL(10,2))) AS 'AVERAGE EVENT NAME LENGTH'
	   FROM TBLCATEGORY C JOIN TBLEVENT E
	   ON C.CATEGORYID = E.CATEGORYID 
	   GROUP BY SUBSTRING(C.CATEGORYNAME,1,1);

       