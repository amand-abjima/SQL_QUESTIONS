/*Group by 2 fields and use HAVING clause to show popular combinations.

Write a query to list out for each author and doctor the number of episodes made, 
but restrict your output to show only the author/doctor combinations for which more than 5 episodes have been written.



*/

SELECT * FROM TBLAUTHOR;

SELECT * FROM TBLEPISODE;

SELECT * FROM TBLDOCTOR;

SELECT A.AUTHORNAME,
       D.DOCTORNAME,
	   COUNT(EPISODEID) AS EPISODES
	   FROM TBLAUTHOR A JOIN TBLEPISODE E
	   ON A.AUTHORID = E.AUTHORID 
	   JOIN TBLDOCTOR D 
	   ON E.DOCTORID = D.DOCTORID
	   GROUP BY A.AUTHORNAME,
	   D.DOCTORNAME
	   HAVING COUNT(EPISODEID) > 5
	   ORDER BY EPISODES DESC;

