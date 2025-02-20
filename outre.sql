/*Write an SQL outer join to show unmatched records in another table.

Use this to list the names of the companions who haven't featured in any episodes.
You should find there's one of them, but we won't spoil the surprise by saying who it is!
*/

SELECT * FROM TBLCOMPANION;

SELECT * FROM TBLEPISODECOMPANION;

SELECT C.COMPANIONNAME
       FROM TBLCOMPANION C LEFT JOIN TBLEPISODECOMPANION E
	   ON C.COMPANIONID = E.COMPANIONID
	   WHERE E.COMPANIONID IS NULL;