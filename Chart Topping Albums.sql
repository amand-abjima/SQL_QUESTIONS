/*Use the WHERE clause in a SQL query to return lists of albums filtered by different criteria.

Write a query to return the following fields from the Album table, sorting the results in ascending order of Title:

Add a WHERE clause to the query to show only albums which reached number 1 in the US Billboard 200 chart.

Write a separate query in the same script to show albums which were number 1 in the US Billboard 200 year end chart.

Create a separate query in the same script to show albums which made it into the top 10 in the US Billboard 200 chart. 
To do this, check if the album's peak chart position was less than or equal to 10.We've sorted the results in 
descending order of chart position then ascending order of Title.

Write another query in the same script to return all the diamond-certified albums. 
The RIAA (Recording Industry Association of America) certifies an album as diamond when it has sales of at least 10 million.
The first few results you should see if you sort the albums by Title.


*/

SELECT * FROM ALBUM;

SELECT TITLE,US_Billboard_200_peak,US_Billboard_200_year_end,[US_sales_(m)] FROM ALBUM ORDER BY TITLE ASC;

SELECT TITLE,US_Billboard_200_peak,US_Billboard_200_year_end,[US_sales_(m)] FROM ALBUM WHERE US_Billboard_200_peak = 1
ORDER BY TITLE ASC;

SELECT TITLE,US_Billboard_200_peak,US_Billboard_200_year_end,[US_sales_(m)] FROM ALBUM WHERE US_Billboard_200_year_end = 1
ORDER BY TITLE ASC;

SELECT TOP 10 TITLE,US_Billboard_200_peak,US_Billboard_200_year_end,[US_sales_(m)] FROM ALBUM;

SELECT TITLE,US_Billboard_200_peak,US_Billboard_200_year_end,[US_sales_(m)] FROM ALBUM WHERE US_Billboard_200_peak <= 10
ORDER BY US_Billboard_200_peak DESC,TITLE ASC;

SELECT TITLE,US_Billboard_200_peak,US_Billboard_200_year_end,[US_sales_(m)] FROM ALBUM
WHERE [US_sales_(m)] >= 10 ORDER BY TITLE;




