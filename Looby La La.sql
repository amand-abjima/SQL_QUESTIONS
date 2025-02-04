/*	Use a WHERE clause to show events which contain two given text strings.

Create a query which lists out all of the tblEvent events which include the word Teletubbies:

Now add an OR condition to your query so that it lists out all events whose:

Name includes Teletubbies; or
Name includes Pandy.
*/

SELECT * FROM TBLEVENT;

SELECT * FROM TBLEVENT WHERE EVENTNAME LIKE '%Teletubbies%' OR EVENTNAME LIKE '%Pandy%';