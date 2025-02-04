/*Use the WHERE clause in a SQL query to apply criteria to various date fields in a table of live music venues.

Write a query to return the following fields from the Venue table, sorting the results in ascending order of the date they opened.

Many venues don't have a value in the Opening_date field. Add a WHERE clause to your query so that it returns only those venues which have a value for the opening date.

Write a new query which returns the venues which opened before the turn of the 21st century. Sort the results in descending order of opening date.
(the 21st century started on the 1st of January 2001.)

Write a new query which shows venues which opened during the 20th century. The 20th century started on the 1st of January 1901. 
Sort the results in ascending order of opening date.

Modify the query to show venues which opened during the 20th century but which have since been closed.

Modify the query to show venues which opened during the 20th century and which were closed during the 21st century.

Modify the query once again to show venues which opened during the 20th century, closed during the 21st century but have not yet been demolished. 
You can assume that if there is no value in the Demolition_date column then the venue hasn't been demolished.

*/

SELECT * FROM VENUE;

SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,ADDRESS FROM VENUE;

SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,ADDRESS FROM VENUE ORDER BY OPENING_DATE ASC;

SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,ADDRESS FROM VENUE WHERE OPENING_DATE IS NOT NULL ORDER BY OPENING_DATE ASC;

SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,ADDRESS FROM VENUE WHERE OPENING_DATE < '2001-01-01' ORDER BY OPENING_DATE DESC;

SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,ADDRESS FROM VENUE WHERE OPENING_DATE >= '1901-01-01' ORDER BY OPENING_DATE ASC;

SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,ADDRESS FROM VENUE WHERE OPENING_DATE >= '1901-01-01' AND CLOSING_DATE IS NOT NULL ORDER BY OPENING_DATE;

SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,ADDRESS FROM VENUE WHERE OPENING_DATE >= '1901-01-01' AND CLOSING_DATE > '2001-01-01' ORDER BY OPENING_DATE;

SELECT VENUE,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,ADDRESS FROM VENUE WHERE OPENING_DATE >= '1901-01-01' AND CLOSING_DATE > '2001-01-01' 
AND DEMOLITION_DATE IS NULL ORDER BY OPENING_DATE;













