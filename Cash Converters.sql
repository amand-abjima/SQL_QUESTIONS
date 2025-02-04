/*Use the CAST and CONVERT functions in SQL queries to control the data types of calculated columns.

Write a query to return the following columns from the Tour table:

Add a calculated column called Avg_ticket_price which divides the tour gross by the attendance.

To produce a non-integer result you need to modify the type of at least one of the columns involved in the calculation. 
Use the CAST or CONVERT function to change the data type of the Attendance values to DECIMAL.

To control the number of decimal places you can wrap another CAST or CONVERT function around your existing expression, 
changing the data type of the answer to DECIMAL(5, 2) (that is, show the number with a maximum of 5 digits, 
with 2 of those digits after the decimal point).

Add an ORDER BY clause to sort the results in descending order of average ticket price.



*/

SELECT * FROM TOUR;

SELECT TOUR_NAME,ATTENDANCE,TOUR_GROSS_$ FROM TOUR;

SELECT TOUR_NAME,ATTENDANCE,TOUR_GROSS_$, TOUR_GROSS_$/ATTENDANCE AS AVG_TICKET_PRICE FROM TOUR;

SELECT TOUR_NAME,ATTENDANCE,TOUR_GROSS_$, CAST(TOUR_GROSS_$ AS FLOAT)/CAST(ATTENDANCE AS FLOAT) AVG_TICKET_PRICE FROM TOUR;

SELECT TOUR_NAME,ATTENDANCE,TOUR_GROSS_$, CAST(CAST(TOUR_GROSS_$ AS FLOAT)/CAST(ATTENDANCE AS FLOAT) AS DECIMAL(5,2)) AS AVG_TICKET_PRICE FROM TOUR
ORDER BY AVG_TICKET_PRICE DESC;

