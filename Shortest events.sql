/*List for each event the number of characters in its name.

Use this nugget of information to create a query listing out each event with the length of its name, 
with the "shortest event" first:

*/

-- how big is Wise Owl?

SELECT LEN('WISE OWL') AS LENGTHS;

SELECT * FROM TBLEVENT;

SELECT EVENTNAME,LEN(EVENTNAME) FROM TBLEVENT ORDER BY LEN(EVENTNAME);

