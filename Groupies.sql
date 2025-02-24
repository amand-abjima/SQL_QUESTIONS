/*Use the GROUP BY clause in SQL queries to calculate aggregated values for a list of music artists.

Write a query to return the Artist_type column from the Artist table.

Add a GROUP BY clause to the query to group the artist types together.

Add an extra column to the query which uses the COUNT function to find out how many artists of each 
type there are. You can count the values in any named column, or use the * to count the number of rows.

*/

SELECT * FROM ARTIST;

SELECT ARTIST_TYPE FROM ARTIST;

SELECT ARTIST_TYPE FROM ARTIST GROUP BY ARTIST_TYPE;

SELECT ARTIST_TYPE,COUNT(*) AS 'NUMBER_OF_ARTISTS' FROM ARTIST GROUP BY ARTIST_TYPE;