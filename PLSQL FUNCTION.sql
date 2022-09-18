CREATE TABLE Vet (
    Vet_ID NUMBER(3),
    V_fName VARCHAR2(20) NOT NULL,
    V_lName VARCHAR2(20) NOT NULL,
    V_Phone VARCHAR2(12) UNIQUE,
    V_Address VARCHAR2(50),
    Salary_Per_Mon NUMBER(6) NOT NULL,
    Charge_Per_App NUMBER(3) NOT NULL,
    CONSTRAINT Vet_VetID_PK PRIMARY KEY (Vet_ID)
);

CREATE TABLE Owner (
    Owner_ID NUMBER(4),
    O_fName VARCHAR2(20) NOT NULL,
    O_lName VARCHAR2(20) NOT NULL,
    O_Phone VARCHAR2(12) UNIQUE,
    O_Address VARCHAR2(50) NOT NULL,
    CONSTRAINT Owner_OwnerID_PK PRIMARY KEY (Owner_ID)
);

CREATE TABLE Pet (
    Pet_ID NUMBER(4),
    Owner_ID NUMBER(4),
    Pet_Name VARCHAR2(25) NOT NULL,
    Pet_Type VARCHAR2(10) CHECK(lower(Pet_Type) IN ('dog', 'cat', 'bird', 'rabbit', 'fish', 'Cow', 'Goat', 'reptile')),
    Pet_Age NUMBER(2),
    Pet_Primary_Color VARCHAR2(15),
    CONSTRAINT Pet_PetID_PK PRIMARY KEY (Pet_ID),
    CONSTRAINT Pet_OwnerID_FK FOREIGN KEY (Owner_ID) REFERENCES Owner
);

CREATE TABLE Pet_Condition (
    Pet_ID NUMBER(4),
    Pet_Condition VARCHAR2(50),
    CONSTRAINT PetCondition_PetID_PK PRIMARY KEY (Pet_ID),
    CONSTRAINT PetCondition_PetID_FK FOREIGN KEY (Pet_ID) REFERENCES Pet
);

CREATE TABLE Appointment (
    Appointment_ID NUMBER(5),
    Owner_ID NUMBER(4),
    Pet_ID NUMBER(4),
    "Date" DATE,
    "Time" VARCHAR2(20),
    "Comment" VARCHAR2(40),
    Vet_ID NUMBER(3),
    CONSTRAINT Appointment_AppID_PK PRIMARY KEY (Appointment_ID),    
    CONSTRAINT Appointmemt_OwnerID_FK FOREIGN KEY (Owner_ID) REFERENCES Owner ON DELETE CASCADE,
    CONSTRAINT Appointmemt_PetID_FK FOREIGN KEY (Pet_ID) REFERENCES Pet,
    CONSTRAINT Appointmemt_VetID_PK FOREIGN KEY (Vet_ID) REFERENCES Vet
);

--SQL QUERY

--1.List all pet owner order by their id
--2.List all pet owner with their pet information
--3.List all the vet id, first name, last name and salary from the Vet table who have a salary per month greater than 8000.
--4.List all the pet’s owner information from the Owner table who have more than one pet.
--5.List all appointment from appointment table with owners name and their pet names order by appointment date and time
--6.Change appointment date to 25/07/2022 where the pet's name is ‘Putih’ and it is a cat.
--7.List the appointment id, date, owner name, pet name, pet type order by appointment date
--8.Update pet condition where pet name is Luna and it is a cat.

1.
SELECT OWNER_ID,
O_FNAME
FROM OWNER 
ORDER BY OWNER_ID ASC;

2.SELECT * FROM PET,OWNER
 WHERE PET.OWNER_ID = OWNER.OWNER_ID;

3.
SELECT VET_ID,
V_FNAME,
V_LNAME,
SALARY_PER_MON FROM VET 
WHERE SALARY_PER_MON>8000;

4.SELECT * FROM OWNER
WHERE owner_id IN (SELECT UNIQUE(p.owner_id)
FROM pet p, (SELECT owner_id, COUNT(pet_id) AS cn FROM pet GROUP BY owner_id) s WHERE p.owner_id = s.owner_id AND s.cn > 1);

 
5.SELECT * FROM Appointment A, 
PET P, OWNER O 
WHERE A.OWNER_ID = O.OWNER_ID 
AND A.PET_ID = P.PET_ID 
AND P.OWNER_ID = O.OWNER_ID;
--OR
SELECT * FROM Appointment A, PET P, OWNER O 
WHERE A.OWNER_ID = O.OWNER_ID 
AND A.PET_ID = P.PET_ID  
AND A.PET_ID = P.PET_ID;

6.UPDATE Appointment SET "Date" = to_date('25/07/22', 'dd/mm/yy') 
WHERE APPOINTMENT_ID = (SELECT APPOINTMENT_ID FROM Appointment A, PET P WHERE A.PET_ID = P.PET_ID AND P.PET_NAME = 'Putih');

7.SELECT appointment_id,"Date",O_FNAME,pet_name,pet_type 
FROM Appointment A, PET P, OWNER O 
WHERE A.OWNER_ID = O.OWNER_ID
AND A.PET_ID = P.PET_ID 
AND P.OWNER_ID = O.OWNER_ID;

8.UPDATE Pet_Condition SET PET_CONDITION = 'Good' 
WHERE pet_id = (select pc.pet_id from pet p,pet_condition pc where p.pet_id = pc.pet_id and p.pet_name ='Luna' );


--FUNCTIONS

--1.Create a function to give a discount on the charge of an appointment. Give 20% discount to those who live in Selangor, 10% discount to those who live in Kuala Lumpur.
--2.Create a function to check how many appointments a vet in a month. Function takes vet_id, month name, and year as input.


1.SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE FUNCTION getDiscount (ow_address IN owner.o_address%TYPE)
    RETURN NUMBER
    IS
    discount NUMBER;
BEGIN
    IF ow_address LIKE '%Selangor%' THEN discount := 0.2;
        ELSIF ow_address LIKE '%Kuala Lumpur%' THEN discount := 0.2;
        ELSE discount := 0;
    END IF;
    RETURN discount;
END;
/

ACCEPT ow_id PROMPT 'Enter Owner ID: ';
DECLARE
    o_id owner.owner_id%TYPE;
    ow_fname owner.o_fname%TYPE;
    ow_lname owner.o_lname%TYPE;
    ow_address owner.o_address%TYPE;
    charge_of_vet vet.charge_per_app%TYPE;    
    discount NUMBER;
    discount_bill NUMBER;
BEGIN
    o_id := &ow_id;

    SELECT charge_per_app
    INTO charge_of_vet
    FROM vet
    WHERE vet_id = (SELECT vet_id FROM appointment WHERE owner_id = o_id);

    SELECT o_fname, o_lname, o_address
    INTO ow_fname, ow_lname, ow_address
    FROM owner
    WHERE owner_id = o_id;

    discount := getDiscount(ow_address);
    discount_bill := charge_of_vet - (charge_of_vet * discount);

    DBMS_OUTPUT.PUT_LINE('Pet Owner Name: ' || ow_fname || ' ' || ow_lname);
    DBMS_OUTPUT.PUT_LINE('Pet Owner Address: ' || ow_address);
    DBMS_OUTPUT.PUT_LINE('Vet fee: ' || charge_of_vet);
    DBMS_OUTPUT.PUT_LINE('Eligible Discount: ' || (discount * 100) || '%' || chr(10));

    DBMS_OUTPUT.PUT_LINE('Vet fee after discount: ' || discount_bill);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Your given Owner ID does not have any appointment. Or Your given Owner ID is Invalid.');
END;

--------------------------------------------------------------------------------------------------------------------------------------

2.SET SERVEROUTPUT ON;
SET VERIFY OFF;
CREATE OR REPLACE FUNCTION countAppiontmentOfVet 
    (
        v_id IN vet.vet_id%TYPE, 
        month_name IN VARCHAR2, 
        g_year IN VARCHAR2
    )
    RETURN NUMBER
    IS
    t_count NUMBER;
    s_date VARCHAR2(30);
    f_date VARCHAR2(30);

BEGIN
    IF month_name = 'January' THEN s_date := '01/01/' || g_year; f_date := '31/01/' || g_year;
        ELSIF month_name = 'February' THEN s_date := '01/02/' || g_year; f_date := '28/02/' || g_year;
        ELSIF month_name = 'March' THEN s_date := '01/03/' || g_year; f_date := '31/03/' || g_year;
        ELSIF month_name = 'April' THEN s_date := '01/04/' || g_year; f_date := '30/04/' || g_year;
        ELSIF month_name = 'May' THEN s_date := '01/05/' || g_year; f_date := '31/05/' || g_year;
        ELSIF month_name = 'June' THEN s_date := '01/06/' || g_year; f_date := '30/06/' || g_year;
        ELSIF month_name = 'July' THEN s_date := '01/07/' || g_year; f_date := '31/07/' || g_year;
        ELSIF month_name = 'August' THEN s_date := '01/08/' || g_year; f_date := '31/08/' || g_year;
        ELSIF month_name = 'September' THEN s_date := '01/09/' || g_year; f_date := '30/09/' || g_year;
        ELSIF month_name = 'October' THEN s_date := '01/10/' || g_year; f_date := '31/10/' || g_year;
        ELSIF month_name = 'November' THEN s_date := '01/11/' || g_year; f_date := '30/11/' || g_year;
        ELSIF month_name = 'December' THEN s_date := '01/12/' || g_year; f_date := '31/12/' || g_year;
        ELSE DBMS_OUTPUT.PUT_LINE('You Enter a Invalid month name.');
    END IF;

    SELECT COUNT(*)
    INTO t_count
    FROM appointment
    WHERE vet_id = v_id 
    AND "Date" BETWEEN to_date(s_date, 'dd/mm/yyyy') AND to_date(f_date, 'dd/mm/yyyy');

    RETURN t_count;
END;
/

ACCEPT v_id PROMPT 'Enter a Vet ID: ';
ACCEPT month_name PROMPT 'Enter a month (eg. Janurary, February ): ';
ACCEPT g_year PROMPT 'Enter the year: ';
DECLARE
    vid vet.vet_id%TYPE;
    vet_fname vet.v_fname%TYPE;
    vet_lname vet.v_lname%TYPE;
    g_month VARCHAR2(20);
    t_count NUMBER;
BEGIN
    vid := &v_id;
    g_month := '&month_name';

    SELECT v_fname, v_lname
    INTO vet_fname, vet_lname
    FROM vet
    WHERE vet_id = vid;

    t_count := countAppiontmentOfVet(vid, g_month, '&g_year');

    DBMS_OUTPUT.PUT_LINE(vid || ' ' || vet_fname || ' ' || vet_lname || ' have ' || t_count || ' appointment in ' ||  g_month);
END;


 




