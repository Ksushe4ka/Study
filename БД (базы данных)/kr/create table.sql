use STATEMENTS;

CREATE TABLE PRODUCTS
     (MFR_ID CHAR(3) NOT NULL,
  PRODUCT_ID CHAR(5) NOT NULL,
 DESCRIPTION VARCHAR(20) NOT NULL,
       PRICE MONEY NOT NULL,
 QTY_ON_HAND INTEGER NOT NULL,
 PRIMARY KEY (MFR_ID, PRODUCT_ID));


CREATE TABLE OFFICES
     (OFFICE INT NOT NULL,
        CITY VARCHAR(15) NOT NULL,
      REGION VARCHAR(10) NOT NULL,
         MGR INT,
      TARGET DECIMAL(9,2),
       SALES DECIMAL(9,2) NOT NULL,
 PRIMARY KEY (OFFICE));


CREATE TABLE SALESREPS
   (EMPL_NUM INT NOT NULL,
             CHECK (EMPL_NUM BETWEEN 101 AND 199),
        NAME VARCHAR(15) NOT NULL,
         AGE INTEGER,
  REP_OFFICE INTEGER,
       TITLE VARCHAR(10),
   HIRE_DATE DATE NOT NULL,
     MANAGER INT,
       QUOTA DECIMAL(9,2),
       SALES DECIMAL(9,2) NOT NULL,
 PRIMARY KEY (EMPL_NUM),
 FOREIGN KEY (MANAGER) REFERENCES SALESREPS(EMPL_NUM),
 CONSTRAINT WORKSIN FOREIGN KEY (REP_OFFICE)  
  REFERENCES OFFICES(OFFICE));


CREATE TABLE CUSTOMERS
   (CUST_NUM INTEGER    NOT NULL,
    COMPANY VARCHAR(20) NOT NULL,
    CUST_REP INTEGER,
    CREDIT_LIMIT DECIMAL(9,2),
 PRIMARY KEY (CUST_NUM),
 CONSTRAINT HASREP FOREIGN KEY (CUST_REP)
  REFERENCES SALESREPS(EMPL_NUM));


CREATE TABLE ORDERS
  (ORDER_NUM INTEGER NOT NULL,
             CHECK (ORDER_NUM > 100000),
  ORDER_DATE DATE NOT NULL,
        CUST INTEGER NOT NULL,
         REP INTEGER,
         MFR CHAR(3) NOT NULL,
     PRODUCT CHAR(5) NOT NULL,
         QTY INTEGER NOT NULL,
      AMOUNT DECIMAL(9,2) NOT NULL,
 PRIMARY KEY (ORDER_NUM),
 CONSTRAINT PLACEDBY FOREIGN KEY (CUST)
  REFERENCES CUSTOMERS(CUST_NUM)
   ON DELETE CASCADE,
 CONSTRAINT TAKENBY FOREIGN KEY (REP)
  REFERENCES SALESREPS(EMPL_NUM),
 CONSTRAINT ISFOR FOREIGN KEY (MFR, PRODUCT)
  REFERENCES PRODUCTS(MFR_ID, PRODUCT_ID));


ALTER TABLE OFFICES
  ADD CONSTRAINT HASMGR
  FOREIGN KEY (MGR) REFERENCES SALESREPS(EMPL_NUM);
