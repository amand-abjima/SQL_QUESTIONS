/*Use text functions in SQL queries to clean up messy text data.

Write a query to show a list of track names from the Track table, sorted in ascending order of name.

Some tracks have a leading space in their name, meaning that the list isn't sorted quite as we want it. 
Add a calculated column which trims the track names and use this new column to sort the results.

Some track names are wrapped in double quotes while others aren't. Add a calculated column which both trims the track
name and replaces any double quote with an empty string. Sort the results in ascending order of this new column.

Add a WHERE clause which returns tracks whose cleaned up name begins with A.
*/

SELECT * FROM TRACK;

SELECT TRACK_NAME FROM TRACK ORDER BY TRACK_NAME ASC;

SELECT TRACK_NAME,
       TRIM(LEADING ' ' FROM TRACK_NAME) AS TRIMMED_TRACK
	   FROM TRACK 
	   ORDER BY TRIMMED_TRACK;

SELECT TRACK_NAME,
       TRIM(REPLACE(TRACK_NAME,'"','')) AS REPLACE_TRIMMED_TRACK
	   FROM TRACK 
	   ORDER BY REPLACE_TRIMMED_TRACK;

SELECT TRACK_NAME,
       TRIM(REPLACE(TRACK_NAME,'"','')) AS REPLACE_TRIMMED_TRACK
	   FROM TRACK 
	   WHERE TRIM(REPLACE(TRACK_NAME,'"','')) LIKE 'A%'
	   ORDER BY REPLACE_TRIMMED_TRACK;
       


       