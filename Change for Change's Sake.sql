/*Use a variety of text functions in SQL queries to manipulate names and addresses of a list of venues.

Write a query to select the Venue and Address columns from the Venue table.

Add a calculated column using the LEFT and CHARINDEX functions which returns everything up to and
including the first comma in the Address.

Modify the column to remove trailing comma. You'll need to be careful of addresses which don't contain a comma.
In these cases, return the full address.

When a venue has multiple former names, each one is separated with a semi-colon character.
Add a calculated column to work out the number of former names a venue has.
One approach to doing this involves comparing the length of the Other_names column with a version of
the same column where the semi-colons have been removed.

Sort the results to show the most renamed venue at the top of the list.
*/

SELECT * FROM VENUE;

SELECT VENUE,ADDRESS FROM VENUE;

SELECT VENUE,
       ADDRESS,
	   LEFT(ADDRESS,CHARINDEX(',',ADDRESS,1)) AS STREET_ADDRESS
	   FROM VENUE;

SELECT VENUE,
       ADDRESS,
	   CASE WHEN CHARINDEX(',',ADDRESS,1) > 0 THEN LEFT(ADDRESS,CHARINDEX(',',ADDRESS)-1)
	   ELSE ADDRESS
	   END AS STREET_ADDRESS
	   FROM VENUE;

---------------------------------------------------------- OR -----------------------------------------------------------------------

SELECT VENUE,
       ADDRESS,
	   CASE WHEN CHARINDEX(',',ADDRESS) = 0 THEN ADDRESS
	   ELSE LEFT(ADDRESS,CHARINDEX(',',ADDRESS)-1)
	   END AS STREET_ADDRESS
	   FROM VENUE;



SELECT VENUE,OTHER_NAMES FROM VENUE;

SELECT VENUE,
       ISNULL(LEN(OTHER_NAMES) -  LEN(REPLACE(OTHER_NAMES,';',''))+1,0) AS NUMBER_OF_FORMER_NAMES,
	   OTHER_NAMES 
	   FROM VENUE
	   ORDER BY NUMBER_OF_FORMER_NAMES DESC;


