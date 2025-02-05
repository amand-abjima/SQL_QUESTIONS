/*Use the ISNULL function in SQL queries to convert nulls into meaningful values.

Write a query to select the following columns from the Venue table.

Use the ISNULL function to replace any nulls in the Other_names column with the phrase Never renamed.

Write a new query to select a list of cancelled shows from the Show table, including the columns shown below:

Use the ISNULL function to show the phrase No reason given for shows which don't have a reason for being cancelled.

*/

SELECT * FROM VENUE;

SELECT VENUE,OTHER_NAMES FROM VENUE;

SELECT VENUE,ISNULL(OTHER_NAMES,'NEVER RENAMED') AS OTHER_NAMES FROM VENUE;

SELECT * FROM SHOW;

SELECT SHOW_ID,SHOW_DATE,CANCELLED,CANCELLATION_REASON FROM SHOW WHERE CANCELLED = 1;

SELECT SHOW_ID,SHOW_DATE,CANCELLED,ISNULL(CANCELLATION_REASON,'NO REASON GIVEN') AS CANCELLATION_REASON FROM SHOW WHERE CANCELLED = 1;

