/*Divide events according to whether their first/last letters are the same or vowels.

A boring event is one which doesn't begin and end with the same letter, and which doesn't begin and end with a vowel!
*/

SELECT * FROM TBLEVENT;

SELECT EVENTNAME,

       -- Same vowel (first and last characters are the same vowel)

	   CASE WHEN LEFT(EVENTNAME,1) = RIGHT(EVENTNAME,1) AND
	   LEFT(EVENTNAME,1) IN('A','E','I','O','U') THEN 'SAME VOWEL'

	   -- ones where the left and right letter are the same

	   WHEN LEFT(EVENTNAME,1) = RIGHT(EVENTNAME,1) THEN 'SAME LETTER'

       -- ones where both left and right letters are in the string of vowels

       WHEN LEFT(EVENTNAME,1) IN('A','E','I','O','U') AND RIGHT(EVENTNAME,1) IN('A','E','I','O','U')
	   THEN 'BEGINS AND ENDS WITH VOWEL'

	   --one which doesn't begin and end with the same letter, and which doesn't begin and end with a vowel!

	   /*WHEN (LEFT(EVENTNAME,1) NOT IN('A','E','I','O','U') AND RIGHT(EVENTNAME,1) NOT IN('A','E','I','O','U')) AND
	   (LEFT(EVENTNAME,1) != RIGHT(EVENTNAME,1)) THEN 'BORING EVENTS'*/
	   ELSE 'BORING EVENTS'
	   END AS VERDICT
	   FROM TBLEVENT
	   WHERE 

	   -- Filter out boring events

	   
	   (LEFT(EVENTNAME,1) IN('A','E','I','O','U') AND RIGHT(EVENTNAME,1) IN('A','E','I','O','U')) OR
	   LEFT(EVENTNAME,1) = RIGHT(EVENTNAME,1) 
	   
	   ORDER BY EVENTDATE ASC;

-------------------------------------------------------------- OR ------------------------------------------------------------------

SELECT
    e.EventName,
    CASE
        -- Same vowel (first and last characters are the same vowel)
        WHEN LEFT(e.EventName, 1) = RIGHT(e.EventName, 1) 
             AND LEFT(e.EventName, 1) IN ('A', 'E', 'I', 'O', 'U') THEN 'Same vowel'
        
        -- Same letter (first and last characters are the same, but not necessarily a vowel)
        WHEN LEFT(e.EventName, 1) = RIGHT(e.EventName, 1) THEN 'Same letter'

        -- Begins and ends with vowel
        WHEN LEFT(e.EventName, 1) IN ('A', 'E', 'I', 'O', 'U') 
             AND RIGHT(e.EventName, 1) IN ('A', 'E', 'I', 'O', 'U') THEN 'Begins and ends with vowel'

        -- Boring event
        ELSE 'Boring event!'
    END AS Verdict
FROM tblEvent AS e
WHERE
    -- Filter out boring events
    LEFT(e.EventName, 1) = RIGHT(e.EventName, 1) 
    OR (LEFT(e.EventName, 1) IN ('A', 'E', 'I', 'O', 'U') 
        AND RIGHT(e.EventName, 1) IN ('A', 'E', 'I', 'O', 'U'))
ORDER BY e.EventDate ASC;


