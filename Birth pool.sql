/*Use the DATEDIFF and the ABS functions to list the events in order of closeness to when you were born.

The idea behind this exercise is to see what was happening in the world around the time when you were 
born (but you can use any reference date).  First create a query to show the number of days which have elapsed 
for any event since your birthday:


*/

SELECT * FROM TBLEVENT;

SELECT EVENTNAME,
       FORMAT(EVENTDATE,'dd MMM yyyy') AS 'EVENT DATE',
	   DATEDIFF(DAY,EVENTDATE,'06-08-1999') AS 'DAYS OFFSET',
	   ABS(DATEDIFF(DAY,EVENTDATE,'06-08-1999')) AS 'DAYS DIFFERENCE'
	   FROM TBLEVENT
       ORDER BY 'DAYS DIFFERENCE' ASC;

------------------------------------------------ OR ----------------------------------------------------------

SELECT
	e.EventName,
	FORMAT(e.EventDate,'dd MMM yyyy') AS 'Event date',

	-- difference in days
	DateDiff(day,e.EventDate,'19990608') AS 'Days offset',

	-- number of days from birthday
	ABS(
		DateDiff(day,e.EventDate,'19990608')
	) AS 'Days difference'
FROM
	tblEvent AS e
ORDER BY
	-- show closest events first
	'Days difference' ASC



