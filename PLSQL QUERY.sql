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

