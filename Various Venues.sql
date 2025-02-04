/*	Write SQL queries to select and sort a list of venues, showing the top items for different columns.

*/

SELECT * FROM VENUE;

SELECT VENUE,CAPACITY,OPENING_DATE,CLOSING_DATE,DEMOLITION_DATE,CONSTRUCTION_COST_$M,ADDRESS FROM VENUE;

--The 5 highest capacity venues

SELECT TOP 5 * FROM VENUE ORDER BY CAPACITY DESC;

--The 6 most recently opened venues

SELECT TOP 6 * FROM VENUE ORDER BY OPENING_DATE DESC;

--The 21 most recently closed venues

SELECT TOP 21 * FROM VENUE ORDER BY CLOSING_DATE DESC;

--The 15 most recently demolished venues

SELECT TOP 15 * FROM VENUE ORDER BY DEMOLITION_DATE DESC;

--The 5 most expensive venues

SELECT TOP 5 * FROM VENUE ORDER BY CONSTRUCTION_COST_$M DESC;

