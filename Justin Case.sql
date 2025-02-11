/*Use CASE expressions in SQL queries to categorise a list of concerts by ticket sales and cancellations.

Create a query which selects the columns shown below from the Show table. Include a calculated column using
a CASE expression to categorise shows as shown in the Ticket_status column below:

Write a query which selects the columns shown below from the Show table. Include a calculated column which 
provides a description as shown in the Cancellation_status column shown below:

Create a query which selects rows from the Track table. Include a calculated column called Track_status which
categorises tracks based on their chart performance.

*/

SELECT * FROM SHOW;

SELECT SHOW_ID,
       SHOW_DATE,
	   TICKETS_AVAILABLE,
	   TICKETS_SOLD,
	   CASE WHEN TICKETS_AVAILABLE IS NULL OR TICKETS_SOLD IS NULL THEN 'UNKNOWN'
	   WHEN TICKETS_AVAILABLE = TICKETS_SOLD  THEN 'SOLD OUT'
	   WHEN TICKETS_SOLD >= (TICKETS_AVAILABLE/2) THEN '50% OR MORE SOLD'
	   ELSE'LESS THAN 50% SOLD'
	   END AS TICKET_STATUS
	   FROM SHOW;

SELECT SHOW_ID,
       SHOW_DATE,
	   CANCELLED,
	   CANCELLATION_REASON,
	   CASE WHEN CANCELLED  = 0 AND CANCELLATION_REASON IS NULL THEN 'NOT CANCELLED'
	   WHEN CANCELLED  = 1 AND CANCELLATION_REASON IS NULL THEN 'CANCELLED FOR UNKNOWN REASONS'
	   WHEN CANCELLATION_REASON LIKE '%COVID%' THEN 'CANCELLED DUE TO COVID'
	   ELSE 'CANCELLED FOR OTHER REASONS'
	   END AS CANCELLATION_REASON
	   FROM SHOW;

SELECT SHOW_ID,
       SHOW_DATE,
	   CANCELLED,
	   CANCELLATION_REASON,
	   CASE WHEN CANCELLED  = 0 THEN 'NOT CANCELLED'
	   WHEN CANCELLATION_REASON IS NULL THEN 'CANCELLED FOR UNKNOWN REASONS'
	   WHEN CANCELLATION_REASON LIKE '%COVID%' THEN 'CANCELLED DUE TO COVID'
	   ELSE 'CANCELLED FOR OTHER REASONS'
	   END AS CANCELLATION_REASON
	   FROM SHOW
	   WHERE CANCELLED = 1;

SELECT * FROM TRACK;

SELECT TRACK_ID,
       TRACK_NAME,
	   SINGLE_RELEASE_DATE,
	   US_BILLBOARD_HOT_100_PEAK,
	   CASE WHEN US_BILLBOARD_HOT_100_PEAK IS NULL AND SINGLE_RELEASE_DATE IS NOT NULL THEN 'Non-charting single'
	   WHEN SINGLE_RELEASE_DATE IS NULL AND US_BILLBOARD_HOT_100_PEAK IS NULL THEN 'Album track'
	   WHEN US_BILLBOARD_HOT_100_PEAK = 1 THEN 'Number 1 SINGLE'
	   WHEN US_BILLBOARD_HOT_100_PEAK <= 10 THEN 'Top 10 single'
	   ELSE 'Charting single'
	   END AS TRACK_STATUS
	   FROM TRACK;


------------------------------------------------------- OR ------------------------------------------------------------

select
	t.Track_ID
	,t.Track_name
	,t.Single_release_date
	,t.US_Billboard_Hot_100_peak
	,case
		when Single_release_date is null then 'Abum track'
		when US_Billboard_Hot_100_peak = 1 then 'Number 1 single'
		when US_Billboard_Hot_100_peak <= 10 then 'Top 10 single'
		when US_Billboard_Hot_100_peak > 10 then 'Charting single'
		else 'Non-charting single'
	end as Track_status
from
	dbo.Track as t