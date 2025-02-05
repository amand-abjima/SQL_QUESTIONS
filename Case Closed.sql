/* Use CASE expressions in SQL queries to categorise a list of venues based on different criteria.

Write a query to show the Venue and Capacity columns from the Venue table and add a calculated column called Venue_size
which describes the venues according to the table below:

Value of Capacity is        Description

NULL                        UNKNOWN

Less than 1000              INTIMATE

Less than 10000             SMALL

Less than 50000             MEDIUM

Less than 100000            LARGE

EVERYTHING ELSE             ENORMOUS

Write another query to show the Venue and Opening_date columns from the Venue table. Add a calculated column called Venue_era
which describes venues according to the table below:

Value of Opening_date is        Description

Value of Opening_date is            Description

NULL                                UNKNOWN

Before the 1st of January 1801      Ancient

Before the 1st of January 1901      19th Century

Before the 1st of January 2001      20th Century

Everything else                     21st Century

Write another query to show the Venue, Opening_date, Closing_date and Demolition_date columns from the Venue table. Add a calculated
column called Venue_status to categorise venues according to the table below:

Condition                                     Description 

The Demolition_date column has a value        Demolished

The Closing_date column has a value           Closed but undemolished

Everything else                               Still open

*/

SELECT * FROM VENUE;

SELECT VENUE,CAPACITY FROM VENUE;

SELECT VENUE,
       CAPACITY,
	   CASE WHEN ISNULL(CAPACITY,' ')=' ' THEN 'UNKNOWN'   -- OR -- WHEN OPENING_DATE IS NULL THEN 'UNKNOWN'
	        WHEN CAPACITY < 1000 THEN 'INTIMATE'
			WHEN CAPACITY < 10000 THEN 'SMALL'
			WHEN CAPACITY < 50000 THEN 'MEDIUM'
			WHEN CAPACITY < 100000 THEN 'LARGE'
			ELSE 'ENORMOUS'
			END AS VENUE_SIZE 
	   FROM VENUE;


SELECT VENUE,OPENING_DATE FROM VENUE;

SELECT VENUE,
       OPENING_DATE,
	   CASE WHEN ISNULL(OPENING_DATE,' ')=' ' THEN 'UNKNOWN'    -- OR -- WHEN OPENING_DATE IS NULL THEN 'UNKNOWN'
	        WHEN OPENING_DATE < '1801-01-01' THEN 'ANCIENT'
			WHEN OPENING_DATE < '1901-01-01' THEN '19TH CENTURY'
			WHEN OPENING_DATE < '2001-01-01' THEN '20TH CENTURY'
			ELSE '21ST CENTURY'
			END AS VENUE_ERA
	   FROM VENUE;


SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE FROM VENUE;

SELECT VENUE,
       OPENING_DATE,
	   CLOSING_DATE,
	   DEMOLITION_DATE,
	   CASE WHEN DEMOLITION_DATE IS NOT NULL THEN 'Demolished'
	        WHEN CLOSING_DATE IS NOT NULL THEN 'Closed but undemolished'
			ELSE 'Still open'
			END AS 'VENUE_STATUS'
	   FROM VENUE;

