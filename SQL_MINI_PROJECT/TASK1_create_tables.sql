
CREATE OR REPLACE PACKAGE TASK1_CREATE_TABLES_PACKAGE AS
   PROCEDURE CREATE_GENRE_INFO;
   PROCEDURE CREATE_PAYMENT_DETAILS;
   PROCEDURE CREATE_ACCOUNTS;
   PROCEDURE CREATE_USERS;
   PROCEDURE CREATE_USERS_ACTIVITY;
   PROCEDURE CREATE_CONTENT;
   PROCEDURE CREATE_ASSOCIATIVE_CONTENT_GENRE;
   PROCEDURE CREATE_INTERNAL_RATINGS;
   PROCEDURE CREATE_VIEWING_HISTORY;
   PROCEDURE CREATE_BILLING;
END TASK1_CREATE_TABLES_PACKAGE;
/

CREATE OR REPLACE PACKAGE BODY TASK1_CREATE_TABLES_PACKAGE AS
  ----------------------------------------------------------- Genre_info ---------------------------------------------------------
   PROCEDURE CREATE_GENRE_INFO AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'genre_info'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table GENRE_INFO already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE GENRE_INFO (
            GENRE_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            NAME VARCHAR(50) NOT NULL,
            CONSTRAINT UQ_GENRE_NAME UNIQUE (NAME)
         )';

         -- Table: GENRE_INFO comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE genre_info IS ''Table to store information about different genres for the movies''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN genre_info.genre_id IS ''Primary key for the genre table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN genre_info.name IS ''Name of the genre''';

         DBMS_OUTPUT.PUT_LINE('Table GENRE_INFO created');
   END CREATE_GENRE_INFO;
   
  --------------------------------------------------- Payment Details---------------------------------------------------------
   PROCEDURE CREATE_PAYMENT_DETAILS AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'payment_details'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table PAYMENT_DETAILS already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE PAYMENT_DETAILS (
            BANK_ACC_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            ACCOUNT_NUMBER VARCHAR2(50 BYTE) NOT NULL,
            ACCOUNT_HOLDER_NAME VARCHAR2(100 BYTE) NOT NULL,
            BANK_NAME VARCHAR2(50 BYTE) NOT NULL,
            BILLING_ADDRESS VARCHAR2(150 BYTE) NOT NULL,
            CONSTRAINT UC_ACCOUNT_NUMBER UNIQUE (ACCOUNT_NUMBER)
         )';

         -- Table: PAYMENT_DETAILS comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE payment_details IS ''Table to store payment details''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN payment_details.bank_acc_id IS ''Primary key for the payment details table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN payment_details.account_number IS ''Account number for payment''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN payment_details.account_holder_name IS ''Account holder name''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN payment_details.bank_name IS ''Bank name''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN payment_details.billing_address IS ''Billing Address of the user''';

         DBMS_OUTPUT.PUT_LINE('Table PAYMENT_DETAILS created');
   END CREATE_PAYMENT_DETAILS;
----------------------------------------------------------- Accounts -----------------------------------------------------------
   PROCEDURE CREATE_ACCOUNTS AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'accounts'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table ACCOUNTS already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE ACCOUNTS (
            ACCOUNT_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            ACCOUNT_USERNAME VARCHAR2(50 BYTE) NOT NULL,
            FIRST_NAME VARCHAR2(50 BYTE) NOT NULL,
            LAST_NAME VARCHAR2(50 BYTE) NOT NULL,
            EMAIL VARCHAR2(100 BYTE) NOT NULL,
            PASSWORD VARCHAR2(100 BYTE) NOT NULL,
            REG_DATE DATE NOT NULL,
            STATUS VARCHAR2(1 BYTE) NOT NULL,
            SUBSCRIPTION_TYPE VARCHAR2(50 BYTE) NOT NULL,
            BANK_ACC_ID NUMBER NOT NULL,
            CONSTRAINT UC_EMAIL UNIQUE (EMAIL),
            CONSTRAINT FK_BANK_ACC_ID FOREIGN KEY (BANK_ACC_ID)
               REFERENCES PAYMENT_DETAILS (BANK_ACC_ID)
         )';

         -- Table: ACCOUNTS comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE accounts IS ''Table to store information about accounts of the subscribers''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.account_id IS ''Primary key for the account table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.account_username IS ''Username of the account''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.first_name IS ''First name of the account holder''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.last_name IS ''Last name of the account holder''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.email IS ''Email address of the account holder''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.password IS ''Password for the account''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.reg_date IS ''Registration date of the account''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.status IS ''Status of the account''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.subscription_type IS ''Subscription type of the account''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN accounts.bank_acc_id IS ''bank account ID from Accounts table''';

         DBMS_OUTPUT.PUT_LINE('Table ACCOUNTS created');
   END CREATE_ACCOUNTS;
----------------------------------------------------------- Users -----------------------------------------------------------
   PROCEDURE CREATE_USERS AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'users'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table USERS already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE USERS (
            USER_ID NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            USERNAME VARCHAR2(50 BYTE) NOT NULL,
            REG_DATE DATE NOT NULL,
            ACCOUNT_ID NUMBER NOT NULL,
            COUNTRY VARCHAR2(50 BYTE) NOT NULL,
            CONSTRAINT UC_USERNAME UNIQUE (USERNAME),
            CONSTRAINT FK_ACCOUNT_ID_USERS FOREIGN KEY (ACCOUNT_ID)
               REFERENCES ACCOUNTS (ACCOUNT_ID)
         )';

         -- Table: USERS comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE users IS ''Table to store information about users''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users.user_id IS ''Primary key for the user table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users.username IS ''Username of the user''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users.reg_date IS ''Registration date of the user''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users.account_id IS ''Account ID of the user''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users.country IS ''Country of the user''';

         DBMS_OUTPUT.PUT_LINE('Table USERS created');
   END CREATE_USERS;

----------------------------------------------------------- Users Activity -----------------------------------------------------------
   PROCEDURE CREATE_USERS_ACTIVITY AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'users_activity'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table USERS_ACTIVITY already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE USERS_ACTIVITY (
            ACTIVITY_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            USER_ID INT NOT NULL,
            START_TIME TIMESTAMP (6) NOT NULL,
            END_TIME TIMESTAMP (6),
            DURATION_MINUTES INT,
            CONSTRAINT FK_USER_ID_USERS_ACTIVITY FOREIGN KEY (USER_ID)
               REFERENCES USERS (USER_ID)
         )';

         -- Table: USERS_ACTIVITY comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE users_activity IS ''Table to store user activity information''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users_activity.activity_id IS ''Primary key for the user activity table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users_activity.user_id IS ''User ID of the user activity table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users_activity.start_time IS ''Start time of the movie''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users_activity.end_time IS ''End time of the movie''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN users_activity.duration_minutes IS ''Duration of the watch history in minutes''';

         DBMS_OUTPUT.PUT_LINE('Table USERS_ACTIVITY created');
   END CREATE_USERS_ACTIVITY;
----------------------------------------------------------- Content -----------------------------------------------------------
   PROCEDURE CREATE_CONTENT AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'content'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table CONTENT already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE CONTENT (
            CONTENT_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            TITLE VARCHAR2(100 BYTE) NOT NULL,
            DESCRIPTION VARCHAR2(200 BYTE),
            RELEASE_YEAR INT NOT NULL,
            LENGTH INT NOT NULL,
            TYPE VARCHAR2(50 BYTE) NOT NULL,
            AVAILABILITY VARCHAR2(50 BYTE),
            PREMIUM_CONTENT VARCHAR2(1 BYTE) NOT NULL,
            EXTERNAL_RATING NUMBER,
            CONSTRAINT UQ_TITLE UNIQUE (TITLE)
         )';

         -- Table: CONTENT comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE content IS ''Table to store information about content''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.content_id IS ''Primary key for the content table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.title IS ''Title of the content''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.description IS ''Description of the content''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.release_year IS ''Release year of the content''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.length IS ''Length of the content in minutes''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.type IS ''Type of the content''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.availability IS ''Availability of the content whether it is available for free users or not''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.premium_content IS ''Indicates if the content is premium (1) or not (0)''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN content.external_rating IS ''External rating for the content''';

         DBMS_OUTPUT.PUT_LINE('Table CONTENT created');
   END CREATE_CONTENT;
-----------------------------------------------------------  Associative Content Genre -----------------------------------------------------------
   PROCEDURE CREATE_ASSOCIATIVE_CONTENT_GENRE AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'associative_content_genre'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table ASSOCIATIVE_CONTENT_GENRE already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE ASSOCIATIVE_CONTENT_GENRE (
            ASSOCIATION_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            CONTENT_ID INT NOT NULL,
            GENRE_ID INT NOT NULL,
            CONSTRAINT FK_CONTENT_ID_ASSOCIATIVE FOREIGN KEY (CONTENT_ID)
               REFERENCES CONTENT (CONTENT_ID),
            CONSTRAINT FK_GENRE_ID_ASSOCIATIVE FOREIGN KEY (GENRE_ID)
               REFERENCES GENRE_INFO (GENRE_ID)
         )';

         -- Table: ASSOCIATIVE_CONTENT_GENRE comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE associative_content_genre IS ''Table to establish a many-to-many relationship between content and genres''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN associative_content_genre.content_id IS ''Foreign key referencing the content associated with a genre''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN associative_content_genre.genre_id IS ''Foreign key referencing the genre associated with a content''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN associative_content_genre.association_id IS ''Primary key for the associative content genre table''';

         DBMS_OUTPUT.PUT_LINE('Table ASSOCIATIVE_CONTENT_GENRE created');
   END CREATE_ASSOCIATIVE_CONTENT_GENRE;
----------------------------------------------------------- Internal Ratings -----------------------------------------------------------
   PROCEDURE CREATE_INTERNAL_RATINGS AS 
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'internal_ratings'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table INTERNAL_RATINGS already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE INTERNAL_RATINGS (
            RATING_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            USER_ID INT NOT NULL,
            CONTENT_ID INT NOT NULL,
            RATING NUMBER NOT NULL,
            CONSTRAINT FK_USER_ID_RATINGS FOREIGN KEY (USER_ID)
               REFERENCES USERS (USER_ID),
            CONSTRAINT FK_CONTENT_ID FOREIGN KEY (CONTENT_ID)
               REFERENCES CONTENT (CONTENT_ID)
         )';

         -- Table: INTERNAL_RATINGS comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE internal_ratings IS ''Table to store internal ratings for content''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN internal_ratings.rating_id IS ''Primary key for the internal ratings table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN internal_ratings.user_id IS ''User ID for the rating''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN internal_ratings.content_id IS ''Content ID for the rating''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN internal_ratings.rating IS ''Rating of the content, from 1 to 5''';

         DBMS_OUTPUT.PUT_LINE('Table INTERNAL_RATINGS created');
   END CREATE_INTERNAL_RATINGS;
-----------------------------------------------------------  Viewing History -----------------------------------------------------------
   PROCEDURE CREATE_VIEWING_HISTORY AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'viewing_history'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table VIEWING_HISTORY already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE VIEWING_HISTORY (
            VIEW_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            USER_ID INT NOT NULL,
            CONTENT_ID INT NOT NULL,
            WATCH_DATE DATE NOT NULL,
            CONTENT_START_TIME TIMESTAMP (6) NOT NULL,
            CONTENT_END_TIME TIMESTAMP (6),
            CONSTRAINT FK_USER_ID_VIEW FOREIGN KEY (USER_ID)
               REFERENCES USERS (USER_ID),
            CONSTRAINT FK_CONTENT_ID_VIEW FOREIGN KEY (CONTENT_ID)
               REFERENCES CONTENT (CONTENT_ID)
         )';

         -- Table: VIEWING_HISTORY comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE viewing_history IS ''Table to store viewing history''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN viewing_history.view_id IS ''Primary key for the viewing history table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN viewing_history.user_id IS ''User ID for the viewing history''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN viewing_history.content_id IS ''Content ID for the viewing history''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN viewing_history.watch_date IS ''Date of the viewing''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN viewing_history.content_start_time IS ''Start time of the content''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN viewing_history.content_end_time IS ''End time of the content''';

         DBMS_OUTPUT.PUT_LINE('Table VIEWING_HISTORY created');
   END CREATE_VIEWING_HISTORY;
----------------------------------------------------------- Billing -----------------------------------------------------------
   PROCEDURE CREATE_BILLING AS
      v_dummy NUMBER;
   BEGIN
      SELECT 1 INTO v_dummy
      FROM all_tables
      WHERE lower(table_name) = 'billing'
      AND owner = 'ADMIN';

      DBMS_OUTPUT.PUT_LINE('Table BILLING already exists');
   EXCEPTION
      WHEN NO_DATA_FOUND THEN
         EXECUTE IMMEDIATE '
         CREATE TABLE BILLING (
            INVOICE_ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
            ACCOUNT_ID INT NOT NULL,
            AMOUNT NUMBER(12, 2) NOT NULL,
            BILLING_MONTH VARCHAR2(50 BYTE) NOT NULL,
            BILLING_YEAR VARCHAR2(50 BYTE) NOT NULL,
            SENT_TO_CLIENT VARCHAR2(1 BYTE) NOT NULL,
            STATUS VARCHAR2(20 BYTE) NOT NULL,
            ISSUE_DATE DATE NOT NULL,
            DUE_DATE DATE NOT NULL,
            INVOICE BLOB,
            CONSTRAINT FK_ACCOUNT_ID FOREIGN KEY (ACCOUNT_ID)
               REFERENCES ACCOUNTS (ACCOUNT_ID)
         )';

         -- Table: BILLING comments
         EXECUTE IMMEDIATE 'COMMENT ON TABLE billing IS ''Table to store billing information''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.invoice_id IS ''Primary key for the billing table''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.account_id IS ''Account ID for the billing''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.amount IS ''Amount in the invoice''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.billing_month IS ''Billing month''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.billing_year IS ''Billing year''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.sent_to_client IS ''Indicates if the invoice is sent to the client (Y/N)''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.status IS ''Status of the invoice''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.issue_date IS ''Issue date of the invoice''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.due_date IS ''Due date of the invoice''';
         EXECUTE IMMEDIATE 'COMMENT ON COLUMN billing.invoice IS ''Invoice of the order''';

         DBMS_OUTPUT.PUT_LINE('Table BILLING created');
   END CREATE_BILLING;

END TASK1_CREATE_TABLES_PACKAGE;
/



BEGIN
   CREATE_TABLES_PACKAGE.CREATE_GENRE_INFO;
   CREATE_TABLES_PACKAGE.CREATE_PAYMENT_DETAILS;
   CREATE_TABLES_PACKAGE.CREATE_ACCOUNTS;
   CREATE_TABLES_PACKAGE.CREATE_USERS;
   CREATE_TABLES_PACKAGE.CREATE_USERS_ACTIVITY;
   CREATE_TABLES_PACKAGE.CREATE_CONTENT;
   CREATE_TABLES_PACKAGE.CREATE_ASSOCIATIVE_CONTENT_GENRE;
   CREATE_TABLES_PACKAGE.CREATE_INTERNAL_RATINGS;
   CREATE_TABLES_PACKAGE.CREATE_VIEWING_HISTORY;
   CREATE_TABLES_PACKAGE.CREATE_BILLING;
END;
/

