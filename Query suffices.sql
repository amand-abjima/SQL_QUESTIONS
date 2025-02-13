/*Display full dates, including the correct suffix (1st, 2nd, 3rd, etc).

Create a query to show the full dates for any event.

To get the suffix, you'll need to use a CASE statement based on the day number for any date.

*/

SELECT * FROM TBLEVENT;

SELECT EVENTNAME,
       FORMAT(EVENTDATE,'dddd dd MMMM yyyy') AS 'full date'
	   FROM TBLEVENT;

SELECT EVENTNAME,
       DATENAME(WEEKDAY,EVENTDATE)+' '+

	   DATENAME(DAY,EVENTDATE)+

	   CASE WHEN DATEPART(DAY,EVENTDATE) IN (1,21,31) THEN 'st'
	        WHEN DATEPART(DAY,EVENTDATE) IN (2,22) THEN 'nd'
			WHEN DATEPART(DAY,EVENTDATE) IN (3,23) THEN 'rd'
			ELSE 'th' 
			END +' '+ 

	   DATENAME(MONTH,EVENTDATE)+' '+

	   DATENAME(YEAR,EVENTDATE)
	   AS 'Full date'
	   FROM TBLEVENT
	   ORDER BY EVENTDATE ASC;