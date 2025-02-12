/*Use the DATENAME and DATEPART functions to show events taking place on Friday 13th of any month/year.

Create a query to show the day of the week and also the day number on which each event occurred.
You can use the DATENAME function to get the day of the week, and the DAY or the DATEPART functions 
to get the day number.

Use this to show:

That mercifully there weren't any events on Friday the 13th;
That there was one event on Thursday 12th (the day before); and
That there were two events on Saturday the 14th (the day after).

*/

SELECT * FROM TBLEVENT;

SELECT EVENTNAME,
       EVENTDATE,
	   DATENAME(WEEKDAY,EVENTDATE) AS 'Day of week',
	   DATEPART(DAY,EVENTDATE) AS 'Day number'
	   FROM TBLEVENT
	   WHERE
	       (
	           (DATENAME(WEEKDAY,EVENTDATE) NOT LIKE 'FRIDAY' AND DATEPART(DAY,EVENTDATE) NOT IN (13)) AND
	        ( 
	           (DATENAME(WEEKDAY,EVENTDATE) LIKE 'THURSDAY' AND DATEPART(DAY,EVENTDATE) = 12) 
			 OR 
	           (DATENAME(WEEKDAY,EVENTDATE) LIKE 'SATURDAY' AND DATEPART(DAY,EVENTDATE) = 14)
			)
		);





