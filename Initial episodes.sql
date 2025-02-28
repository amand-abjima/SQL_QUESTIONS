/*Use the view designer to create a view, and change it in SQL.

Include the tables tblAuthor, tblEpisode and tblDoctor, and use the view designer to 
create a view listing the episodes whose titles start with F.

You'll have to confirm at this stage that you want to add a TOP 100 PERCENT clause to 
the start of your view, so that sorting can be enabled.

change the criteria to show episodes starting with H.
*/

SELECT * FROM TBLAUTHOR;

SELECT * FROM TBLEPISODE;

SELECT * FROM TBLDOCTOR;

CREATE VIEW [VWEPISODESBYFIRSTLETTER] 
AS
SELECT A.AUTHORNAME,
       D.DOCTORNAME,
	   E.TITLE,
	   E.EPISODEDATE
	   FROM TBLAUTHOR A JOIN TBLEPISODE E
	   ON A.AUTHORID = E.AUTHORID 
	   JOIN TBLDOCTOR D 
	   ON D.DOCTORID = E.DOCTORID
	   WHERE E.TITLE LIKE 'F%';

SELECT * FROM [VWEPISODESBYFIRSTLETTER];

ALTER VIEW [VWEPISODESBYFIRSTLETTER] 
AS
SELECT TOP 100 PERCENT 
       A.AUTHORNAME,
       D.DOCTORNAME,
	   E.TITLE,
	   E.EPISODEDATE
	   FROM TBLAUTHOR A JOIN TBLEPISODE E
	   ON A.AUTHORID = E.AUTHORID 
	   JOIN TBLDOCTOR D 
	   ON D.DOCTORID = E.DOCTORID
	   WHERE E.TITLE LIKE 'H%'
	   ORDER BY E.EPISODEDATE;

SELECT * FROM [VWEPISODESBYFIRSTLETTER];