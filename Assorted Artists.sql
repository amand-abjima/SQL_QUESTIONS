/* 	Write a basic SQL Select statement to return an ordered list of musical artists.

 Write a SELECT statement to return the columns shown in the image below from the Artist table.

 Create aliases for the columns so that their names appear as shown in the image below:

 Add an ORDER BY clause to the query so that the artists appear in descending order of the year they were formed.

 Extend the ORDER BY clause so that if more than one artist was formed in the same year they appear in alphabetic order of name.

*/

SELECT * FROM ARTIST;

SELECT ARTIST,ARTIST_TYPE,YEAR_FORMED FROM ARTIST;

SELECT ARTIST AS 'ARTIST NAME', ARTIST_TYPE AS 'TYPE OF ARTIST', YEAR_FORMED AS 'YEAR FORMED' FROM ARTIST  
ORDER BY YEAR_FORMED DESC,ARTIST ASC;