/*Write a CASE WHEN expression to assign countries to different groups.

Write a query to divide countries into these groups:

Continent id	   Belongs to	            Actual continent (for interest)
1 or 3	           Eurasia	                Europe or Asia
5 or 6	           Americas	                North and South America
2 or 4	           Somewhere hot	        Africa and Australasia
7	               Somewhere cold	        Antarctica
Otherwise	       Somewhere else	        International

The first few countries, sorted in reverse alphabetical order by your new column.

 
*/

SELECT * FROM TBLCOUNTRY;

SELECT COUNTRYNAME,
       CASE WHEN CONTINENTID IN(1,3) THEN 'EURASIA'
	        WHEN CONTINENTID IN(5,6) THEN 'AMERICAS'
			WHEN CONTINENTID IN(2,4) THEN 'SOMEWHERE HOT'
			WHEN CONTINENTID = 7  THEN 'SOMEWHERE COLD'
			ELSE 'SOMEWHERE ELSE'
			END AS COUNTRYLOCATION
		FROM TBLCOUNTRY
		ORDER BY COUNTRYLOCATION DESC;