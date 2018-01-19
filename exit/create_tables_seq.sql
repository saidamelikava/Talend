--------------------------------------------------
CREATE TABLE cls_products
  (
    Prod_id        NUMBER (8,0) NOT NULL,
    Prod_name      VARCHAR2(250) NOT NULL,
    Prod_comp_name VARCHAR2(250) NOT NULL,
    Prod_price     NUMBER(10,2) NOT NULL,
    Prod_WH_state  VARCHAR2(250) NOT NULL
  );
--------------------------------------------------
CREATE TABLE cls_customers
  (
    Cust_id     NUMBER (8,0) NOT NULL,
    Cust_name   VARCHAR2(250) NOT NULL,
    Cust_usname VARCHAR2(250) NOT NULL,
    Cust_email  VARCHAR2(250),
    Cust_birth  DATE, 
    Cust_street VARCHAR2(250) NOT NULL,
    Cust_city   VARCHAR2(250) NOT NULL,
    Cust_coun   VARCHAR2(250) NOT NULL,
    Cust_zip    VARCHAR2(250) NOT NULL,
    Cust_state  VARCHAR2(250) NOT NULL,
    Cust_phone  VARCHAR2(250) NOT NULL
  );
--------------------------------------------------
CREATE TABLE cls_payments
  (
    Paym_id     NUMBER (8,0) NOT NULL,
    Cust_ID     NUMBER (8,0) NOT NULL,
    Prod_ID     NUMBER (8,0) NOT NULL,
    Trans_date  DATE NOT NULL,
    Cr_card     VARCHAR2(250) NOT NULL,
    Cr_card_num VARCHAR2(250) NOT NULL
  );
--------------------------------------------------
CREATE TABLE existing_files
  (
    filename VARCHAR2(250)
  );
--------------------------------------------------
CREATE TABLE dim_customers
  (
    Cust_sur_id NUMBER (8,0) PRIMARY KEY,
    Cust_id     NUMBER (8,0) NOT NULL,
    Cust_name   VARCHAR2(250) NOT NULL,
    Cust_usname VARCHAR2(250) NOT NULL,
    Cust_email  VARCHAR2(250),
    Cust_birth  DATE, --date
    Cust_street VARCHAR2(250) NOT NULL,
    Cust_city   VARCHAR2(250) NOT NULL,
    Cust_coun   VARCHAR2(250) NOT NULL,
    Cust_zip    VARCHAR2(250) NOT NULL,
    Cust_state  VARCHAR2(250) NOT NULL,
    Cust_phone  VARCHAR2(250) NOT NULL
  );
--------------------------------------------------
CREATE SEQUENCE SEQ_CUST INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE;
CREATE SEQUENCE SEQ_PRODS INCREMENT BY 1 START WITH 1 MINVALUE 1 NOCYCLE;
  -------------------------------------------------------
  CREATE TABLE dim_products
    (
      Prod_sur_id    NUMBER (8,0) PRIMARY KEY,
      Prod_id        NUMBER (8,0) NOT NULL,
      Prod_name      VARCHAR2(250) NOT NULL,
      Prod_comp_name VARCHAR2(250) NOT NULL,
      Prod_price     NUMBER(10,2) NOT NULL,
      Prod_WH_state  VARCHAR2(250) NOT NULL
    );
 --------------------------------------------------
  CREATE TABLE fct_sales
    (
      Paym_ID      NUMBER (8,0) NOT NULL,
      Cust_ID      NUMBER (8,0) NOT NULL,
      Prod_ID      NUMBER (8,0) NOT NULL,
      Trans_date   DATE NOT NULL,
      Prod_price   NUMBER (10,2) NOT NULL,
      Cr_card      VARCHAR2(250) NOT NULL,
      Cr_card_num  VARCHAR2(250) NOT NULL,
      isInterState NUMBER (8,0) NOT NULL,
      CONSTRAINT fk_cust FOREIGN KEY (cust_id) REFERENCES dim_customers (cust_sur_id),
      CONSTRAINT fk_prod FOREIGN KEY (prod_id) REFERENCES dim_products (prod_sur_id)
    );
--------------------------------------------------
  CREATE TABLE fct_sales_rej
    (
      Paym_ID      NUMBER (8,0),
      Cust_ID      NUMBER (8,0),
      Prod_ID      NUMBER (8,0),
      Trans_date   DATE,
      Prod_price   NUMBER (10,2),
      Cr_card      VARCHAR2(250),
      Cr_card_num  VARCHAR2(250),
      isInterState NUMBER (8,0)
    );
 --------------------------------------------------