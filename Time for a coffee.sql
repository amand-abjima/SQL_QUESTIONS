/*Use inner joins to link lots of tables together, with a WHERE clause.

Create a query to list out the appearances of enemies in episodes which have length under 40 characters, where the length is defined as the sum of:

the number of characters in the author's name;
the number of characters in the episode's title;
the number of characters in the doctor's name; and
the number of characters in the enemy's name.

*/

SELECT * FROM TBLAUTHOR;

SELECT * FROM TBLDOCTOR;

SELECT * FROM TBLENEMY;

SELECT * FROM TBLEPISODE;

SELECT * FROM TBLEPISODEENEMY;


SELECT A.AUTHORNAME,
       EP.TITLE,
	   D.DOCTORNAME,
	   E.ENEMYNAME,

	   -- total length of the four columns being shown

	   LEN(A.AUTHORNAME)+LEN(EP.TITLE)+LEN(D.DOCTORNAME)+LEN(E.ENEMYNAME) AS 'TOTAL LENGTH'

	   FROM TBLENEMY E JOIN TBLEPISODEENEMY ENY ON E.ENEMYID = ENY.ENEMYID JOIN 
	   TBLEPISODE EP ON EP.EPISODEID = ENY.EPISODEID JOIN 
	   TBLDOCTOR D ON D.DOCTORID = EP.DOCTORID JOIN 
	   TBLAUTHOR A ON A.AUTHORID = EP.AUTHORID

	   WHERE LEN(A.AUTHORNAME)+LEN(EP.TITLE)+LEN(D.DOCTORNAME)+LEN(E.ENEMYNAME) < 40;

