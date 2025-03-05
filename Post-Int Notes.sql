/* Use a subquery to show events which happened since the last one for a particular country occurred.

Create a query which lists out all of the events in the tblEvent table which happened after the 
last one for country 21 (International) took place.
*/

SELECT * FROM TBLCOUNTRY;

SELECT * FROM TBLEVENT;

SELECT E.EVENTNAME,
       E.EVENTDATE,
	   C.COUNTRYNAME
	   FROM TBLEVENT E JOIN TBLCOUNTRY C
	   ON E.COUNTRYID = C.COUNTRYID
	   WHERE E.EVENTDATE > (
	   SELECT MAX(E.EVENTDATE)
	   FROM TBLEVENT E
	   WHERE E.COUNTRYID = 21)
	   ORDER BY E.EVENTDATE DESC;


