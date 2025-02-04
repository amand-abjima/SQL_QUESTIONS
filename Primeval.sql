/*3 challenging queries combining criteria to find possible data anomalies.

Events which aren't in the Transport category (number 14), but which nevertheless include the 
text Train in the EventDetails column.

Events which are in the Space country (number 13), but which don't mention Space in either
the event name or the event details columns.

Events which are in categories 5 or 6 (War/conflict and Death/disaster), but which don't mention
either War or Death in the EventDetails column.

*/

SELECT * FROM TBLCATEGORY;
SELECT * FROM TBLCONTINENT;
SELECT * FROM TBLCOUNTRY;
SELECT * FROM TBLEVENT;

/* SELECT * FROM TBLEVENT WHERE EVENTDETAILS LIKE '%TRAIN%';

SELECT * FROM TBLCATEGORY T1 JOIN TBLEVENT T2 ON T1.CATEGORYID = T2.CATEGORYID 
WHERE CATEGORYNAME NOT LIKE 'TRANSPORT' AND EVENTDETAILS LIKE '%TRAIN%';*/

SELECT * FROM TBLEVENT WHERE CATEGORYID <> 14 AND EVENTDETAILS LIKE '%TRAIN%';

-------------------------OR-------------------------------------------------

SELECT
	e.EventName AS What,
	e.EventDetails AS Details,
	e.EventDate AS 'When'
FROM
	tblEvent AS e
WHERE
	e.CategoryID <> 14 and
	(e.EventDetails like '%train%');

SELECT EVENTNAME,EVENTDETAILS,EVENTDATE FROM TBLEVENT 
WHERE COUNTRYID = 13 AND 
EVENTNAME NOT LIKE '%SPACE%' AND EVENTDETAILS NOT LIKE '%SPACE%';

SELECT EVENTNAME,EVENTDETAILS FROM TBLEVENT 
WHERE CATEGORYID IN(5,6) AND 
EVENTDETAILS NOT LIKE '%WAR%' AND 
EVENTDETAILS NOT LIKE '%DEATH%';




