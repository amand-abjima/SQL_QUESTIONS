/*Use inner joins to link four tables to show Dr Who enemies by author.

Write a query using inner joins to show all of the authors who have written episodes featuring the Daleks. 

*/

SELECT * FROM TBLENEMY;

SELECT * FROM TBLEPISODEENEMY;

SELECT * FROM TBLEPISODE;

SELECT * FROM TBLAUTHOR;

SELECT A.AUTHORNAME,
       E.TITLE,
	   EN.ENEMYNAME
	   FROM TBLAUTHOR A JOIN TBLEPISODE E ON A.AUTHORID = E.AUTHORID JOIN
	   TBLEPISODEENEMY EEP ON EEP.EPISODEID = E.EPISODEID JOIN
	   TBLENEMY EN ON EN.ENEMYID = EEP.ENEMYID
	   WHERE EN.ENEMYNAME LIKE '%DALEK%';

