CREATE OR REPLACE PACKAGE TASK2_INSERT_PACKAGE AS

    PROCEDURE InsertGenreInfo;
    PROCEDURE InsertPaymentDetails;
    PROCEDURE InsertAccounts;
    PROCEDURE InsertUsers;
    PROCEDURE InsertUsersActivity;
    PROCEDURE InsertContent;
    PROCEDURE InsertAssociativeContentGenre;
    PROCEDURE InsertInternalRatings;
    PROCEDURE InsertViewingHistory;
    PROCEDURE InsertBilling;

END TASK2_INSERT_PACKAGE;
/

-- package body
CREATE OR REPLACE PACKAGE BODY TASK2_INSERT_PACKAGE AS
---GENRE_INFO 
    PROCEDURE insertgenreinfo IS
    BEGIN
        INSERT INTO genre_info ( name )
            SELECT
                'Action'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        genre_info
                    WHERE
                        name = 'Action'
                );

        INSERT INTO genre_info ( name )
            SELECT
                'Comedy'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        genre_info
                    WHERE
                        name = 'Comedy'
                );

        INSERT INTO genre_info ( name )
            SELECT
                'Drama'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        genre_info
                    WHERE
                        name = 'Drama'
                );

        INSERT INTO genre_info ( name )
            SELECT
                'Romantic Comedy'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        genre_info
                    WHERE
                        name = 'Romantic Comedy'
                );

        INSERT INTO genre_info ( name )
            SELECT
                'Thriller'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        genre_info
                    WHERE
                        name = 'Thriller'
                );

    END insertgenreinfo;
---payment_details
    PROCEDURE insertpaymentdetails IS
    BEGIN
        
------- payment details 
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '1234567890',
                'Sushma Mengani',
                'Swed Bank',
                'Lacplesa iela, Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                            account_number = '1234567890'
                        AND account_holder_name = 'Sushma Mengani'
                        AND bank_name = 'Swed Bank'
                        AND billing_address = 'Lacplesa iela, Riga, Latvia'
                );

-- Insert Statement 2
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '9876543210',
                'Srnidhi Chintham',
                'SEB Bank',
                'Gogola, Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '9876543210'
                );

-- Insert Statement 3
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '5678901234',
                'Manish Mengani',
                'Swed Bank',
                'Merkela iela , Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '5678901234'
                );

-- Insert Statement 4
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '4321098765',
                'Sadha Laxmi',
                'SEB Bank',
                'inzenieru iela , Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '4321098765'
                );

-- Insert Statement 5
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '1357924680',
                'Sri Vidya',
                'Swed Bank',
                'Terbatas iela , Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '1357924680'
                );

-- Insert Statement 6
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '2468135790',
                'Ashok Kumar',
                'SEB Bank',
                'Gertudes iela , Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '2468135790'
                );

-- Insert Statement 7
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '8024671359',
                'Srikar Varma',
                'Swed Bank',
                'Matisa iela , Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '8024671359'
                );

-- Insert Statement 8
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '1359024687',
                'Eshwar Mengani',
                'SEB Bank',
                'Tallinas iela , Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '1359024687'
                );

-- Insert Statement 9
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '5790246813',
                'Amulya Malladi',
                'Swed Bank',
                'Cesuiela , Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '5790246813'
                );

-- Insert Statement 10
        INSERT INTO payment_details (
            account_number,
            account_holder_name,
            bank_name,
            billing_address
        )
            SELECT
                '4680135792',
                'Manasa Reddy',
                'SEB Bank',
                'k.barona iela , Riga, Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        payment_details
                    WHERE
                        account_number = '4680135792'
                );

    END insertpaymentdetails;
---Accounts
    PROCEDURE insertaccounts IS
    BEGIN
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'sushma_mengani',
                'Sushma',
                'Mengani',
                'sushma@example.com',
                'sushma123',
                TO_DATE('2023-01-15', 'YYYY-MM-DD'),
                'A',
                'Monthly',
                1
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'sushma_mengani'
                );

-- Insert for Row 2
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'srnidhi_chintham',
                'Srnidhi',
                'Chintham',
                'srnidhi@example.com',
                'srnidhi456',
                TO_DATE('2023-02-10', 'YYYY-MM-DD'),
                'A',
                'Premium',
                2
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'srnidhi_chintham'
                );

-- Insert for Row 3
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'manish_mengani',
                'Manish',
                'Mengani',
                'manish@example.com',
                'manish789',
                TO_DATE('2023-03-05', 'YYYY-MM-DD'),
                'A',
                'Monthly',
                3
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'manish_mengani'
                );

-- Insert for Row 4
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'sadha_laxmi',
                'Sadha',
                'Laxmi',
                'sadha@example.com',
                'sadha456',
                TO_DATE('2023-04-20', 'YYYY-MM-DD'),
                'A',
                'Premium',
                4
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'sadha_laxmi'
                );

-- Insert for Row 5
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'sri_vidya',
                'Sri',
                'Vidya',
                'srividya@example.com',
                'srividya123',
                TO_DATE('2023-05-12', 'YYYY-MM-DD'),
                'A',
                'Monthly',
                5
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'sri_vidya'
                );

-- Insert for Row 6
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'ashok_kumar',
                'Ashok',
                'Kumar',
                'ashok@example.com',
                'ashok456',
                TO_DATE('2023-06-03', 'YYYY-MM-DD'),
                'A',
                'Premium',
                6
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'ashok_kumar'
                );

-- Insert for Row 7
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'srikar_varma',
                'Srikar',
                'Varma',
                'srikar@example.com',
                'srikar123',
                TO_DATE('2023-07-25', 'YYYY-MM-DD'),
                'A',
                'Monthly',
                7
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'srikar_varma'
                );

-- Insert for Row 8
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'eshwar_mengani',
                'Eshwar',
                'Mengani',
                'eshwar@example.com',
                'eshwar456',
                TO_DATE('2023-08-18', 'YYYY-MM-DD'),
                'A',
                'Premium',
                8
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'eshwar_mengani'
                );

-- Insert for Row 9
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'amulya_malladi',
                'Amulya',
                'Malladi',
                'amulya@example.com',
                'amulya123',
                TO_DATE('2023-09-10', 'YYYY-MM-DD'),
                'A',
                'Monthly',
                9
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'amulya_malladi'
                );

-- Insert for Row 10
        INSERT INTO accounts (
            account_username,
            first_name,
            last_name,
            email,
            password,
            reg_date,
            status,
            subscription_type,
            bank_acc_id
        )
            SELECT
                'manasa_reddy',
                'Manasa',
                'Reddy',
                'manasa@example.com',
                'manasa456',
                TO_DATE('2023-10-01', 'YYYY-MM-DD'),
                'A',
                'Premium',
                10
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        accounts
                    WHERE
                        account_username = 'manasa_reddy'
                );

    END insertaccounts;
---users
    PROCEDURE insertusers IS
    BEGIN
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'sushma_mengani',
                TO_DATE(2023-09-01, 'YYYY-MM-DD'),
                1,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'sushma_mengani'
                );
-- User 2
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'srnidhi_chintham',
                TO_DATE(2023-09-02, 'YYYY-MM-DD'),
                2,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'srnidhi_chintham'
                );

-- User 3
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'manish_mengani',
                TO_DATE(2023-09-03, 'YYYY-MM-DD'),
                3,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'manish_mengani'
                );

-- User 4
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'sadha_laxmi',
                TO_DATE(2023-09-04, 'YYYY-MM-DD'),
                4,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'sadha_laxmi'
                );

-- User 5
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'sri_vidya',
                TO_DATE(2023-09-05, 'YYYY-MM-DD'),
                5,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'sri_vidya'
                );

-- User 6
       INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'ashok_kumar',
               TO_DATE(2023-09-06, 'YYYY-MM-DD'),
                6,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'ashok_kumar'
                );

-- User 7
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'srikar_varma',
                TO_DATE(2023-09-07, 'YYYY-MM-DD'),
                7,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'srikar_varma'
                );

-- User 8
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'eshwar_mengani',
                TO_DATE(2023-09-08, 'YYYY-MM-DD'),
                8,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'eshwar_mengani'
                );

-- User 9
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'amulya_malladi',
                TO_DATE(2023-09-09, 'YYYY-MM-DD'),
                9,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'amulya_malladi'
                );

-- User 10
        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        )
            SELECT
                'manasa_reddy',
                TO_DATE(2023-09-10, 'YYYY-MM-DD'),
                10,
                'Latvia'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users
                    WHERE
                        username = 'manasa_reddy'
                );

    END insertusers;
---useractivity 
    PROCEDURE insertusersactivity IS
    BEGIN
        INSERT INTO users_activity (
            user_id,
            start_time,
            end_time,
            duration_minutes
        )
            SELECT
                1,
                TO_TIMESTAMP('2023-08-15 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                TO_TIMESTAMP('2023-08-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'),
                90
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users_activity
                    WHERE
                        user_id = 1
                );


-- Users Activity - Insert 2
        INSERT INTO users_activity (
            user_id,
            start_time,
            end_time,
            duration_minutes
        )
            SELECT
                2,
                TO_TIMESTAMP('2023-08-15 12:45:00', 'YYYY-MM-DD HH24:MI:SS'),
                TO_TIMESTAMP('2023-08-15 14:15:00', 'YYYY-MM-DD HH24:MI:SS'),
                90
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users_activity
                    WHERE
                        user_id = 2
                );

-- Users Activity - Insert 3
        INSERT INTO users_activity (
            user_id,
            start_time,
            end_time,
            duration_minutes
        )
            SELECT
                3,
                TO_TIMESTAMP('2023-08-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'),
                TO_TIMESTAMP('2023-08-15 17:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                90
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        users_activity
                    WHERE
                        user_id = 3
                );

        COMMIT;
    END insertusersactivity;
-----content 
    PROCEDURE InsertContent IS
    BEGIN
        INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Brooklyn 99',
    'A hilarious TV show about detectives in the 99th precinct.',
    2021,
    20,
    'Comedy',
    'Available',
    'N',
    4.5
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Brooklyn 99'
);

-- Content 2: Friends
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Friends',
    'A classic sitcom revolving around a group of friends in New York City.',
    1994,
    25,
    'Comedy',
    'Please subscribe to watch this',
    'Y',
    4.7
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Friends'
);

-- Content 3: Modern Family
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Modern Family',
    'A mockumentary-style TV show capturing the lives of an extended family.',
    2009,
    22,
    'Comedy',
    'Please subscribe to watch this',
    'N',
    4.6
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Modern Family'
);

-- Content 4: Young Sheldon
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Young Sheldon',
    'A comedy series about the childhood of Sheldon Cooper from The Big Bang Theory.',
    2017,
    30,
    'Comedy',
    'Available',
    'N',
    4.3
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Young Sheldon'
);

-- Content 5: The Big Bang Theory
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'The Big Bang Theory',
    'A sitcom centered around a group of scientists and their quirky interactions.',
    2007,
    25,
    'Comedy',
    'Available',
    'N',
    4.8
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'The Big Bang Theory'
);

-- Content 6: Finding Nemo
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Finding Nemo',
    'An animated adventure following the journey of a clownfish searching for his son.',
    2003,
    90,
    'Animation',
    'Available',
    'N',
    4.6
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Finding Nemo'
);

-- Content 7: Minions
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Minions',
    'A hilarious animated film about the adventures of the lovable Minions.',
    2015,
    80,
    'Animation',
    'Available',
    'N',
    4.5
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Minions'
);

-- Content 8: Kung Fu Panda
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Kung Fu Panda',
    'An animated comedy showcasing a panda journey to become a kung fu master.',
    2008,
    85,
    'Animation',
    'Available',
    'N',
    4.4
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Kung Fu Panda'
);

-- Content 9: Mission Impossible
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Mission Impossible',
    'An action-packed film series featuring the daring adventures of Ethan Hunt.',
    1996,
    135,
    'Action',
    'Please subscribe to watch this',
    'Y',
    4.9
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Mission Impossible'
);

-- Content 10: Oppenheimer
INSERT INTO CONTENT (
    TITLE,
    DESCRIPTION,
    RELEASE_YEAR,
    LENGTH,
    TYPE,
    AVAILABILITY,
    PREMIUM_CONTENT,
    EXTERNAL_RATING
)
SELECT
    'Oppenheimer',
    'A historical drama based on the life of J. Robert Oppenheimer, the father of the atomic bomb.',
    2023,
    120,
    'Drama',
    'Please subscribe to watch this',
    'N',
    4.7
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM CONTENT
    WHERE TITLE = 'Oppenheimer'
);

    END InsertContent;
----associative_content_genre
    PROCEDURE InsertAssociativeContentGenre IS
    BEGIN
        INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    1,
    1
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 1
      AND GENRE_ID = 1
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    2,
    2
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 2
      AND GENRE_ID = 2
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    3,
    1
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 3
      AND GENRE_ID = 1
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    4,
    2
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 4
      AND GENRE_ID = 2
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    5,
    1
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 5
      AND GENRE_ID = 1
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    6,
    2
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 6
      AND GENRE_ID = 2
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    7,
    3
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 7
      AND GENRE_ID = 3
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    8,
    3
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 8
      AND GENRE_ID = 3
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    9,
    4
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 9
      AND GENRE_ID = 4
);

INSERT INTO ASSOCIATIVE_CONTENT_GENRE (CONTENT_ID, GENRE_ID)
SELECT
    10,
    4
FROM dual
WHERE NOT EXISTS (
    SELECT 1
    FROM ASSOCIATIVE_CONTENT_GENRE
    WHERE CONTENT_ID = 10
      AND GENRE_ID = 4
);
    END InsertAssociativeContentGenre;
    ----internal_ratings
    PROCEDURE insertinternalratings IS
    BEGIN
        INSERT INTO internal_ratings (
            user_id,
            content_id,
            rating
        )
            SELECT
                1,
                1,
                4.5
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        internal_ratings
                    WHERE
                            user_id = 1
                        AND content_id = 1
                );

-- Rating 2
        INSERT INTO internal_ratings (
            user_id,
            content_id,
            rating
        )
            SELECT
                2,
                1,
                5.0
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        internal_ratings
                    WHERE
                            user_id = 2
                        AND content_id = 1
                );

-- Rating 3
        INSERT INTO internal_ratings (
            user_id,
            content_id,
            rating
        )
            SELECT
                3,
                2,
                4.0
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        internal_ratings
                    WHERE
                            user_id = 3
                        AND content_id = 2
                );
-- Rating 4
        INSERT INTO internal_ratings (
            user_id,
            content_id,
            rating
        )
            SELECT
                3,
                2,
                4.9
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        internal_ratings
                    WHERE
                            user_id = 3
                        AND content_id = 2
                            AND rating = 4.9
                );

-- Rating 5
        INSERT INTO internal_ratings (
            user_id,
            content_id,
            rating
        )
            SELECT
                3,
                2,
                4.2
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        internal_ratings
                    WHERE
                            user_id = 3
                        AND content_id = 4
                );

    END insertinternalratings;
----viewing_history 
    PROCEDURE insertviewinghistory IS
    BEGIN
        INSERT INTO viewing_history (
            user_id,
            content_id,
            watch_date,
            content_start_time,
            content_end_time
        )
            SELECT
                1,
                1,
                TO_DATE('2023-08-15', 'YYYY-MM-DD'),
                TO_TIMESTAMP('2023-08-15 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
                TO_TIMESTAMP('2023-08-15 19:30:00', 'YYYY-MM-DD HH24:MI:SS')
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        viewing_history
                    WHERE
                            user_id = 1
                        AND content_id = 1
                );

        INSERT INTO viewing_history (
            user_id,
            content_id,
            watch_date,
            content_start_time,
            content_end_time
        )
            SELECT
                2,
                2,
                TO_DATE('2023-08-16', 'YYYY-MM-DD'),
                TO_TIMESTAMP('2023-08-16 20:15:00', 'YYYY-MM-DD HH24:MI:SS'),
                TO_TIMESTAMP('2023-08-16 22:00:00', 'YYYY-MM-DD HH24:MI:SS')
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        viewing_history
                    WHERE
                            user_id = 2
                        AND content_id = 2
                );

        INSERT INTO viewing_history (
            user_id,
            content_id,
            watch_date,
            content_start_time,
            content_end_time
        )
            SELECT
                3,
                3,
                TO_DATE('2023-08-17', 'YYYY-MM-DD'),
                TO_TIMESTAMP('2023-08-17 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),
                TO_TIMESTAMP('2023-08-17 16:00:00', 'YYYY-MM-DD HH24:MI:SS')
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        viewing_history
                    WHERE
                            user_id = 3
                        AND content_id = 3
                );

        INSERT INTO viewing_history (
            user_id,
            content_id,
            watch_date,
            content_start_time,
            content_end_time
        )
            SELECT
                7,
                4,
                TO_DATE('2023-02-02', 'YYYY-MM-DD'),
                TO_TIMESTAMP('2023-02-02 15:45:00', 'YYYY-MM-DD HH24:MI:SS'),
                NULL
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        viewing_history
                    WHERE
                            user_id = 7
                        AND content_id = 4
                );

    END insertviewinghistory;
----billing
    PROCEDURE insertbilling IS
    BEGIN
       -- Inserting data for the first invoice

        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                1,
                9.99,
                'January',
                '2023',
                'Y',
                'Paid',
                TO_DATE('2023-01-05', 'YYYY-MM-DD'),
                TO_DATE('2023-08-20', 'YYYY-MM-DD'),
                'INV-00008252021-20567'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 1
                        AND billing_month = 'January'
                            AND billing_year = '2023'
                );

-- Inserting data for the second invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                2,
                99.99,
                'February',
                '2023',
                'N',
                'Pending',
                TO_DATE('2023-02-05', 'YYYY-MM-DD'),
                TO_DATE('2023-02-15', 'YYYY-MM-DD'),
                'INV-00004112019-30890'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 2
                        AND billing_month = 'February'
                            AND billing_year = '2023'
                );


-- Inserting data for the third invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                3,
                49.99,
                'March',
                '2023',
                'Y',
                'Paid',
                TO_DATE('2023-03-08', 'YYYY-MM-DD'),
                TO_DATE('2023-03-25', 'YYYY-MM-DD'),
                'INV-00003052020-40987'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 3
                        AND billing_month = 'March'
                            AND billing_year = '2023'
                );

-- Inserting data for the fourth invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                4,
                19.99,
                'April',
                '2023',
                'Y',
                'Paid',
                TO_DATE('2023-04-09', 'YYYY-MM-DD'),
                TO_DATE('2023-04-26', 'YYYY-MM-DD'),
                'INV-00001222022-50765'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 4
                        AND billing_month = 'April'
                            AND billing_year = '2023'
                );

-- Inserting data for the fifth invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                5,
                29.99,
                'May',
                '2023',
                'N',
                'Pending',
                TO_DATE('2023-05-10', 'YYYY-MM-DD'),
                TO_DATE('2023-05-27', 'YYYY-MM-DD'),
                'INV-00006032018-61234'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 5
                        AND billing_month = 'May'
                            AND billing_year = '2023'
                );

-- Inserting data for the sixth invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                6,
                39.99,
                'June',
                '2023',
                'Y',
                'Paid',
                TO_DATE('2023-06-11', 'YYYY-MM-DD'),
                TO_DATE('2023-06-28', 'YYYY-MM-DD'),
                'INV-00010152017-70987'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 6
                        AND billing_month = 'August'
                            AND billing_year = '2023'
                );

-- Inserting data for the seventh invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                7,
                49.99,
                'July',
                '2023',
                'N',
                'Pending',
                TO_DATE('2023-07-12', 'YYYY-MM-DD'),
                TO_DATE('2023-07-29', 'YYYY-MM-DD'),
                'INV-00002242023-81012'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 7
                        AND billing_month = 'August'
                            AND billing_year = '2023'
                );

-- Inserting data for the eighth invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                8,
                59.99,
                'August',
                '2023',
                'Y',
                'Paid',
                TO_DATE('2023-08-13', 'YYYY-MM-DD'),
                TO_DATE('2023-08-30', 'YYYY-MM-DD'),
                'INV-00007272016-90234'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 8
                        AND billing_month = 'August'
                            AND billing_year = '2023'
                );

-- Inserting data for the ninth invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                9,
                69.99,
                'September',
                '2023',
                'Y',
                'Paid',
                TO_DATE('2023-09-14', 'YYYY-MM-DD'),
                TO_DATE('2023-09-31', 'YYYY-MM-DD'),
                'INV-00005282019-10021'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 9
                        AND billing_month = 'September'
                            AND billing_year = '2023'
                );

-- Inserting data for the tenth invoice
        INSERT INTO billing (
            account_id,
            amount,
            billing_month,
            billing_year,
            sent_to_client,
            status,
            issue_date,
            due_date,
            invoice
        )
            SELECT
                10,
                79.99,
                'October',
                '2023',
                'N',
                'Pending',
                TO_DATE('2023-10-15', 'YYYY-MM-DD'),
                TO_DATE('2023-11-01', 'YYYY-MM-DD'),
                'INV-00003292020-11100'
            FROM
                dual
            WHERE
                NOT EXISTS (
                    SELECT
                        1
                    FROM
                        billing
                    WHERE
                            account_id = 10
                        AND billing_month = 'October'
                            AND billing_year = '2023'
                );

    END insertbilling;

END TASK2_INSERT_PACKAGE;
/
