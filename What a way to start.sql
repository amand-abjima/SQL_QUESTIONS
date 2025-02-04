/* Create a query to list out the following columns from the tblEvent table, with the most recent first 
(for which you'll need to use an ORDER BY clause):

•The event name
•The event date */

SELECT * FROM TBLEVENT;

SELECT EVENTNAME,EVENTDATE FROM TBLEVENT ORDER BY EVENTDATE DESC;