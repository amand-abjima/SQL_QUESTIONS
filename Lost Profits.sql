/*Add basic expressions to an SQL query to calculate new values from existing columns in a table. 

Add a new column to the SELECT list which subtracts the Tickets_sold column from the Tickets_available column.
Apply an alias to your new column to name it Unsold_tickets.

Add an ORDER BY clause to sort the shows in descending order of unsold tickets. You can use your column alias to do this.

Add a WHERE clause to return only shows which had at least 10000 unsold tickets.(You won't be able to use your column alias
in the WHERE clause so you'll need to repeat the calculation in this part of your query.)

Add another calculated column to the same query which divides the Revenue_$ column by the Tickets_sold column. 
Name this column Avg_ticket_price.

Add another calculated column which multiplies the number of unsold tickets by the average ticket price. 
You won't be able to refer to your previous calculated columns which means you'll need to repeat both expressions 
in your new formula. Don't forget to use round brackets to control the order of operations!



*/

SELECT * FROM SHOW;

SELECT SHOW_DATE,TICKETS_AVAILABLE,TICKETS_SOLD,REVENUE_$ FROM SHOW;

SELECT SHOW_DATE,TICKETS_AVAILABLE,TICKETS_SOLD,(TICKETS_AVAILABLE-TICKETS_SOLD) AS 'UNSOLD_TICKETS',REVENUE_$ FROM SHOW;

SELECT SHOW_DATE,TICKETS_AVAILABLE,TICKETS_SOLD,(TICKETS_AVAILABLE-TICKETS_SOLD) AS 'UNSOLD_TICKETS',REVENUE_$ FROM SHOW ORDER BY UNSOLD_TICKETS DESC;

SELECT SHOW_DATE,TICKETS_AVAILABLE,TICKETS_SOLD,(TICKETS_AVAILABLE-TICKETS_SOLD) AS 'UNSOLD_TICKETS',REVENUE_$ FROM SHOW
WHERE (TICKETS_AVAILABLE-TICKETS_SOLD) >= 10000 ORDER BY UNSOLD_TICKETS DESC;

SELECT SHOW_DATE,TICKETS_AVAILABLE,TICKETS_SOLD,(TICKETS_AVAILABLE-TICKETS_SOLD) AS 'UNSOLD_TICKETS',
REVENUE_$,(REVENUE_$/TICKETS_SOLD) AS AVG_TICKET_PRICE FROM SHOW 
WHERE (TICKETS_AVAILABLE-TICKETS_SOLD) >= 10000 ORDER BY UNSOLD_TICKETS DESC;

SELECT SHOW_DATE,
       TICKETS_AVAILABLE, 
	   TICKETS_SOLD,
	   (TICKETS_AVAILABLE-TICKETS_SOLD) AS 'UNSOLD_TICKETS',
       REVENUE_$,
	   (REVENUE_$/TICKETS_SOLD) AS AVG_TICKET_PRICE,
       (TICKETS_AVAILABLE-TICKETS_SOLD)*(REVENUE_$/TICKETS_SOLD) AS 'LOST_REVENUE' 
	   FROM SHOW 
       WHERE 
	   (TICKETS_AVAILABLE-TICKETS_SOLD) >= 10000 
	   ORDER BY UNSOLD_TICKETS DESC;







