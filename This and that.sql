/*Use the CHARINDEX function multiple times to show the number of characters between two words in a text string.

The aim of this exercise is to find this and that in the EventDetails column (in that order).

There are 3 rows containing both words, but these are the only 2 containing them in the right order.

You should find the CHARINDEX function useful.  Here's an example:

****** CHARINDEX( 'Trump', 'Donald Trump', 1) ******

This would return 8, since Trump begins in Donald Trump at the 8th character (starting from 1).
*/

SELECT * FROM TBLEVENT;

SELECT EVENTNAME,
       EVENTDETAILS 
	   FROM TBLEVENT
	   ORDER BY EVENTNAME DESC; 

SELECT EVENTNAME,
       EVENTDATE,
	   CHARINDEX('this',EVENTDETAILS,1) AS thisPosition,
	   CHARINDEX('that',EVENTDETAILS,1) AS thatPosition,
	   ABS(CHARINDEX('this',EVENTDETAILS,1) - CHARINDEX('that',EVENTDETAILS,1)) AS Offset
	   FROM TBLEVENT
	   WHERE ABS(CHARINDEX('this',EVENTDETAILS,1) - CHARINDEX('that',EVENTDETAILS,1)) > 0 AND
	   EVENTDETAILS LIKE '%this%' AND EVENTDETAILS LIKE '%that%'
	   ORDER BY EVENTNAME DESC;

SELECT EVENTNAME,
       EVENTDATE,
	   CHARINDEX('this',EVENTDETAILS,1) AS thisPosition,
	   CHARINDEX('that',EVENTDETAILS,1) AS thatPosition,
	   ABS(CHARINDEX('this',EVENTDETAILS,1) - CHARINDEX('that',EVENTDETAILS,1)) AS Offset
	   FROM TBLEVENT
	   WHERE ABS(CHARINDEX('this',EVENTDETAILS,1) - CHARINDEX('that',EVENTDETAILS,1)) > 0 AND
	   EVENTDETAILS LIKE '%this%' AND EVENTDETAILS LIKE '%that%' 
	   AND CHARINDEX('this',EVENTDETAILS,1) < CHARINDEX('that',EVENTDETAILS,1);

---------------------------------------- OR -----------------------------------------------------------------

SELECT EVENTNAME,
       EVENTDATE,
	   CHARINDEX('this',EVENTDETAILS,1) AS thisPosItion,
	   CHARINDEX('that',EVENTDETAILS,1) AS thatPosItion,
	   CHARINDEX('that',EVENTDETAILS,1) - CHARINDEX('this',EVENTDETAILS,1) AS OFFSET
	   FROM TBLEVENT
	   WHERE CHARINDEX('this',EVENTDETAILS,1) > 0 AND
	   CHARINDEX('that',EVENTDETAILS,1) > 0 AND
	   CHARINDEX('that',EVENTDETAILS,1) - CHARINDEX('this',EVENTDETAILS,1) > 0;

	   