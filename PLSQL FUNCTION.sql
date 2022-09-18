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

-- Insert data into Vet table
INSERT INTO Vet
VALUES(111, 'Tom', 'Harij', '01112223334', 'Gombak, Selangor', '6000', '80');

INSERT INTO Vet
VALUES(112, 'Mohammad', 'Imran', '01112663334', 'Bukit Damansara, Kuala Lumpur', '6500', '90');

INSERT INTO Vet
VALUES(113, 'Nurul', 'Hushni', '01166623334', 'Medan Idaman, Selangor', '8000', '100');

INSERT INTO Vet
VALUES(114, 'Yu', 'Yan', '01112223434', 'Bukit Bintang, Kuala Lumpur', '9000', '110');

INSERT INTO Vet
VALUES(115, 'Ying', 'Yue', '01122223434', 'Bukit Bintang, Kuala Lumpur', '9000', '120');

INSERT INTO Vet
VALUES(116, 'Safa', 'Kabir', '01212223434', 'Batu Caves, Selangor', '8500', '100');

INSERT INTO Vet
VALUES(117, 'Mohammad', 'Musfiq', '01212923434', 'Batu Caves, Selangor', '7000', '70');

INSERT INTO Vet
VALUES(118, 'Mohammad', 'Latif', '01912923434', 'Ampang, Kuala Lumpur', '7500', '85');

INSERT INTO Vet
VALUES(119, 'Mohammad', 'Razak', '01219923434', 'Batu Caves, Selangor', '10000', '150');

INSERT INTO Vet
VALUES(120, 'Mohammad', 'Mubarak', '01999923434', 'Batu Caves, Selangor', '10000', '140');



-- Insert data into Owner table
INSERT INTO Owner
VALUES(1001, 'Esmee', 'Benitez', '01100000111', 'Gombak, Selangor');

INSERT INTO Owner
VALUES(1002, 'Freyja', 'Paul', '01100000112', 'Ampang, Selangor');

INSERT INTO Owner
VALUES(1003, 'Mohammad', 'Iman', '01100000113', 'Bandar Baru Bangi, Selangor');

INSERT INTO Owner
VALUES(1004, 'Mohammad', 'Asraf', '01100000114', 'Banting, Selangor');

INSERT INTO Owner
VALUES(1005, 'Mohammad', 'Arif', '01100001114', 'Gombak, Selangor');

INSERT INTO Owner
VALUES(1006, 'Danial', 'Hakim', '01100000115', 'Medan Idaman, Selangor');

INSERT INTO Owner
VALUES(1007, 'Raihan', 'Kabir', '01100000116', 'Batu Caves, Selangor');

INSERT INTO Owner
VALUES(1008, 'Mohammad', 'Hahmid', '01100001116', 'Gombak, Selangor');

INSERT INTO Owner
VALUES(1009, 'Mohammad', 'Rakib', '01100001117', 'Bukit Nasa, Kuala Lumpur');

INSERT INTO Owner
VALUES(1010, 'Abdur', 'Rahman', '01100000118', 'Gombak, Selangor');

INSERT INTO Owner
VALUES(1011, 'Abdur', 'Salem', '01100010118', ' ');



-- Insert data into Pet table
INSERT INTO Pet
VALUES(1101, 1001, 'Mini', 'cat', 2, 'white');

INSERT INTO Pet
VALUES(1102, 1002, 'Luna', 'cat', 5, 'brown');

INSERT INTO Pet
VALUES(1103, 1002, 'Teddy', 'dog', 7, 'orange');

INSERT INTO Pet
VALUES(1104, 1003, 'Bill', 'dog', 4, 'black');

INSERT INTO Pet
VALUES(1105, 1004, 'Bella', 'dog', 5, 'brown');

INSERT INTO Pet
VALUES(1106, 1004, 'Buddy', 'dog', 2, 'white');

INSERT INTO Pet
VALUES(1107, 1008, 'Milo', 'cat', 1, 'orange');

INSERT INTO Pet
VALUES(1108, 1005, 'Loki', 'cat', 2, 'black');

INSERT INTO Pet
VALUES(1109, 1006, 'Oliver', 'cat', 5, 'white');

INSERT INTO Pet
VALUES(1110, 1007, 'Bubba', 'bird', 1, 'green');

INSERT INTO Pet
VALUES(1111, 1009, 'Baldy', 'cat', 3, 'black');

INSERT INTO Pet
VALUES(1112, 1010, 'Putih', 'cat', 5, 'black');



-- Insert data into Pet_Condition table
INSERT INTO Pet_Condition
VALUES(1101, 'Good health');

INSERT INTO Pet_Condition
VALUES(1102, 'Not good');

INSERT INTO Pet_Condition
VALUES(1104, 'Ringworm');

INSERT INTO Pet_Condition
VALUES(1107, 'Psittacosis');

INSERT INTO Pet_Condition
VALUES(1112, 'Diabetes');

INSERT INTO Pet_Condition
VALUES(1111, 'Heartworm');



-- Insert data into Appointment table
INSERT INTO Appointment
VALUES(10001, 1001, 1101, to_date('11/07/22', 'dd/mm/yy'), '11.00 am', null, 111);

INSERT INTO Appointment
VALUES(10002, 1002, 1102, to_date('14/07/22', 'dd/mm/yy'), '10.00 am', 'Rash on Skin', 111);

INSERT INTO Appointment
VALUES(10003, 1003, 1104, to_date('09/07/22', 'dd/mm/yy'), '12.00 pm', null, 112);

INSERT INTO Appointment
VALUES(10004, 1004, 1105, to_date('14/07/22', 'dd/mm/yy'), '05.00 pm', null, 114);

INSERT INTO Appointment
VALUES(10005, 1006, 1109, to_date('18/07/22', 'dd/mm/yy'), '10.00 am', 'Rash on Skin', 119);

INSERT INTO Appointment
VALUES(10006, 1010, 1112, to_date('20/07/22', 'dd/mm/yy'), '11.00 am', null, 120);

INSERT INTO Appointment
VALUES(10007, 1009, 1111, to_date('15/07/22', 'dd/mm/yy'), '09.00 am', null, 118);

INSERT INTO Appointment
VALUES(10008, 1008, 1107, to_date('13/07/22', 'dd/mm/yy'), '01.00 pm', null, 112);

INSERT INTO Appointment
VALUES(10009, 1002, 1103, to_date('14/07/22', 'dd/mm/yy'), '10.00 am', null, 111);

INSERT INTO Appointment
VALUES(10010, 1005, 1108, to_date('10/07/22', 'dd/mm/yy'), '11.00 am', 'Diabates', 114);

----------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM VET;
SELECT * FROM Owner;
SELECT * FROM Pet;
SELECT * FROM Pet_Condition;
SELECT * FROM Appointment;
-----------------------------------------------------------------------------------------------------------------------------------------------

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


 




