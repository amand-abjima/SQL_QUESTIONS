/*Create calculated columns in SQL queries which concatenate multiple values to form longer strings.

Add a calculated column which concatenates the artist's name and type, wrapping the type of artist in round brackets.

Write another query which selects the following fields from the Track table:

Replace the Track_mins and Track_secs columns with a calculated column which concatenates the values .

*/

SELECT * FROM ARTIST;

SELECT ARTIST,ARTIST_TYPE FROM ARTIST;

SELECT ARTIST,ARTIST_TYPE,ARTIST+' '+'('+ARTIST_TYPE+')' AS 'ARTIST_AND_TYPE' FROM ARTIST;

--------------------------------------OR------------------------------------------

SELECT ARTIST,ARTIST_TYPE,CONCAT(ARTIST,' ','(',ARTIST_TYPE,')') AS 'ARTIST_AND_TYPE' FROM ARTIST;

SELECT * FROM TRACK;

SELECT TRACK_NAME,TRACK_MINS,TRACK_SECS FROM TRACK;

SELECT TRACK_NAME,(CAST(TRACK_MINS AS VARCHAR(10))+'m'+' '+CAST(TRACK_SECS AS VARCHAR(10))+'s') AS TRACK_LENGTH FROM TRACK;

--------------------------------------OR------------------------------------------

SELECT TRACK_NAME,CONCAT(TRACK_MINS,'m',' ',TRACK_SECS,'s') AS TRACK_LENGTH FROM TRACK;
