/*Use GROUP BY and COUNT to report on the number of events for each category.

Create a query which:

• groups by the category name from the category table; and
• counts the number of events for each.

You'll need to create a join between the tblCategory and tblEvent tables to do this.

Sort your query to show the categories with most events first

*/

SELECT * FROM TBLCATEGORY;

SELECT * FROM TBLEVENT;

SELECT C.CATEGORYNAME,
       COUNT(*) AS 'NUMBER OF EVENTS'
	   FROM TBLCATEGORY C JOIN TBLEVENT E
	   ON C.CATEGORYID = E.CATEGORYID
	   GROUP BY C.CATEGORYNAME
	   ORDER BY 'NUMBER OF EVENTS' DESC;

