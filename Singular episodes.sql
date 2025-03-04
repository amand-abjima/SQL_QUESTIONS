/* Use views based on views to show Doctor Who episodes with only 1 enemy and 1 companion.

Create a series of views which will ultimately list out all of the episodes which had 
both multiple enemies and multiple companions.


*/

SELECT * FROM TBLAUTHOR;

SELECT * FROM TBLCOMPANION;

SELECT * FROM TBLDOCTOR;

SELECT * FROM TBLENEMY;

SELECT * FROM TBLEPISODE;
SELECT * FROM TBLEPISODEENEMY;

SELECT * FROM TBLEPISODECOMPANION;

SELECT * FROM TBLEPISODEENEMY;


-- List all of the episodes which had only a single companion.

CREATE VIEW vwEpisodeCompanion
AS
SELECT EP.EPISODEID,
       EP.TITLE,
	   COUNT(*) AS NUMBEROFEPISODES 
	   FROM TBLEPISODE EP JOIN TBLEPISODECOMPANION EC
       ON EP.EPISODEID = EC.COMPANIONID
	   GROUP BY EP.EPISODEID,
	   EP.TITLE
	   HAVING COUNT(*) = 1;

SELECT * FROM vwEpisodeCompanion;

-- List all of the episodes which had only a single enemy.

CREATE VIEW vwEpisodeEnemy
AS
SELECT EP.EPISODEID,
       EP.TITLE,
       COUNT(*) AS 'NUMBEROFEPISODES'
	   FROM TBLEPISODE EP JOIN TBLEPISODEENEMY EE
	   ON EP.EPISODEID = EE.EPISODEID
	   GROUP BY EP.EPISODEID,
	   EP.TITLE
	   HAVING COUNT(*) = 1;

SELECT * FROM vwEpisodeEnemy;

-- List all of the episodes which have no corresponding rows in either the vwEpisodeCompanion or vwEpisodeEnemy tables.

CREATE VIEW vwEpisodeSummary
AS
SELECT EP.EPISODEID,
       EP.TITLE
	   FROM TBLEPISODE EP 
	   LEFT OUTER JOIN vwEpisodeCompanion EC ON EP.EPISODEID = EC.EPISODEID
	   LEFT OUTER JOIN vwEpisodeEnemy EE ON EE.EPISODEID = EP.EPISODEID
	   WHERE EC.EPISODEID IS NULL AND
	   EE.EPISODEID IS NULL;

SELECT * FROM vwEpisodeSummary ORDER BY TITLE;




