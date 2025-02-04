/*Write SQL queries using the WHERE clause to test for the existence of NULL in a list of music albums.

Write a query to return the following fields from the Album table:
(We've sorted the list alphabetically by Title.)

Modify the query to return albums which didn't appear in the US Billboard 200 chart - that is,
albums whose US_Billboard_200_peak position is NULL.

Write a query in the same script to show albums which appeared in any position the US Billboard 200 chart
but which didn't appear in the US Billboard 200 year end chart.

Write another query to return albums which had a peak chart position of 1 but which didn't appear in 
the year end chart.

Write another query to return albums which reached number 1 in the weekly chart but which were outside the 
top 10 in the year end chart.

*/

SELECT * FROM ALBUM;

SELECT TITLE,US_BILLBOARD_200_PEAK,US_BILLBOARD_200_YEAR_END FROM ALBUM ORDER BY TITLE ASC;

SELECT TITLE,US_BILLBOARD_200_PEAK,US_BILLBOARD_200_YEAR_END FROM ALBUM 
WHERE US_BILLBOARD_200_PEAK IS NULL ORDER BY TITLE ASC;

SELECT TITLE,US_BILLBOARD_200_PEAK,US_BILLBOARD_200_YEAR_END FROM ALBUM WHERE 
US_BILLBOARD_200_YEAR_END IS NULL ORDER BY TITLE ASC;

SELECT TITLE,US_BILLBOARD_200_PEAK,US_BILLBOARD_200_YEAR_END FROM ALBUM 
WHERE US_BILLBOARD_200_PEAK = 1 
AND US_BILLBOARD_200_YEAR_END IS NULL ORDER BY TITLE ASC;

SELECT TITLE,US_BILLBOARD_200_PEAK,US_BILLBOARD_200_YEAR_END FROM ALBUM 
WHERE (US_BILLBOARD_200_PEAK = 1) AND (US_BILLBOARD_200_YEAR_END > 10 
OR US_BILLBOARD_200_YEAR_END IS NULL)
ORDER BY TITLE ASC;






