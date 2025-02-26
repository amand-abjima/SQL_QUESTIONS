/*	Use lots of grouping and criteria to list out year/doctor episode counts.

Write a query to list out for each episode year and enemy the number of episodes made, but in addition:

• Only show episodes made by doctors born before 1970; and
• Omit rows where an enemy appeared in only one episode in a particular year.

*/

SELECT * FROM TBLENEMY;

SELECT * FROM TBLEPISODE;

SELECT * FROM TBLEPISODEENEMY;

SELECT * FROM TBLDOCTOR;

SELECT YEAR(EP.EPISODEDATE) AS 'EPISODE YEAR',
       EN.ENEMYNAME,
	   COUNT(EP.EPISODEID) AS 'NUMBER OF EPISODES'
	   FROM TBLENEMY EN JOIN TBLEPISODEENEMY EE
	   ON EN.ENEMYID = EE.ENEMYID JOIN TBLEPISODE EP
	   ON EP.EPISODEID = EE.EPISODEID JOIN 
	   TBLDOCTOR D ON D.DOCTORID = EP.DOCTORID
	   WHERE YEAR(D.BIRTHDATE) < 1970
	   GROUP BY YEAR(EP.EPISODEDATE),EN.ENEMYNAME
	   HAVING COUNT(EP.EPISODEID) > 1
	   ORDER BY 'NUMBER OF EPISODES' DESC;
