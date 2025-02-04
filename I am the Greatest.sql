/* Use the WHERE clause in a SQL query to test conditions on text fields for a list of music albums.

Write a query to return the following columns from the Album table where the album title is Greatest Hits

Write another query in the same script which shows albums with titles which contain Greatest Hits.

Write a new query in the same script which selects rows from the Tour table where the tour name ends with the word Tour.

Add a new query to the same script which selects tours where the tour name does not include the word Tour.

*/

SELECT * FROM ALBUM;

SELECT TITLE,RELEASE_DATE,WIKI_URL FROM ALBUM WHERE TITLE LIKE 'GREATEST HITS';

SELECT TITLE,RELEASE_DATE,WIKI_URL FROM ALBUM WHERE TITLE LIKE '%GREATEST HITS%';

SELECT * FROM TOUR;

SELECT TOUR_NAME,START_DATE,SHOWS FROM TOUR WHERE TOUR_NAME LIKE '%TOUR';

SELECT TOUR_NAME,START_DATE,SHOWS FROM TOUR WHERE TOUR_NAME NOT LIKE '%TOUR%';

