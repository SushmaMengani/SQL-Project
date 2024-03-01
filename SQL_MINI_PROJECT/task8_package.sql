   /*  Using reports from Task 2 

Recreate all 5 reports into FUNCTIONS that return table as a result 

At least 1 function is PIPELINED 

At least 1 function is outside of package  

At least 1 function with INPUT parameter  */
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
    
/*CREATE OR REPLACE FUNCTION Get_Top_Rated_Content RETURN SYS_REFCURSOR PIPELINED IS
    v_record SYS_REFCURSOR;
BEGIN
    FOR rating_record IN (
        SELECT c.content_id, c.title, ROUND(AVG(ir.rating), 2) AS average_rating
        FROM content c
        LEFT JOIN internal_ratings ir ON c.content_id = ir.content_id
        GROUP BY c.content_id, c.title
        HAVING ROUND(AVG(ir.rating), 2) IS NOT NULL
        ORDER BY average_rating DESC
    ) LOOP
        PIPE ROW (rating_record);
    END LOOP;
    RETURN;
END Get_Top_Rated_Content;
/ error : 
*/




/*CREATE OR REPLACE TYPE TopRatedContentRecord AS OBJECT (
    content_id content.content_id%TYPE,
    title content.title%TYPE,
    average_rating NUMBER
);
/

CREATE OR REPLACE TYPE TopRatedContentTable AS TABLE OF TopRatedContentRecord;
/

CREATE OR REPLACE FUNCTION Get_Top_Rated_Content RETURN TopRatedContentTable PIPELINED IS
    v_record TopRatedContentRecord;
BEGIN
    FOR rating_record IN (
        SELECT c.content_id, c.title, ROUND(AVG(ir.rating), 2) AS average_rating
        FROM content c
        LEFT JOIN internal_ratings ir ON c.content_id = ir.content_id
        GROUP BY c.content_id, c.title
        HAVING ROUND(AVG(ir.rating), 2) IS NOT NULL
        ORDER BY average_rating DESC
    ) LOOP
        v_record := TopRatedContentRecord(rating_record.content_id, rating_record.title, rating_record.average_rating);
        PIPE ROW (v_record);
    END LOOP;
    RETURN;
END Get_Top_Rated_Content;
/
*/
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
    
    /*CREATE OR REPLACE FUNCTION Get_User_Activity_Summary(limit NUMBER) RETURN SYS_REFCURSOR IS
    v_result SYS_REFCURSOR;
BEGIN
    OPEN v_result FOR
        SELECT u.user_id, u.username, COUNT(vh.view_id) AS num_views,
               ROUND(SUM(EXTRACT(SECOND FROM(vh.content_end_time - vh.content_start_time)) / 60), 2) AS total_duration_minutes
        FROM users u
        LEFT JOIN viewing_history vh ON u.user_id = vh.user_id
        GROUP BY u.user_id, u.username
        ORDER BY num_views DESC
        FETCH FIRST limit ROWS ONLY;
    RETURN v_result;
END Get_User_Activity_Summary;
/
*/

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
  /*CREATE OR REPLACE FUNCTION Get_Billing_Summary RETURN SYS_REFCURSOR IS
    v_result SYS_REFCURSOR;
BEGIN
    OPEN v_result FOR
        SELECT b.invoice_id, a.account_username, b.amount, b.billing_month, b.billing_year, b.status
        FROM billing b
        JOIN accounts a ON b.account_id = a.account_id
        ORDER BY b.status DESC;
    RETURN v_result;
END Get_Billing_Summary;
/
*/  
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
    /*CREATE OR REPLACE FUNCTION Get_Genre_Wise_Content RETURN SYS_REFCURSOR IS
    v_result SYS_REFCURSOR;
BEGIN
    OPEN v_result FOR
        SELECT gi.name AS genre_name, COUNT(acg.association_id) AS num_content
        FROM genre_info gi
        LEFT JOIN associative_content_genre acg ON gi.genre_id = acg.genre_id
        GROUP BY gi.name
        ORDER BY num_content DESC;
    RETURN v_result;
END Get_Genre_Wise_Content;
/
*/
--- User Rating Distribution: provides insights into how users 
have rated content on the platform, helping both users and  platform owners understand content.
SELECT ir.rating,
       COUNT(ir.rating) AS num_users
FROM internal_ratings ir
GROUP BY ir.rating
ORDER BY ir.rating DESC;

/*CREATE OR REPLACE PACKAGE task8_package AS
    TYPE RatingRecord IS RECORD (
        rating internal_ratings.rating%TYPE,
        num_users NUMBER
    );

    TYPE RatingTable IS TABLE OF RatingRecord;

    FUNCTION Get_User_Rating_Distribution RETURN RatingTable;
END task8_package;
/

CREATE OR REPLACE PACKAGE BODY task8_package AS
    FUNCTION Get_User_Rating_Distribution RETURN RatingTable IS
        v_results RatingTable;
    BEGIN
        SELECT ir.rating, COUNT(ir.rating) AS num_users
        BULK COLLECT INTO v_results
        FROM internal_ratings ir
        GROUP BY ir.rating
        ORDER BY ir.rating DESC;
        RETURN v_results;
    END Get_User_Rating_Distribution;
END task8_package;
/
*/
    