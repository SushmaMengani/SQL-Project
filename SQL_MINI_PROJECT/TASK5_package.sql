CREATE OR REPLACE PACKAGE task5_package AS
 PROCEDURE add_new_user (
        p_username   IN users.username%TYPE,
        p_reg_date   IN users.reg_date%TYPE,
        p_account_id IN users.account_id%TYPE,
        p_country    IN users.country%TYPE
    );

    -- Function to check if user is active
    FUNCTION is_account_active (
        p_account_id IN accounts.account_id%TYPE
    ) RETURN BOOLEAN;

    -- Procedure to add new content
    PROCEDURE add_content (
        p_title           IN content.title%TYPE,
        p_description     IN content.description%TYPE,
        p_release_year    IN content.release_year%TYPE,
        p_length          IN content.length%TYPE,
        p_type            IN content.type%TYPE,
        p_availability    IN content.availability%TYPE,
        p_premium_content IN content.premium_content%TYPE,
        p_external_rating IN content.external_rating%TYPE
    );

    -- Function to validate user name and last name
    FUNCTION validate_user_name (
        p_account_id IN accounts.account_id%TYPE
    ) RETURN BOOLEAN;

    -- Procedure to change user's account status
    PROCEDURE change_user_account_status (
        p_account_id IN accounts.account_id%TYPE,
        p_status     IN accounts.status%TYPE
    );
    -- Procedure to delete content
    PROCEDURE delete_content (
        p_content_id IN content.content_id%TYPE
    );

END task5_package;
/

CREATE OR REPLACE PACKAGE BODY task5_package AS
 -- Procedure to add new users
    PROCEDURE add_new_user (
        p_username   IN users.username%TYPE,
        p_reg_date   IN users.reg_date%TYPE,
        p_account_id IN users.account_id%TYPE,
        p_country    IN users.country%TYPE
    ) AS
    BEGIN
        -- Parameter validations
        IF p_username IS NULL OR p_reg_date IS NULL OR p_account_id IS NULL OR p_country IS NULL THEN
            raise_application_error(-20003, 'Invalid input parameters. All parameters must have values.');
        END IF;

        INSERT INTO users (
            username,
            reg_date,
            account_id,
            country
        ) VALUES (
            p_username,
            p_reg_date,
            p_account_id,
            p_country
        );

        COMMIT;
        dbms_output.put_line('New user added successfully.');
    EXCEPTION
        WHEN dup_val_on_index THEN
            dbms_output.put_line('Error: Username already exists.');
        WHEN OTHERS THEN
            dbms_output.put_line('Error: ' || sqlerrm);
            ROLLBACK;
    END add_new_user;

    -- Function to check if user is active
    FUNCTION is_account_active (
        p_account_id IN accounts.account_id%TYPE
    ) RETURN BOOLEAN AS
        v_status accounts.status%TYPE;
    BEGIN
        -- Exception handling for invalid account_id
        IF p_account_id IS NULL THEN
            raise_application_error(-20003, 'Invalid account ID: NULL');
        END IF;
        SELECT status
        INTO v_status
        FROM accounts
        WHERE account_id = p_account_id;

        IF v_status = 'A' THEN
            RETURN TRUE;
        ELSIF v_status = 'NA' THEN
            RETURN FALSE;
        ELSE
            raise_application_error(-20001, 'Incorrect ''status'' value: ' || v_status);
        END IF;

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20002, 'No data found for account ID: ' || p_account_id);
        WHEN OTHERS THEN
            dbms_output.put_line('Error: ' || sqlerrm);
            RETURN NULL;
    END is_account_active;

    -- Procedure to add new content
    PROCEDURE add_content (
        p_title           IN content.title%TYPE,
        p_description     IN content.description%TYPE,
        p_release_year    IN content.release_year%TYPE,
        p_length          IN content.length%TYPE,
        p_type            IN content.type%TYPE,
        p_availability    IN content.availability%TYPE,
        p_premium_content IN content.premium_content%TYPE,
        p_external_rating IN content.external_rating%TYPE
    ) AS
    BEGIN
        -- Parameter validations
        IF p_title IS NULL OR p_description IS NULL OR p_release_year IS NULL OR p_length IS NULL OR p_type IS NULL OR p_availability
        IS NULL OR p_premium_content IS NULL OR p_external_rating IS NULL THEN
            raise_application_error(-20003, 'Invalid input parameters. All parameters must have values.');
        END IF;

        INSERT INTO content (
            title,
            description,
            release_year,
            length,
            type,
            availability,
            premium_content,
            external_rating
        ) VALUES (
            p_title,
            p_description,
            p_release_year,
            p_length,
            p_type,
            p_availability,
            p_premium_content,
            p_external_rating
        );

        COMMIT;
        dbms_output.put_line('New Content is added');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Error: ' || sqlerrm);
            ROLLBACK;
    END add_content;

    -- Function to validate user name and last name
    FUNCTION validate_user_name (
        p_account_id IN accounts.account_id%TYPE
    ) RETURN BOOLEAN AS

        v_first_name    accounts.first_name%TYPE;
        v_last_name     accounts.last_name%TYPE;
        v_invalid_chars VARCHAR2(10) := '710'; -- Define the invalid characters
    BEGIN
        -- Exception handling for invalid account_id
        IF p_account_id IS NULL THEN
            raise_application_error(-20003, 'Invalid account ID: NULL');
        END IF;
        SELECT first_name,
               last_name
        INTO
            v_first_name,
            v_last_name
        FROM accounts
        WHERE account_id = p_account_id;

        FOR i IN 1..length(v_first_name) LOOP
            IF instr(v_invalid_chars, substr(v_first_name, i, 1)) > 0 THEN
                dbms_output.put_line('Invalid character found in first name: '
                                     || substr(v_first_name, i, 1));
                RETURN FALSE; -- First name contains an invalid character
            END IF;
        END LOOP;

        FOR i IN 1..length(v_last_name) LOOP
            IF instr(v_invalid_chars, substr(v_last_name, i, 1)) > 0 THEN
                dbms_output.put_line('Invalid character found in last name: '
                                     || substr(v_last_name, i, 1));
                RETURN FALSE; -- Last name contains an invalid character
            END IF;
        END LOOP;

        dbms_output.put_line('No invalid characters found in first name and last name.');
        RETURN TRUE; -- No invalid characters found in first name or last name

    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20002, 'No data found for account id: ' || p_account_id);
        WHEN OTHERS THEN
            dbms_output.put_line('Error: ' || sqlerrm);
            RETURN NULL;
    END validate_user_name;

    -- Procedure to change user's account status
    PROCEDURE change_user_account_status (
        p_account_id IN accounts.account_id%TYPE,
        p_status     IN accounts.status%TYPE
    ) AS
    BEGIN
        -- Parameter validations
        IF p_account_id IS NULL OR p_status IS NULL THEN
            raise_application_error(-20003, 'Invalid input parameters. Both account_id and status must have values.');
        END IF;

        UPDATE accounts
        SET
            status = p_status
        WHERE account_id = p_account_id;

        COMMIT;
        dbms_output.put_line('Account '
                             || p_account_id
                             || ' status updated to: '
                             || p_status);
    EXCEPTION
        WHEN no_data_found THEN
            raise_application_error(-20002, 'No data found for account id: ' || p_account_id);
        WHEN OTHERS THEN
            dbms_output.put_line('Error: ' || sqlerrm);
            ROLLBACK;
    END change_user_account_status;


/* CREATE OR REPLACE VIEW user_account_view AS
SELECT
    u.user_id,
    u.username,
    a.account_id,
    a.account_username,
    a.reg_date,
    u.country,
    a.status AS account_status
FROM
    users u
JOIN
    accounts a ON u.account_id = a.account_id;


*/

    -- Procedure to delete content
    PROCEDURE delete_content (
        p_content_id IN content.content_id%TYPE
    ) AS
    BEGIN
        -- Parameter validations
        IF p_content_id IS NULL THEN
            raise_application_error(-20003, 'Invalid input parameter. Content ID must have a value.');
        END IF;

        DELETE FROM content
        WHERE content_id = p_content_id;

        COMMIT;
        dbms_output.put_line('Content deleted successfully.');
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            raise_application_error(-20002, 'No data found for content ID: ' || p_content_id);
        WHEN OTHERS THEN
            dbms_output.put_line('Error: ' || sqlerrm);
            ROLLBACK;
    END delete_content;

END task5_package;
/
