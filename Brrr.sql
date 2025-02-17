/*Link the continent, country and event tables with inner joins, and then filter by fields from 2 tables.

Create a query to link together the following 3 tables:

• tblContinent
• tblCountry
• tblEvent

Your query should list out those events which took place in either:

• the continent called Antarctic; or
• the country called Russia.

*/

SELECT * FROM TBLCONTINENT;

SELECT * FROM TBLCOUNTRY;

SELECT * FROM TBLEVENT;

SELECT T1.EVENTNAME,
       T1.EVENTDATE,
	   T2.COUNTRYNAME,
	   T3.CONTINENTNAME
	   FROM TBLEVENT T1 JOIN TBLCOUNTRY T2
	   ON T1.COUNTRYID = T2.COUNTRYID
	   JOIN TBLCONTINENT T3
	   ON T2.CONTINENTID = T3.CONTINENTID
	   WHERE COUNTRYNAME IN ('ANTARCTICA','RUSSIA');


