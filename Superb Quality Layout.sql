/*Create a query using the designer, joining 2 tables, then tidy it up and comment its SQL.

*/

SELECT * FROM TBLCOUNTRY;

SELECT * FROM TBLEVENT;

SELECT T1.COUNTRYNAME AS COUNTRY,
       T2.EVENTNAME AS 'WHAT HAPPENED',
	   T2.EVENTDATE AS 'WHEN HAPPENED' 
	   FROM TBLCOUNTRY T1 
	   JOIN TBLEVENT T2 
	   ON T1.COUNTRYID = T2.COUNTRYID
	   ORDER BY 'WHEN HAPPENED' ASC;