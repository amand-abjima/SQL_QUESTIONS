/*Use the WHERE clause in SQL queries to combine criteria and filter a list of albums.

Write a query to return rows from the Album table where the album reached a peak position of 1 in the US Billboard 200 chart, 
and which had sales of at least 10 million, sorting the results in ascending order of Title.

Write another query in the same script which shows albums which reached number 1 in the chart, or which had sales of 
at least 10 million.

Add another query to show gold-certified albums. The RIAA classifies gold-certified albums as those with
sales of at least 0.5 million but less than 1 million.

Modify this query to show gold-certified albums which reached number 1 in the chart.

Add a query to show platinum-certified albums (those with sales of at least 1 million but less than 2 million) 
which had a peak chart position in the top 10.

Add a query which shows multi-platinum-certified albums (those with sales of at least 2 million but less 
than 10 million) which charted outside the top 10.

*/

SELECT * FROM ALBUM;

SELECT TITLE,US_BILLBOARD_200_PEAK,[US_SALES_(M)] FROM ALBUM;

SELECT TITLE,US_BILLBOARD_200_PEAK,[US_SALES_(M)] FROM ALBUM WHERE US_BILLBOARD_200_PEAK = 1 AND [US_SALES_(M)] >= 10 ORDER BY TITLE ASC;

SELECT TITLE,US_BILLBOARD_200_PEAK,[US_SALES_(M)] FROM ALBUM WHERE US_BILLBOARD_200_PEAK = 1 OR [US_SALES_(M)] >= 10 ORDER BY TITLE ASC;

SELECT TITLE,US_BILLBOARD_200_PEAK,[US_SALES_(M)] FROM ALBUM WHERE [US_SALES_(M)] >= 0.5 AND [US_SALES_(M)] < 1 ORDER BY TITLE ASC;

SELECT TITLE,US_BILLBOARD_200_PEAK,[US_SALES_(M)] FROM ALBUM WHERE US_BILLBOARD_200_PEAK = 1 AND [US_SALES_(M)] >= 0.5 AND [US_SALES_(M)] < 1 ORDER BY TITLE ASC;

SELECT TITLE,US_BILLBOARD_200_PEAK,[US_SALES_(M)] FROM ALBUM WHERE [US_SALES_(M)] >= 1 AND [US_SALES_(M)] < 2 AND
US_BILLBOARD_200_PEAK <= 10 ORDER BY TITLE ASC;

SELECT TOP 10 TITLE,US_BILLBOARD_200_PEAK,[US_SALES_(M)] FROM ALBUM WHERE [US_SALES_(M)] >= 2 AND [US_SALES_(M)] < 10 AND
US_BILLBOARD_200_PEAK > 10 ORDER BY TITLE ASC;


