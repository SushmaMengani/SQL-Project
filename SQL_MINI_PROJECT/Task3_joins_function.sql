CREATE OR REPLACE PACKAGE task3_joins_functions_statements IS
    PROCEDURE execute_joins_functions_statements;

END task3_joins_functions_statements;

CREATE OR REPLACE PACKAGE BODY task3_joins_functions_statements AS
    PROCEDURE execute_joins_functions_statements AS
    BEGIN
/*
--Inner join
SELECT u.user_id,
       u.username,
       v.watch_date
FROM users u
INNER JOIN viewing_history v ON u.user_id = v.user_id;
--Left outer join
SELECT c.title,
       g.name
FROM content                   c
LEFT JOIN associative_content_genre acg ON c.content_id = acg.content_id
LEFT JOIN genre_info                g ON acg.genre_id = g.genre_id;

--Right outer join
SELECT b.amount,
       u.account_username
FROM billing  b
RIGHT JOIN accounts u ON b.account_id = u.account_id;

--Full outer join
SELECT u.user_id,
       a.account_username
FROM users    u
FULL OUTER JOIN accounts a ON u.account_id = a.account_id;

---Self join

SELECT u1.username AS user1_username,
       u2.username AS user2_username
FROM users u1
JOIN users u2 ON u1.country = u2.country
WHERE u1.user_id < u2.user_id;

---Cross join
SELECT u.account_username,
       c.title
FROM accounts u
CROSS JOIN content c;

---Natural join
SELECT u.account_username,
       ua.start_time
FROM accounts u
NATURAL JOIN users_activity ua;

--Subquery SELECT 
SELECT c.title,
       c.description,
       (
           SELECT round(AVG(rating),
                        2)
           FROM internal_ratings ir
           WHERE ir.content_id = c.content_id
       ) AS average_rating
FROM content c;

--FROM
SELECT c.content_id,
       avg_ratings.average_rating
FROM content c
JOIN (
    SELECT content_id,
           round(AVG(rating),
                 2) AS average_rating
    FROM internal_ratings
    GROUP BY content_id
) avg_ratings ON c.content_id = avg_ratings.content_id;

---joining with the main table
SELECT u.username AS user_name,
       bi.billing_year
FROM users u
INNER JOIN (
    SELECT DISTINCT account_id,
                    billing_year
    FROM billing
    WHERE billing_year = '2023'
) bi ON u.account_id = bi.account_id;

-- WHERE IN
SELECT username
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM internal_ratings
    WHERE rating = 5
);
SELECT USERNAME
FROM USERS
WHERE USER_ID IN (7,5,10)
--WHRERE EXISTS
SELECT USERNAME
FROM USERS u
WHERE EXISTS (
    SELECT 1
    FROM VIEWING_HISTORY v
    WHERE v.USER_ID = u.USER_ID
);
--UNION
SELECT BANK_ACC_ID, ACCOUNT_HOLDER_NAME
FROM PAYMENT_DETAILS
UNION
SELECT ACCOUNT_ID, NULL
FROM BILLING;

--UNION ALL
SELECT USERNAME FROM USERS
UNION ALL
SELECT TITLE FROM CONTENT;

--INTERSECT
SELECT USER_ID FROM INTERNAL_RATINGS
INTERSECT
SELECT USER_ID FROM USERS_ACTIVITY;
--MINUS
SELECT USER_ID FROM USERS
MINUS
SELECT USER_ID FROM USERS_ACTIVITY;

--insert any data using SELECT statement with joins and subqueries where possible. (Instead of VALUES use SELECT statement) 
INSERT INTO VIEWING_HISTORY (USER_ID, CONTENT_ID, WATCH_DATE, CONTENT_START_TIME, CONTENT_END_TIME)
SELECT
    ua.USER_ID,
    ca.CONTENT_ID,
    TO_DATE('17-AUG-23', 'DD-MON-RR') AS WATCH_DATE,
    TO_TIMESTAMP('17-AUG-23 02.30.00.000000000 PM', 'DD-MON-RR HH.MI.SS.FF AM') AS CONTENT_START_TIME,
    TO_TIMESTAMP('17-AUG-23 04.00.00.000000000 PM', 'DD-MON-RR HH.MI.SS.FF AM') AS CONTENT_END_TIME
FROM
    USERS_ACTIVITY ua
JOIN
    CONTENT ca ON ua.ACTIVITY_ID = ca.CONTENT_ID
WHERE
    ua.ACTIVITY_ID = 1
    AND ca.CONTENT_ID = 1;
 
   ---------------------------------FUNCTIONS------------------------------------------
   ---CHR
SELECT
    CHR(83) AS character_s
FROM
    dual;
--CONCAT (or concat with ||)
SELECT
    concat(first_name, last_name) AS full_name
FROM
    accounts;
--||
SELECT
    first_name
    || ' '
    || last_name AS full_name
FROM
    accounts;
---INSTR
SELECT
    title,
    instr(description, 's') AS first_s_position
FROM
    content;
--SUBSTR
SELECT
    substr(email, 1, 7) AS substr_email
FROM
    accounts;
--LENGTH
SELECT
    title,
    length(description) AS description_length
FROM
    content;
--LOWER
SELECT
    lower(username) AS lowercase_username
FROM
    users;
---UPPER
SELECT
    upper(username) AS uppercase_username
FROM
    users;
---LPAD
SELECT
    lpad(account_username, 10, '0') AS lpad_username
FROM
    accounts;
--RPAD
SELECT
    rpad(first_name, 15, '*') AS padded_first_name
FROM
    accounts;
--- Inserting a row to show the example for TRIM
INSERT INTO content (
    title,
    description,
    release_year,
    length,
    type,
    availability,
    premium_content,
    external_rating
)
    SELECT
        'Harry Potter',
        '                       A magical adventure in a world of wizards and witches.                       ',
        2001,
        152,
        'Movie',
        'Available',
        '1',
        4.7
    FROM
        dual
    WHERE
        NOT EXISTS (
            SELECT
                1
            FROM
                content
            WHERE
                title = 'Harry Potter'
        );

--LTRIM

SELECT
    ltrim(description) AS trimmed_description
FROM
    content
WHERE
    title = 'Harry Potter';

---RTRIM
SELECT
    rtrim(description) AS trimmed_description
FROM
    content
WHERE
    title = 'Harry Potter';

---TRIM
SELECT
    TRIM(BOTH ' ' FROM description) AS trimmed_description
FROM
    content
WHERE
    title = 'Harry Potter';

---TRANSLATE 
SELECT
    translate(email, 'sm', 'SM') AS modified_email
FROM
    accounts;
--REPLACE
SELECT
    replace(description, 'TV', 'Television') AS modified_description
FROM
    content;

--ABS 

SELECT
    title,
    abs(external_rating) AS abs_external_rating
FROM
    content;

--FLOOR
SELECT
    content_id,
    floor(AVG(rating)) AS rounded_avg_rating
FROM
    internal_ratings
GROUP BY
    content_id;

-- ROWNUM: Limiting the number of rows returned
SELECT
    *
FROM
    accounts
WHERE
    ROWNUM <= 5;

-- TRUNC: Truncating a date to a specific unit (e.g., month)
SELECT reg_date, TRUNC(REG_DATE, 'MON') AS TRUNCATED_DATE
FROM ACCOUNTS;


-- ADD_MONTHS: Adding months to a date
SELECT
    reg_date,
    add_months(reg_date, 3) AS new_date
FROM
    accounts;

-- EXTRACT: Extracting year from a date
SELECT
    EXTRACT(YEAR FROM reg_date) AS reg_year
FROM
    accounts;

-- LAST_DAY: Finding the last day of a month
SELECT
    last_day(reg_date) AS last_day_of_month
FROM
    accounts;

-- MONTHS_BETWEEN: Calculating months between two dates
SELECT
    round(months_between(reg_date, TO_DATE('07-OCT-2022', 'DD-MON-YYYY')))
    || ' Months ' AS months_diff
FROM
    accounts;

-- SYSDATE: Getting the current date and time
SELECT
    sysdate
FROM
    dual;

-- CURRENT_TIMESTAMP: Getting the current timestamp (with time zone)
SELECT
    current_timestamp
FROM
    dual;

SELECT
    sysdate,
    current_timestamp
FROM
    dual;

-- TO_CHAR: Formatting a date as a string
SELECT
    to_char(reg_date, 'DD-MON-YYYY') AS formatted_date
FROM
    accounts;

SELECT
    to_char(trunc(reg_date, 'MONTH'),
            'Month YYYY') AS truncated_date
FROM
    accounts;

-- TO_DATE: Converting a string to a date
SELECT
    TO_DATE('01-JAN-2023', 'DD-MON-YYYY') AS date_from_string
FROM
    dual;

-- TO_NUMBER: Converting a string to a number
SELECT
    TO_NUMBER('12345') AS number_from_string
FROM
    dual;

-- COALESCE: Returning the first non-null value
SELECT
    coalesce(content_end_time, sysdate)
FROM
    viewing_history;

-- DECODE: Conditional value selection
SELECT
    decode(premium_content, 'Y', 'Premium', 'N', 'Standard',
           'Unknown') AS content_type
FROM
    content;

-- NVL: Replacing null with a default value
SELECT
    nvl(content_end_time, content_start_time + INTERVAL '3' HOUR) AS modified_content_end_time
FROM
    viewing_history;

-- USER: Getting the current user
SELECT
    user AS current_user
FROM
    dual; 
*/
   
        dbms_output.put_line('Check comments for joins and functions examples');
    END execute_joins_functions_statements;

END task3_joins_functions_statements;