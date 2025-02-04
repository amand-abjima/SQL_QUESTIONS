/*Create a query using TOP N to show the last 3 categories in a table.

Create a query to list out the id number and name of the last 3 categories from the tblCategory table in alphabetical order:

*/

SELECT * FROM TBLCATEGORY;

SELECT TOP 3 * FROM TBLCATEGORY ORDER BY CATEGORYNAME DESC;