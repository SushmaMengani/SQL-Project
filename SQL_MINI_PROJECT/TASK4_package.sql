CREATE OR REPLACE PACKAGE task4_Analytical_functions_statements IS
    PROCEDURE execute_Analytical_functions_statements;
END task4_Analytical_functions_statements;

CREATE OR REPLACE PACKAGE BODY task4_Analytical_functions_statements AS
   PROCEDURE execute_Analytical_functions_statements AS
   BEGIN
   /*--RANK 
SELECT title,
       external_rating,
       RANK()
       OVER(
           ORDER BY external_rating DESC
       ) rank
FROM content
ORDER BY rank;

---DENSE_RANK 
SELECT title,
       external_rating,
       DENSE_RANK()
       OVER(
           ORDER BY external_rating DESC
       ) dense_rank
FROM content
ORDER BY rank;
--ROW_NUMBER 
SELECT view_id,
       user_id,
       content_id,
       watch_date,
       ROW_NUMBER()
       OVER(
           ORDER BY view_id
       ) AS row_number
FROM viewing_history;
--LAG 
SELECT user_id,
       username,
       LAG(username, 1)
       OVER(
           ORDER BY username DESC
       ) lag
FROM users;
--LEAD 
SELECT user_id,
       username,
       LEAD(username, 1)
       OVER(
           ORDER BY username DESC
       ) lead
FROM users;
        
--FIRST_VALUE 
SELECT user_id,
       username,
       FIRST_VALUE(username)
       OVER(
           ORDER BY username DESC
       ) first_value
FROM users
FETCH FIRST 1 ROW ONLY;
        
---LAST VALUE
SELECT user_id,
       username,
       LAST_VALUE(username)
       OVER(
           ORDER BY username DESC
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) last_value
FROM users
FETCH FIRST 1 ROW ONLY;
----Create an example using CASE. 
SELECT external_rating
FROM content;

SELECT title,
       external_rating,
       CASE
           WHEN external_rating > 4.5 THEN
               'Excellent, Highly Recommended'
           WHEN external_rating < 4.5 THEN
               'Good, Casual Viewing'
           ELSE
               'Standard'
       END AS rating_description
FROM content;

--Using PL/SQL displaying the most active viewer and their view time. 
select * from users_activity

SET SERVEROUTPUT ON;

DECLARE
    v_user_id users_activity.user_id%TYPE;
    v_view_time NUMBER;
BEGIN
      FOR active_viewer IN (
        SELECT
            user_id,
            SUM(duration_minutes) as view_time
        FROM users_activity
        WHERE duration_minutes IS NOT NULL
        GROUP BY user_id
        ORDER BY view_time DESC
        FETCH FIRST 1 ROW ONLY
    ) LOOP
        v_user_id := active_viewer.user_id;
        v_view_time := active_viewer.view_time;

        DBMS_OUTPUT.put_line('Most Active Viewer (User ID): ' || v_user_id);
        DBMS_OUTPUT.put_line('Total View Time: ' || v_view_time || ' minutes');
    END LOOP;
END;

--Using PL/SQL create an example with working NO_DATA_FOUND exception handling.

select  * from content
DECLARE
    v_content_id  content.content_id%TYPE;
    v_title       content.title%TYPE;
    v_description content.description%TYPE;
BEGIN
    SELECT content_id, title, description
    INTO v_content_id, v_title, v_description
    FROM content
    WHERE content_id = &content_id; -- Enter an non existing content_id

    -- If data is found, display it
    dbms_output.put_line('Content ID: ' || v_content_id);
    dbms_output.put_line('Title: ' || v_title);
    dbms_output.put_line('Description: ' || v_description);
EXCEPTION
    -- Handle the NO_DATA_FOUND exception
    WHEN no_data_found THEN
        dbms_output.put_line('No data found for the specified content ID: ' || &content_id );
END;

*/
    DBMS_OUTPUT.put_line('Check comments for Analytical functions examples');
   END execute_Analytical_functions_statements;
END task4_Analytical_functions_statements;
