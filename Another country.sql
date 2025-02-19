/* Use an outer join and criterion to list out the countries which have no corresponding events.

Create a query using an outer join to list out those countries which have no corresponding events.

*/

SELECT * FROM TBLCOUNTRY;

SELECT * FROM TBLEVENT;

SELECT C.COUNTRYNAME,
       E.EVENTNAME
	   FROM TBLCOUNTRY C LEFT OUTER JOIN TBLEVENT E
	   ON C.COUNTRYID  = E.COUNTRYID
	   WHERE E.EVENTID IS NULL;