CREATE OR REPLACE PACKAGE task2_select_statements IS
    PROCEDURE execute_select_statements;
END task2_select_statements;

CREATE OR REPLACE PACKAGE BODY task2_select_statements AS
   PROCEDURE execute_select_statements AS
   BEGIN
 /*  
-- Retrieve all columns from user_tables, sorted by table_name in ascending order.
SELECT *
FROM user_tables
ORDER BY table_name ASC;

-- Select all columns from the users table. Order the result set by username in descending order.
SELECT *
FROM users
ORDER BY username DESC;

-- Select all columns from the VIEWING_HISTORY table. Order the result set by content_end_time in ascending order.
SELECT *
FROM viewing_history
ORDER BY content_end_time ASC NULLS LAST;

-- Select specific columns from the content table with aliases for readability.

SELECT content_id,
       title       AS "movie/Series name",
       description AS "movie/series description"
FROM content;

-- Another way to use aliases for columns.
SELECT content_id,
       title       "movie/Series name",
       description "movie/series description"
FROM content;

-- Retrieve distinct genre_id values from associative_content_genre table.

SELECT DISTINCT genre_id
FROM associative_content_genre;

-- Retrieve distinct last_name values from accounts table.

SELECT DISTINCT last_name
FROM accounts;

-- Retrieve the average rating for each Rating_id from Internal_ratings table, grouped by Rating_id.
-- Order the result set by Rating_id in ascending order.

SELECT rating_id,
       AVG(rating)
FROM internal_ratings
GROUP BY rating_id
ORDER BY rating_id ASC;

-- Retrieve the average rating for each Rating_id and content_id from Internal_ratings table,
-- grouped by Rating_id and content_id. Order the result set by content_id in ascending order.

SELECT rating_id,
       content_id,
       AVG(rating)
FROM internal_ratings
GROUP BY rating_id,
         content_id
ORDER BY content_id ASC;

-- Retrieve all rows from content table where title starts with 'F' and release_year is 2023.

SELECT *
FROM content
WHERE title LIKE 'F%'
      AND release_year = 2023;

-- Retrieve all rows from viewing_history table where content_id is either 1 or 2.

SELECT * FROM viewing_history WHERE content_id IN (1, 2)
 ---AND user_id = 1
  ----AND watch_Date = TO_DATE('15-AUG-23', 'DD-MON-YY');;

-- Retrieve all rows from viewing_history table where content_id is not 1 or 2.

SELECT * FROM viewing_history WHERE content_id NOT IN (1, 2)
  ---AND user_id = 1
  ----AND watch_Date = TO_DATE('15-AUG-23', 'DD-MON-YY');;

-- Retrieve accounts that do not have associated users.

SELECT
    *
FROM
    accounts a
WHERE
    NOT EXISTS (
        SELECT
            1
        FROM
            users u
        WHERE
            u.account_id = a.account_id
    );
  
-- Retrieve rows from content table based on multiple conditions using AND and LIKE.

SELECT
    *
FROM
    content
WHERE
        1 = 1
    AND content_id BETWEEN 1 AND 6
        AND title LIKE 'F%';

-- Retrieve rows from accounts table using BETWEEN for date range and other conditions.

SELECT
    *
FROM
    accounts
WHERE
    reg_date NOT BETWEEN TO_DATE('1.JAN.23', 'DD.MON.YY') AND sysdate
    AND last_name = 'Mengani';

-- Retrieve rows from viewing_history table where content_end_time is not NULL.

SELECT
    *
FROM
    viewing_history
WHERE
        1 = 1
    AND content_end_time IS NOT NULL;

-- Calculate the average duration minutes for each activity and user.

SELECT
    activity_id,
    user_id,
    AVG(duration_minutes)
FROM
    users_activity
GROUP BY
    activity_id,
    user_id
ORDER BY
    duration_minutes ASC;

-- Calculate the minimum rating for each user in internal_ratings.

SELECT
    user_id,
    MIN(rating)
FROM
    internal_ratings
GROUP BY
    user_id;

-- Calculate the maximum rating for each user in internal_ratings.

SELECT
    user_id,
    MAX(rating)
FROM
    internal_ratings
GROUP BY
    user_id;

-- Calculate the average rating rounded to one decimal place for each user in internal_ratings,
-- only considering users with an average rating greater than 4.

SELECT
    user_id,
    round(AVG(rating),
          1)
FROM
    internal_ratings
GROUP BY
    user_id
HAVING
    AVG(rating) > 4;

-- Calculate the count of ratings for each rating and content combined in internal_ratings.

SELECT
    rating,
    content_id,
    COUNT(*)
FROM
    internal_ratings
GROUP BY
    rating,
    content_id;

-- Calculate the total rating count for each user in internal_ratings.

SELECT
    user_id,
    SUM(rating) AS total_rating
FROM
    internal_ratings
GROUP BY
    user_id;

-- Calculate the total duration minutes for each user's activities.

SELECT
    user_id,
    SUM(duration_minutes) AS total_duration
FROM
    users_activity
GROUP BY
    user_id;
    
---Top-Rated Content : lists the top-rated content on the platform based on user ratings.

SELECT
    *
FROM
    (
        SELECT
            c.content_id,
            c.title,
            round(AVG(ir.rating),
                  2) AS average_rating
        FROM
            content          c
            LEFT JOIN internal_ratings ir ON c.content_id = ir.content_id
        GROUP BY
            c.content_id,
            c.title
        HAVING
            round(AVG(ir.rating),
                  2) IS NOT NULL
        ORDER BY
            average_rating DESC
    )
WHERE
    ROWNUM <= 2
ORDER BY
    average_rating ASC;
    

----User Activity Summary : provides an overview of user activity 
on the media streaming platform, including the total duration of user activity and the number of content views.

SELECT
    u.user_id,
    u.username,
    COUNT(vh.view_id) AS num_views,
    round(SUM(EXTRACT(SECOND FROM(vh.content_end_time - vh.content_start_time)) / 60),
          2)          AS total_duration_minutes
FROM
    users           u
    LEFT JOIN viewing_history vh ON u.user_id = vh.user_id
GROUP BY
    u.user_id,
    u.username
ORDER BY
    num_views DESC;

---Billing Summary: provides information on billing and invoices for platform owners 
to manage user subscriptions and payments.

SELECT
    b.invoice_id,
    a.account_username,
    b.amount,
    b.billing_month,
    b.billing_year,
    b.status
FROM
         billing b
    JOIN accounts a ON b.account_id = a.account_id
ORDER BY
    status DESC;
    
---Genre-wise Content : shows the distribution of content by genre, 
helping users discover content based on their interests.

SELECT
    gi.name                   AS genre_name,
    COUNT(acg.association_id) AS num_content
FROM
    genre_info                gi
    LEFT JOIN associative_content_genre acg ON gi.genre_id = acg.genre_id
GROUP BY
    gi.name
ORDER BY
    num_content DESC;
    
--- User Rating Distribution: provides insights into how users 
have rated content on the platform, helping both users and  platform owners understand content.
SELECT ir.rating,
       COUNT(ir.rating) AS num_users
FROM internal_ratings ir
GROUP BY ir.rating
ORDER BY ir.rating DESC;
    
    */
       DBMS_OUTPUT.put_line('Check comments for Select examples');
   END execute_select_statements;
END task2_select_statements;

