/*Add criteria to a SQL query to show singles released on different dates.

Add a WHERE clause to the query so that it only returns tracks which were released as singles on the 24th of March 2022.

Write another query in the same script which shows singles released before the 1st of January 2000.

pick singles from the 80s you need to find tracks whose release date is between the 1st of 
January 1980 and the 31st of December 1989.

modify the query so that it returns only the singles which reached number 1 in the US Billboard Hot 100 chart in the 
decade you've chosen.
*/

SELECT * FROM TRACK;

SELECT TRACK_NAME,SINGLE_RELEASE_DATE,US_Billboard_Hot_100_peak FROM TRACK ORDER BY SINGLE_RELEASE_DATE DESC;

SELECT TRACK_NAME,SINGLE_RELEASE_DATE,US_Billboard_Hot_100_peak FROM TRACK
WHERE SINGLE_RELEASE_DATE = '2022-03-24' ORDER BY SINGLE_RELEASE_DATE DESC;

SELECT TRACK_NAME,SINGLE_RELEASE_DATE,US_Billboard_Hot_100_peak FROM TRACK
WHERE SINGLE_RELEASE_DATE < '2000-01-01 ' ORDER BY SINGLE_RELEASE_DATE DESC;

SELECT TRACK_NAME,SINGLE_RELEASE_DATE,US_Billboard_Hot_100_peak FROM TRACK
WHERE SINGLE_RELEASE_DATE BETWEEN '1980-01-01' AND '1989-12-31' AND US_Billboard_Hot_100_peak = 1 
ORDER BY SINGLE_RELEASE_DATE DESC;

SELECT * FROM TRACK WHERE DATEPART(YEAR,SINGLE_RELEASE_DATE) = 1999;

