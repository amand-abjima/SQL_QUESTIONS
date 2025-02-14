/*Create a query containing a join to list out those films whose source is NA.

Create a query which links this table to the Film table using the SourceID column in each.
You should apply a WHERE clause so that your query lists out the 9 films in the database which have no source:

*/

SELECT * FROM SOURCE;

SELECT * FROM FILM;

SELECT T1.TITLE,T2.SOURCE 
       FROM FILM T1 JOIN 
	   SOURCE T2 
	   ON T1.SOURCEID = T2.SOURCEID 
	   WHERE T2.SOURCE = 'NA'
       ORDER BY T1.TITLE ASC;