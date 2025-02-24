/*Use grouping to show how many episodes each Doctor Who author wrote.

The authors and episodes tables are related.

Use this to show for each author:

• the number of episodes they wrote;
• their earliest episode date; and
• their latest episode date.

If you sort these so that the most prolific authors come first, here are the first few of the 25 rows you should see:



*/

SELECT * FROM TBLAUTHOR;

SELECT * FROM TBLEPISODE;

SELECT A.AUTHORNAME,
       COUNT(EPISODEID) AS EPISODES,
	   MAX(EPISODEDATE) AS 'EARLIEST DATE',
	   MIN(EPISODEDATE) AS 'LATEST DATE'
	   FROM TBLAUTHOR A JOIN TBLEPISODE E
	   ON A.AUTHORID = E.AUTHORID 
	   GROUP BY A.AUTHORNAME
	   ORDER BY EPISODES DESC;
