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

