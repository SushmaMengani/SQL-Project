CREATE OR REPLACE PACKAGE task6_package AS
     PROCEDURE generate_invoices_email (
        p_account_id    IN users.user_id%TYPE,
        p_invoice_id    IN billing.invoice_id%TYPE
    );
END task6_package;


CREATE OR REPLACE PACKAGE BODY task6_package AS
 PROCEDURE generate_invoices_email (
    p_account_id     IN users.user_id%TYPE,
    p_invoice_id  IN billing.invoice_id%TYPE
) AS
    v_email_content CLOB;
    v_first_name    accounts.first_name%TYPE;
    v_last_name     accounts.last_name%TYPE;
    v_invoice       billing.invoice%TYPE;
BEGIN
    -- Step 2: Retrieve user-specific data
    SELECT first_name, last_name, invoice
    INTO v_first_name, v_last_name, v_invoice
    FROM accounts a
    JOIN billing b ON a.account_id = b.account_id
    WHERE a.account_id = p_account_id AND b.invoice_id = p_invoice_id;

    -- Step 3: Replace placeholders in the template with actual values
    v_email_content := '<html>
        <body>
            <p>Dear ' || v_first_name || ' ' || v_last_name || ',</p>
            <p>Your invoice number is: ' || v_invoice || '</p>
        </body>
    </html>';

    -- Step 4: Update the email_text column in invoices table
    UPDATE billing
    SET invoice = v_email_content
    WHERE invoice_id = p_invoice_id;

    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20002, 'No data found for user or invoice.');
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
        ROLLBACK;
END generate_invoices_email;



-- create the table plan_history
/*
CREATE TABLE plan_history (
    account_id NUMBER NOT NULL,
    old_plan VARCHAR2(50) NOT NULL,
    new_plan VARCHAR2(50) NOT NULL,
    change_date DATE NOT NULL,
    CONSTRAINT fk_acc_id FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);
CREATE OR REPLACE TRIGGER insert_plan_history_trigger
AFTER UPDATE OF subscription_type ON accounts
FOR EACH ROW
WHEN (NEW.subscription_type <> OLD.subscription_type)
DECLARE
    v_history_id NUMBER;
BEGIN
    -- Insert a record into plan_history
    INSERT INTO plan_history (account_id, old_plan, new_plan, change_date)
    VALUES (:NEW.account_id, :OLD.subscription_type, :NEW.subscription_type, SYSDATE);

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
        ROLLBACK;
END insert_plan_history_trigger;
*/

END task6_package;
/
