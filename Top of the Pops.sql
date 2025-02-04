/*Use the LIKE operator and wildcard characters in the WHERE clause of a SQL query to return a list of live music venues.

Write a query to return rows from the Venue table where the name of the venue begins with A and ends with z.

Add another query in the same script which returns venues whose address contains Manchester.

We only really care about venues in the city of Manchester, UK. Modify the query to exclude any venues whose address contains United States.

write a new query which shows venues whose name contains the word theatre. Some venues spell this word correctly as theatre, 
others spell it incorrectly as theater. Make sure that your query returns venues which contain either spelling.

Modify the query to exclude any amphitheatre or amphitheater venues.

Add one more query which returns venues whose Venue or Other_names column contains either Coca-Cola, Pepsi or Red Bull.

*/

SELECT * FROM VENUE;

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE;

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE WHERE VENUE LIKE 'A%' AND VENUE LIKE '%Z';

---------------------------------- OR -----------------------------------------------

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE WHERE VENUE LIKE 'A%Z';

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE WHERE ADDRESS LIKE '%MANCHESTER%';

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE WHERE ADDRESS LIKE '%MANCHESTER%' AND ADDRESS NOT LIKE '%UNITED STATES%';

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE WHERE VENUE LIKE '%THEATRE%' OR VENUE LIKE '%THEATER%';

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE WHERE (VENUE LIKE '%THEATRE%' OR VENUE LIKE '%THEATER%')
AND (VENUE NOT LIKE '%AMPHITHEATRE%') AND (VENUE NOT LIKE '%AMPHITHEATER%');

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE 

SELECT VENUE,ADDRESS,OTHER_NAMES FROM VENUE WHERE (VENUE LIKE '%COCA-COLA%' OR  VENUE LIKE '%PEPSI%' OR  VENUE LIKE '%RED BULL%') OR 
(OTHER_NAMES LIKE '%COCA-COLA%' OR  OTHER_NAMES LIKE '%PEPSI%' OR  OTHER_NAMES LIKE '%RED BULL%');