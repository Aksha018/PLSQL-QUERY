-- CUSTOMER_PERSONAL_INFO
DESC CUSTOMER_PERSONAL_INFO;
DROP TABLE CUSTOMER_PERSONAL_INFO;
CREATE TABLE CUSTOMER_PERSONAL_INFO
(
 CUSTOMER_ID VARCHAR(5),
 CUSTOMER_NAME VARCHAR(30),
 DATE_OF_BIRTH  DATE,
 GUARDIAN_NAME VARCHAR(30),
 ADDRESS VARCHAR(50),
 CONTACT_NO NUMBER(10),
 MAIL_ID  VARCHAR(30),
 GENDER CHAR(1),
 MARITAL_STATUS VARCHAR(10),
 IDENTIFICATION_DOC_TYPE VARCHAR(20),
 ID_DOC_NO VARCHAR(20),
 CITIZENSHIP VARCHAR(10),
 CONSTRAINT CUST_PERS_INFO_PK PRIMARY KEY(CUSTOMER_ID)
);

-- CUSTOMER_REFERENCE_INFO

CREATE TABLE CUSTOMER_REFERENCE_INFO
(
  CUSTOMER_ID VARCHAR(5),
  REFERENCE_ACC_NAME  VARCHAR(20),
  REFERENCE_ACC_NO NUMBER(16),
  REFERENCE_ACC_ADDRESS VARCHAR(50),
  RELATION VARCHAR(25),
  CONSTRAINT CUST_REF_INFO_PK PRIMARY KEY(CUSTOMER_ID),
  CONSTRAINT CUST_REF_INFO_FK FOREIGN KEY(CUSTOMER_ID) REFERENCES   CUSTOMER_PERSONAL_INFO(CUSTOMER_ID)
);

-- BANK_INFO

CREATE TABLE BANK_INFO
(
  IFSC_CODE   VARCHAR(15),
  BANK_NAME   VARCHAR(25),
  BRANCH_NAME VARCHAR(25),
  CONSTRAINT BANK_INFO_PK PRIMARY KEY(IFSC_CODE)
);



-- ACCOUNT_INFO

CREATE TABLE ACCOUNT_INFO
(
 ACCOUNT_NO NUMBER(16),
 CUSTOMER_ID VARCHAR(5),
 ACCOUNT_TYPE VARCHAR(10),
 REGISTRATION_DATE DATE,
 ACTIVATION_DATE DATE,
 IFSC_CODE VARCHAR(10),
 INTEREST DECIMAL(7,2),
 INITIAL_DEPOSIT NUMBER(10),   
 CONSTRAINT ACC_INFO_PK PRIMARY KEY(ACCOUNT_NO),
 CONSTRAINT ACC_INFO_PERS_FK FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER_PERSONAL_INFO(CUSTOMER_ID),
 CONSTRAINT ACC_INFO_BANK_FK FOREIGN KEY(IFSC_CODE) REFERENCES BANK_INFO(IFSC_CODE)
);

-- BANK_INFO


INSERT INTO BANK_INFO(IFSC_CODE,BANK_NAME,BRANCH_NAME)
VALUES('HDVL0012','HDFC','VALASARAVAKKAM');
INSERT INTO BANK_INFO(IFSC_CODE,BANK_NAME,BRANCH_NAME) 
VALUES('SBITN0123','SBI','TNAGAR');
INSERT INTO BANK_INFO(IFSC_CODE,BANK_NAME,BRANCH_NAME) 
VALUES('ICITN0232','ICICI','TNAGAR');
INSERT INTO BANK_INFO(IFSC_CODE,BANK_NAME,BRANCH_NAME) 
VALUES('ICIPG0242','ICICI','PERUNGUDI');
INSERT INTO BANK_INFO(IFSC_CODE,BANK_NAME,BRANCH_NAME) 
VALUES('SBISD0113','SBI','SAIDAPET');

-- CUSTOMER_PERSONAL_INFO

INSERT INTO CUSTOMER_PERSONAL_INFO(CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,ADDRESS,CONTACT_NO,MAIL_ID,GENDER,MARITAL_STATUS,IDENTIFICATION_DOC_TYPE,ID_DOC_NO,CITIZENSHIP) 
VALUES('C-001','JOHN','03-MAY-1984','PETER','NO.14, ST.MARKS ROAD,BANGALORE',9734526719,'JOHN_123@gmail.com','M','SINGLE','PASSPORT','PASS123','INDIAN');
INSERT INTO CUSTOMER_PERSONAL_INFO(CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,ADDRESS,CONTACT_NO,MAIL_ID,GENDER,MARITAL_STATUS,IDENTIFICATION_DOC_TYPE,ID_DOC_NO,CITIZENSHIP) 
VALUES('C-002','JAMES','06-AUG-1984','GEORGE','NO.18, MG ROAD,BANGALORE',9237893481,'JAMES_123@gmail.com','M','MARRIED','PASSPORT','PASS124','INDIAN');
INSERT INTO CUSTOMER_PERSONAL_INFO(CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,ADDRESS,CONTACT_NO,MAIL_ID,GENDER,MARITAL_STATUS,IDENTIFICATION_DOC_TYPE,ID_DOC_NO,CITIZENSHIP)
VALUES('C-003','SUNITHA','06-NOV-1984','VINOD','NO.21, GM ROAD,CHENNAI',9438978389,'SUNITHA_123@gmail.com','F','SINGLE','VOTER-ID','GMV1234','INDIAN');
INSERT INTO CUSTOMER_PERSONAL_INFO(CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,ADDRESS,CONTACT_NO,MAIL_ID,GENDER,MARITAL_STATUS,IDENTIFICATION_DOC_TYPE,ID_DOC_NO,CITIZENSHIP) 
VALUES('C-004','RAMESH','11-DEC-1985','KRISHNAN','NO.14,LB ROAD,CHENNAI',9235234534,'RAMESH_123@gmail.com','M','MARRIED','PASSPORT','PASS125','INDIAN');
INSERT INTO CUSTOMER_PERSONAL_INFO(CUSTOMER_ID,CUSTOMER_NAME,DATE_OF_BIRTH,GUARDIAN_NAME,ADDRESS,CONTACT_NO,MAIL_ID,GENDER,MARITAL_STATUS,IDENTIFICATION_DOC_TYPE,ID_DOC_NO,CITIZENSHIP) 
VALUES('C-005','KUMAR','26-APR-1983','KIRAN','NO.18,MM ROAD,BANGALORE',9242342312,'KUMAR_123@gmail.com','M','SINGLE','PASSPORT','PASS126','INDIAN');


-- CUSTOMER_REFERENCE_INFO

INSERT INTO CUSTOMER_REFERENCE_INFO(CUSTOMER_ID,REFERENCE_ACC_NAME,REFERENCE_ACC_NO,REFERENCE_ACC_ADDRESS,RELATION) VALUES('C-001','RAM',0987654321122345,'NO.11,BRIGRADE ROAD,BANGALORE','FRIEND');
INSERT INTO CUSTOMER_REFERENCE_INFO(CUSTOMER_ID,REFERENCE_ACC_NAME,REFERENCE_ACC_NO,REFERENCE_ACC_ADDRESS,RELATION) VALUES('C-002','RAGHUL',0987654321122346,'NO.21,CUNNGHAM ROAD,BANGALORE','FRIEND');
INSERT INTO CUSTOMER_REFERENCE_INFO(CUSTOMER_ID,REFERENCE_ACC_NAME,REFERENCE_ACC_NO,REFERENCE_ACC_ADDRESS,RELATION) VALUES('C-003','GOKUL',0987654321122357,'NO.12,OMR,CHENNAI','NEIGHBOUR');
INSERT INTO CUSTOMER_REFERENCE_INFO(CUSTOMER_ID,REFERENCE_ACC_NAME,REFERENCE_ACC_NO,REFERENCE_ACC_ADDRESS,RELATION) VALUES('C-004','RAHMAN',0987654321122348,'NO.35,ECR,CHENNAI','FRIEND');
INSERT INTO CUSTOMER_REFERENCE_INFO(CUSTOMER_ID,REFERENCE_ACC_NAME,REFERENCE_ACC_NO,REFERENCE_ACC_ADDRESS,RELATION) VALUES('C-005','VIVEK',0987654321122359,'NO.78,JAYA NAGAR,BANGALORE','NEIGHBOUR');


-- ACCOUNT_INFO


INSERT INTO ACCOUNT_INFO(ACCOUNT_NO,CUSTOMER_ID,ACCOUNT_TYPE,REGISTRATION_DATE,ACTIVATION_DATE,IFSC_CODE,INTEREST, INITIAL_DEPOSIT) VALUES(1234567898765432,'C-001','SAVINGS','23-FEB-2012','28-FEB-2012','HDVL0012',5,10000); 
INSERT INTO ACCOUNT_INFO(ACCOUNT_NO,CUSTOMER_ID,ACCOUNT_TYPE,REGISTRATION_DATE,ACTIVATION_DATE,IFSC_CODE,INTEREST, INITIAL_DEPOSIT) VALUES(1234567898765433,'C-002','SALARY','12-MAR-2012','17-MAR-2012','SBITN0123',6,0 ); 
INSERT INTO ACCOUNT_INFO(ACCOUNT_NO,CUSTOMER_ID,ACCOUNT_TYPE,REGISTRATION_DATE,ACTIVATION_DATE,IFSC_CODE,INTEREST, INITIAL_DEPOSIT) VALUES(1234567898765434,'C-003','SAVINGS','15-MAR-2012','20-MAR-2012','ICITN0232',4,16000 ); 
INSERT INTO ACCOUNT_INFO(ACCOUNT_NO,CUSTOMER_ID,ACCOUNT_TYPE,REGISTRATION_DATE,ACTIVATION_DATE,IFSC_CODE,INTEREST, INITIAL_DEPOSIT) VALUES(1234567898765435,'C-004','SALARY','05-APR-2012','10-APR-2012','HDVL0012',7,0);
INSERT INTO ACCOUNT_INFO(ACCOUNT_NO,CUSTOMER_ID,ACCOUNT_TYPE,REGISTRATION_DATE,ACTIVATION_DATE,IFSC_CODE,INTEREST, INITIAL_DEPOSIT) VALUES(1234567898765436,'C-005','SAVINGS','12-APR-2012','17-APR-2012','SBISD0113',8,20000);

SELECT * FROM ACCOUNT_INFO;
SELECT * FROM BANK_INFO;


Query:

-- 1) Write a query which will display the customer id, account type they hold, their account number and bank name.
-- 2) Write a query which will display the customer id, account type and the account number of HDFC customers who registered after 12-JAN-2012 and before 04-APR-2012.
-- 3) Write a query which will display the customer id, customer name, account no, account type and bank name where the customers hold the account.
-- 4)Write a query which will display the customer id, customer name, gender, marital status along with the unique reference string and sort the records based on customer id in descending order.
-- Hint:Generate unique reference string as mentioned below.CustomerName_Gender_MaritalStatus. Use ""UNIQUE_REF_STRING"" as alias name for displaying the unique reference string."
-- 5) Write a query which will display the account number, customer id, registration date, initial deposit amount of the customer whose initial deposit amount is within the range of Rs.15000 to Rs.25000.
-- 6) Write a query which will display customer id, customer name, date of birth, guardian name of the customers whose name starts with 'J'.
-- 7) Write a query which will display customer id, account number and passcode. Hint:  To generate passcode, join the last three digits of customer id and last four digit of account number.
-- Example: C-001     1234567898765432     0015432. Use ""PASSCODE"" as alias name for displaying the passcode."
-- 8) Write a query which will display the customer id, customer name, date of birth, Marital Status, Gender, Guardian name, contact no and email id of the customers whose gender is male 'M' and marital status is MARRIED.
-- 9) Write a query which will display the customer id, customer name, guardian name, reference account holders name of the customers who are referenced / referred by their 'FRIEND'.
-- 10) Write a query to display the customer id, account number and interest amount in the below format with INTEREST_AMT as alias name.Sort the result based on the INTEREST_AMT in ascending order.
-- Hint: Need to prefix $ to interest amount and round the result without decimals.
-- 11) Write a query which will display the customer id, customer name, account no, account type, activation date,bank name whose account will be activated on '10-APR-2012'
-- 12) Write a query which will display account number, customer id, customer name, bank name, branch name, ifsc code,citizenship, interest and initial deposit amount of all the customers.
-- 13) Write a query which will display customer id, customer name, date of birth, guardian name, contact number,mail id and reference account holder's name of the customers who has submitted the passport as an identification document.
-- 14) Write a query to display the customer id, customer name, account number, account type, initial deposit,interest who have deposited the maximum amount in the bank.
-- 15) Write a query to display the customer id, customer name, account number, account type, interest, bank name and initial deposit amount of the customers who are getting maximum interest rate.
-- 16) Write a query to display the customer id, customer name, account no, bank name, contact no and mail id of the customers who are from BANGALORE.
-- 17) Write a query which will display customer id, bank name, branch name, ifsc code, registration date,activation date of the customers whose activation date is in the month of march (March 1'st to March 31'st).
-- 18) Write a query which will calculate the interest amount and display it along with customer id, customer name, account number, account type, interest, and initial deposit amount.
-- calculate: ((interest/100) * initial deposit amt) with column name 'interest_amt' (alias)
-- 19) Write a query to display the customer id, customer name, date of birth, guardian name, contact number, mail id, reference name who has been referenced by 'RAGHUL'.
-- 20) Write a query which will display the customer id, customer name and contact number with ISD code of all customers in below mentioned format.  Sort the result based on the customer id in descending order. 
-- Format for contact number is :  ""+91-3digits-3digits-4digits""Example: +91-924-234-2312Use ""CONTACT_ISD"" as alias name."
-- 21) Write a query which will display account number, account type, customer id, customer name, date of birth, guardian name,contact no, mail id , gender, reference account holders name, reference account holders account number, registration date, 
-- activation date, number of days between the registration date and activation date with alias name "NoofdaysforActivation", bank name, branch name and initial deposit for all the customers.
-- 22) Write a query which will display customer id, customer name,  guardian name, identification doc type,reference account holders name, account type, ifsc code, bank name and current balance for the customers who has only the savings account. 
-- Hint:  Formula for calculating current balance is add the intital deposit amount and interest and display without any decimals. Use ""CURRENT_BALANCE"" as alias name."
-- 23) Write a query which will display the customer id, customer name, account number, account type, interest, initial deposit;check the initial deposit, if initial deposit is 20000 then display ""high"",if initial deposit is 16000 display 'moderate', if initial deposit is 10000 display 'average', if initial deposit is 5000 display 'low', if initial deposit is 0 display
-- 'very low' otherwise display 'invalid' and sort by interest in descending order.Hint: Name the column as ""Deposit_Status"" (alias). 
-- Strictly follow the lower case for strings in this query."
-- 24)Write a query which will display customer id, customer name,  account number, account type, bank name, ifsc code, initial deposit amountand new interest amount for the customers whose name starts with ""J"". Hint:  Formula for calculating ""new interest amount"" is 
-- if customers account type is savings then add 10 % on current interest amount to interest amount else display the current interest amount.Round the new interest amount to 2 decimals.<br/> Use ""NEW_INTEREST"" as alias name for displaying the new interest amount.
-- 25) Write query to display the customer id, customer name, account no, initial deposit, tax percentage as calculated below.
-- Hint:If initial deposit = 0 then tax is '0%'.If initial deposit <= 10000 then tax is '3%' 
-- If initial deposit > 10000 and initial deposit < 20000 then tax is '5%'.If initial deposit >= 20000 andinitial deposit <=30000 then tax is '7%'.If initial deposit > 30000 then tax is '10%'.Use the alias name 'taxPercentage'


1.
SELECT 
AI.CUSTOMER_ID,
AI.ACCOUNT_TYPE,
AI.ACCOUNT_NO,
BI.BANK_NAME
FROM
ACCOUNT_INFO AI,
BANK_INFO BI
WHERE
AI.IFSC_CODE = BI.IFSC_CODE;


2.
SELECT
AI.CUSTOMER_ID,
AI.ACCOUNT_TYPE,
AI.ACCOUNT_NO
FROM
ACCOUNT_INFO AI,
BANK_INFO BI
WHERE
AI.IFSC_CODE = BI.IFSC_CODE
AND BI.BANK_NAME = 'HDFC'
AND AI.REGISTRATION_DATE BETWEEN '12-JAN-2012' AND '04-APR-2012';


3.
SELECT
CPI.CUSTOMER_ID , 
CPI.CUSTOMER_NAME, 
AI.ACCOUNT_NO, 
AI.ACCOUNT_TYPE,
BI.BANK_NAME
FROM
CUSTOMER_PERSONAL_INFO CPI,
ACCOUNT_INFO AI,
BANK_INFO BI
WHERE
AI.IFSC_CODE = BI.IFSC_CODE
AND CPI.CUSTOMER_ID = AI.CUSTOMER_ID
ORDER BY
CPI.CUSTOMER_ID;


4.
SELECT
CUSTOMER_ID, 
CUSTOMER_NAME, 
GENDER, 
MARITAL_STATUS,
CUSTOMER_NAME||'_'||GENDER||'_'||MARITAL_STATUS UNIQUE_REF_STRING
FROM
CUSTOMER_PERSONAL_INFO
ORDER BY
CUSTOMER_ID DESC

5.
SELECT
account_nO,
customer_id, 
registration_date, 
initial_deposit
FROM
ACCOUNT_INFO
WHERE
initial_deposit BETWEEN 15000 AND 25000;


6.
SELECT
CUSTOMER_ID, 
CUSTOMER_NAME, 
DATE_OF_BIRTH, 
GUARDIAN_NAME
FROM
CUSTOMER_PERSONAL_INFO
WHERE
CUSTOMER_NAME LIKE 'J%';


7.
SELECT
customer_id, 
account_no,
SUBSTR(customer_id,length(customer_id)-2,3)||SUBSTR(account_no,length(account_no)-3,4) passcode
FROM
ACCOUNT_INFO


8.
SELECT
CUSTOMER_ID, 
CUSTOMER_NAME, 
DATE_OF_BIRTH, 
MARITAL_STATUS, 
GENDER, 
GUARDIAN_NAME, 
CONTACT_NO ,
MAIL_ID 
FROM
CUSTOMER_PERSONAL_INFO
WHERE
GENDER = 'M'
AND  MARITAL_STATUS='MARRIED'


9.
SELECT 
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME, 
CPI.GUARDIAN_NAME, 
CRI.REFERENCE_ACC_NAME
FROM
CUSTOMER_PERSONAL_INFO CPI,
CUSTOMER_REFERENCE_INFO CRI
WHERE
CPI.CUSTOMER_ID = CRI.CUSTOMER_ID
AND CRI.RELATION = 'FRIEND';


10.
SELECT
CUSTOMER_ID, 
ACCOUNT_NO,
'$'||ROUND(INTEREST) INTEREST_AMT 
FROM
ACCOUNT_INFO
ORDER BY
INTEREST_AMT ASC;

11.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME, 
AI.ACCOUNT_NO, 
AI.ACCOUNT_TYPE, 
AI.ACTIVATION_DATE,
BI.BANK_NAME
FROM
CUSTOMER_PERSONAL_INFO CPI,
ACCOUNT_INFO AI,
BANK_INFO BI
WHERE
AI.IFSC_CODE = BI.IFSC_CODE
AND CPI.CUSTOMER_ID = AI.CUSTOMER_ID
AND AI.ACTIVATION_DATE = '10-APR-2012';

12.
SELECT
AI.ACCOUNT_NO, 
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME,
BI.BANK_NAME, 
BI.BRANCH_NAME, 
BI.IFSC_CODE,
CPI.CITIZENSHIP, 
AI.INTEREST,
AI.INITIAL_DEPOSIT
FROM
CUSTOMER_PERSONAL_INFO CPI,
ACCOUNT_INFO AI,
BANK_INFO BI
WHERE
AI.IFSC_CODE = BI.IFSC_CODE
AND CPI.CUSTOMER_ID = AI.CUSTOMER_ID;

13.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME,
CPI.DATE_OF_BIRTH, 
CPI.GUARDIAN_NAME, 
CPI.CONTACT_NO,
CPI.MAIL_ID,
CRI.REFERENCE_ACC_NAME
FROM
CUSTOMER_PERSONAL_INFO CPI,
CUSTOMER_REFERENCE_INFO CRI
WHERE
CPI.CUSTOMER_ID = CRI.CUSTOMER_ID
AND CPI.IDENTIFICATION_DOC_TYPE = 'PASSPORT';

14.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME,
AI.ACCOUNT_NO,
AI.ACCOUNT_TYPE, 
AI.INITIAL_DEPOSIT,
AI.INTEREST
FROM
ACCOUNT_INFO AI,
CUSTOMER_PERSONAL_INFO CPI
WHERE
CPI.CUSTOMER_ID = AI.CUSTOMER_ID
AND AI.INITIAL_DEPOSIT = (SELECT MAX(INITIAL_DEPOSIT) FROM ACCOUNT_INFO);

15.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME,
AI.ACCOUNT_NO,
AI.ACCOUNT_TYPE, 
AI.INTEREST,
BI.BANK_NAME,
AI.INITIAL_DEPOSIT
FROM
ACCOUNT_INFO AI,
CUSTOMER_PERSONAL_INFO CPI,
BANK_INFO BI
WHERE
CPI.CUSTOMER_ID = AI.CUSTOMER_ID
AND AI.IFSC_CODE = BI.IFSC_CODE
AND AI.INTEREST = (SELECT MAX(INTEREST) FROM ACCOUNT_INFO);


16.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME, 
AI.ACCOUNT_NO, 
BI.BANK_NAME, 
CPI.CONTACT_NO,
CPI.MAIL_ID
FROM
ACCOUNT_INFO AI,
CUSTOMER_PERSONAL_INFO CPI,
BANK_INFO BI
WHERE
CPI.CUSTOMER_ID = AI.CUSTOMER_ID
AND AI.IFSC_CODE = BI.IFSC_CODE
AND CPI.ADDRESS LIKE '%BANGALORE%';

17.
SELECT
AI.CUSTOMER_ID, 
BI.BANK_NAME, 
BI.BRANCH_NAME, 
BI.IFSC_CODE, 
AI.REGISTRATION_DATE,
AI.ACTIVATION_DATE
FROM
ACCOUNT_INFO AI,
BANK_INFO BI
WHERE
AI.IFSC_CODE = BI.IFSC_CODE
AND AI.ACTIVATION_DATE BETWEEN '01-MAR-2012' AND '31-MAR-2012';

18.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME, 
AI.ACCOUNT_NO, 
AI.ACCOUNT_TYPE, 
AI.INTEREST, 
AI.INITIAL_DEPOSIT,
(AI.INTEREST/100)*AI.INITIAL_DEPOSIT interest_amt
FROM
ACCOUNT_INFO AI,
CUSTOMER_PERSONAL_INFO CPI
WHERE
CPI.CUSTOMER_ID = AI.CUSTOMER_ID;


19.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME, 
CPI.DATE_OF_BIRTH, 
CPI.GUARDIAN_NAME, 
CPI.CONTACT_NO, 
CPI.MAIL_ID, 
CRI.REFERENCE_ACC_NAME
FROM
CUSTOMER_PERSONAL_INFO CPI,
CUSTOMER_REFERENCE_INFO CRI
WHERE
CPI.CUSTOMER_ID = CRI.CUSTOMER_ID
AND CRI.REFERENCE_ACC_NAME = 'RAGHUL'

20.
SELECT
CUSTOMER_ID, 
CUSTOMER_NAME,
CONTACT_NO,
'+91'||'-'||SUBSTR(CONTACT_NO,1,3)||'-'||SUBSTR(CONTACT_NO,4,3)||'-'||SUBSTR(CONTACT_NO,7,4) CONTACT_ISD
FROM
CUSTOMER_PERSONAL_INFO

21.
SELECT
AI.ACCOUNT_NO, 
AI.ACCOUNT_TYPE, 
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME, 
CPI.DATE_OF_BIRTH, 
CPI.GUARDIAN_NAME,
CPI.CONTACT_NO, 
CPI.MAIL_ID , 
CPI.GENDER,
CRI.REFERENCE_ACC_NAME, 
CRI.REFERENCE_ACC_NO, 
AI.REGISTRATION_DATE, 
AI.ACTIVATION_DATE, 
BI.BANK_NAME, 
BI.BRANCH_NAME,
AI.INITIAL_DEPOSIT,
AI.ACTIVATION_DATE - AI.REGISTRATION_DATE NOOFDAYSFORACTIVATION
FROM
ACCOUNT_INFO AI,
CUSTOMER_PERSONAL_INFO CPI,
CUSTOMER_REFERENCE_INFO CRI,
BANK_INFO BI
WHERE
CPI.CUSTOMER_ID = AI.CUSTOMER_ID
AND CPI.CUSTOMER_ID = CRI.CUSTOMER_ID
AND AI.IFSC_CODE = BI.IFSC_CODE

22.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME,  
CPI.GUARDIAN_NAME, 
CPI.IDENTIFICATION_DOC_TYPE,
CRI.REFERENCE_ACC_NAME,
AI.ACCOUNT_TYPE, 
BI.IFSC_CODE,
BI.BANK_NAME,
AI.INITIAL_DEPOSIT + (AI.INTEREST/100)*AI.INITIAL_DEPOSIT CURRENT_BALANCE
FROM
ACCOUNT_INFO AI,
CUSTOMER_PERSONAL_INFO CPI,
CUSTOMER_REFERENCE_INFO CRI,
BANK_INFO BI
WHERE
CPI.CUSTOMER_ID = AI.CUSTOMER_ID
AND CPI.CUSTOMER_ID = CRI.CUSTOMER_ID
AND AI.IFSC_CODE = BI.IFSC_CODE
AND AI.ACCOUNT_TYPE = 'SAVINGS'


23.
SELECT
CPI.CUSTOMER_ID, 
CPI.CUSTOMER_NAME, 
AI.ACCOUNT_NO, 
AI.ACCOUNT_TYPE, 
AI.INTEREST, 
AI.INITIAL_DEPOSIT,
DECODE (AI.INITIAL_DEPOSIT,'20000','high','16000','moderate','10000','average','5000','low','0','very low','invalid') DEPOSIT_STATUS
FROM
CUSTOMER_PERSONAL_INFO CPI,
ACCOUNT_INFO AI
WHERE
CPI.CUSTOMER_ID = AI.CUSTOMER_ID
ORDER BY
AI.INTEREST DESC



24.SELECT CPI.CUSTOMER_ID, CPI.CUSTOMER_NAME, AI.ACCOUNT_NO, AI.ACCOUNT_TYPE, BI.BANK_NAME, BI.IFSC_CODE, AI.INITIAL_DEPOSIT,
CASE
WHEN ACCOUNT_TYPE='SAVINGS' THEN ROUND((INTEREST+(INTEREST*10/100)),2)
ELSE INTEREST END NEW_INTEREST_AMOUNT
FROM CUSTOMER_PERSONAL_INFO CPI
INNER JOIN ACCOUNT_INFO AI
ON CPI.CUSTOMER_ID=AI.CUSTOMER_ID
INNER JOIN BANK_INFO BI
ON BI.IFSC_CODE=AI.IFSC_CODE
WHERE CPI.CUSTOMER_NAME LIKE 'J%';



25.SELECT CPI.CUSTOMER_ID, CPI.CUSTOMER_NAME, AI.ACCOUNT_NO, AI.INITIAL_DEPOSIT,
CASE
WHEN INITIAL_DEPOSIT=0 THEN '0%'
WHEN INITIAL_DEPOSIT<=10000 THEN '3%'
WHEN INITIAL_DEPOSIT>10000 AND INITIAL_DEPOSIT<20000 THEN '5%'
WHEN INITIAL_DEPOSIT>=20000 AND INITIAL_DEPOSIT<=30000 THEN '7%'
WHEN INITIAL_DEPOSIT>30000 THEN '10%' ELSE 'invalid' END TAX_PERCENTAGE
FROM CUSTOMER_PERSONAL_INFO CPI
INNER JOIN ACCOUNT_INFO AI
ON CPI.CUSTOMER_ID=AI.CUSTOMER_ID;


