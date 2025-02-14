/*Use date functions in SQL Server to calculate the lifespan of venues.

Write a query to select the following columns from the Venue table, making sure to 
select venues where neither the Construction_start_date or Opening_date is null.

Add a calculated column to work out the daily cost from the start of construction to the venue's opening.
Sort the results in descending order of this column

Write a query to select the following columns from the Venue table, making sure that each venue has 
a value in the Opening_date field.

Add a calculated column to show how many days a venue was open for. If the venue doesn't yet have a closing date,
use today's date instead (you can use the GETDATE function to calculate this). 
Sort the results in descending order of this column.

Write a query to show venues which have been closed, along with their date of demolition.

Extend the WHERE clause to show venues which were demolished within one month of being closed.

*/

SELECT * FROM VENUE;

SELECT VENUE,
       CONSTRUCTION_START_DATE,
	   OPENING_DATE,
	   CONSTRUCTION_COST_$M
	   FROM VENUE
	   WHERE CONSTRUCTION_START_DATE IS NOT NULL
	   AND OPENING_DATE IS NOT NULL;

SELECT VENUE,
       CONSTRUCTION_START_DATE,
	   OPENING_DATE,
	   CONSTRUCTION_COST_$M,
	   ROUND(CONSTRUCTION_COST_$M /(DATEDIFF(DAY,CONSTRUCTION_START_DATE,OPENING_DATE)),2)  AS COST_PER_DAY_$M
	   FROM VENUE
	   WHERE CONSTRUCTION_START_DATE IS NOT NULL
	   AND OPENING_DATE IS NOT NULL
	   ORDER BY COST_PER_DAY_$M DESC;

--================================================= OR =============================================================

select
	v.Venue
	,v.Construction_start_date
	,v.Opening_date
	,v.Construction_cost_$m
	,cast(v.Construction_cost_$m / cast(datediff(day, v.Construction_start_date, v.Opening_date) as decimal) as decimal(18,2)) as Cost_per_day_$m
from
	dbo.Venue as v
where
	Construction_start_date is not null
	and Opening_date is not null
order by
	Cost_per_day_$m desc;

SELECT VENUE,
       OPENING_DATE,
	   CLOSING_DATE
	   FROM VENUE
	   WHERE OPENING_DATE IS NOT NULL;

SELECT VENUE,
       OPENING_DATE,
	   CLOSING_DATE,
	   CASE WHEN CLOSING_DATE IS NULL THEN DATEDIFF(DAY,OPENING_DATE,GETDATE())
	   ELSE DATEDIFF(DAY,OPENING_DATE,CLOSING_DATE)
	   END AS DAYS_OPEN
	   FROM VENUE
	   WHERE OPENING_DATE IS NOT NULL
	   ORDER BY DAYS_OPEN DESC;

--================================================= OR =============================================================

select
	v.Venue
	,v.Opening_date
	,v.Closing_date
	,datediff(day, v.Opening_date, isnull(v.Closing_date, getdate())) as Days_open
from
	dbo.Venue as v
where
	Opening_date is not null
order by
	Days_open desc

SELECT VENUE,
       CLOSING_DATE,
	   DEMOLITION_DATE
	   FROM VENUE
	   WHERE CLOSING_DATE IS NOT NULL;


SELECT VENUE,
       CLOSING_DATE,
	   DEMOLITION_DATE
	   FROM VENUE
	   WHERE CLOSING_DATE IS NOT NULL AND 
	   DEMOLITION_DATE <= DATEADD(MONTH,1,CLOSING_DATE);

SELECT VENUE,
       CLOSING_DATE,
	   DEMOLITION_DATE
	   FROM VENUE
	   WHERE CLOSING_DATE IS NOT NULL AND 
	   DATEDIFF(YEAR,CLOSING_DATE,GETDATE()) >= 20
	   AND DEMOLITION_DATE IS NULL;
	   
--================================================= OR =============================================================

select
	v.Venue
	,v.Closing_date
	,v.Demolition_date
from
	dbo.Venue as v
where
	Closing_date is not null
	and Demolition_date is null
	and getdate() > dateadd(year, 20, v.Closing_date)