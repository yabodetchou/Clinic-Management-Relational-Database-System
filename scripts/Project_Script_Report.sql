-- ============================================================
-- INFO605 | Group 4 | Clinic Management Database System
-- Combined Project Code Script
-- ============================================================

-- ============================================================
-- SECTION A: DDL / DATABASE BUILD
-- Purpose: Create all tables in dependency order.
-- ============================================================

DROP TABLE Appointment_Medication       CASCADE CONSTRAINTS;
DROP TABLE Appointment_MedicalCondition CASCADE CONSTRAINTS;
DROP TABLE Billing                      CASCADE CONSTRAINTS;
DROP TABLE Appointment                  CASCADE CONSTRAINTS;
DROP TABLE Patient                      CASCADE CONSTRAINTS;
DROP TABLE Doctor                       CASCADE CONSTRAINTS;
DROP TABLE Hospital                     CASCADE CONSTRAINTS;
DROP TABLE MedicalCondition             CASCADE CONSTRAINTS;
DROP TABLE Medication                   CASCADE CONSTRAINTS;
DROP TABLE InsuranceProvider            CASCADE CONSTRAINTS;

CREATE TABLE Patient (
    patientID NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    age NUMBER(3) NOT NULL,
    gender VARCHAR2(10) NOT NULL CHECK (gender IN ('Male','Female')),
    bloodType VARCHAR2(3) NOT NULL CHECK (bloodType IN ('A+','A-','B+','B-','AB+','AB-','O+','O-'))
);

CREATE TABLE Doctor (
    doctorID NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    specialty VARCHAR2(100) NOT NULL,
    licenseNumber VARCHAR2(20) NOT NULL,
    phoneNumber VARCHAR2(20)
);

CREATE TABLE Hospital (
    hospitalID NUMBER PRIMARY KEY,
    hospitalName VARCHAR2(150) NOT NULL
);

CREATE TABLE MedicalCondition (
    conditionID NUMBER PRIMARY KEY,
    conditionName VARCHAR2(100) NOT NULL
);

CREATE TABLE Medication (
    medicationID NUMBER PRIMARY KEY,
    medicationName VARCHAR2(100) NOT NULL
);

CREATE TABLE InsuranceProvider (
    providerID NUMBER PRIMARY KEY,
    providerName VARCHAR2(100) NOT NULL
);

CREATE TABLE Appointment (
    appointmentID NUMBER PRIMARY KEY,
    appointmentType VARCHAR2(20) NOT NULL CHECK (appointmentType IN ('Urgent','Emergency','Elective')),
    roomNumber NUMBER(5) NOT NULL,
    appointmentDate DATE NOT NULL,
    dischargeDate DATE,
    patientID NUMBER REFERENCES Patient(patientID),
    doctorID NUMBER REFERENCES Doctor(doctorID),
    hospitalID NUMBER REFERENCES Hospital(hospitalID)
);

CREATE TABLE Billing (
    billingID NUMBER PRIMARY KEY,
    billingAmount NUMBER(10,2) NOT NULL,
    billingDate DATE NOT NULL,
    appointmentID NUMBER REFERENCES Appointment(appointmentID),
    providerID NUMBER REFERENCES InsuranceProvider(providerID)
);

CREATE TABLE Appointment_MedicalCondition (
    appointmentID NUMBER REFERENCES Appointment(appointmentID),
    conditionID NUMBER REFERENCES MedicalCondition(conditionID),
    PRIMARY KEY (appointmentID, conditionID)
);

CREATE TABLE Appointment_Medication (
    appointmentID NUMBER REFERENCES Appointment(appointmentID),
    medicationID NUMBER REFERENCES Medication(medicationID),
    PRIMARY KEY (appointmentID, medicationID)
);

-- ============================================================
-- SECTION B: DATA POPULATION / INSERT STATEMENTS
-- ============================================================

-- ------------------------------------------------------------
-- Member: Prosper Bowman
-- Drexel ID: 14839280
-- Contribution: Patient and Doctor data population
-- ------------------------------------------------------------

INSERT INTO Patient VALUES (1,'Bobby Jackson',30,'Male','B-');
INSERT INTO Patient VALUES (2,'Leslie Terry',62,'Male','A+');
INSERT INTO Patient VALUES (3,'Danny Smith',76,'Female','A-');
INSERT INTO Patient VALUES (4,'Andrew Watts',28,'Female','O+');
INSERT INTO Patient VALUES (5,'Adrienne Bell',43,'Female','AB+');
INSERT INTO Patient VALUES (6,'Emily Johnson',36,'Male','A+');
INSERT INTO Patient VALUES (7,'Edward Edwards',21,'Female','AB-');
INSERT INTO Patient VALUES (8,'Christina Martinez',20,'Female','A+');
INSERT INTO Patient VALUES (9,'Jasmine Aguilar',82,'Male','AB+');
INSERT INTO Patient VALUES (10,'Christopher Berg',58,'Female','AB-');
INSERT INTO Patient VALUES (11,'Michelle Daniels',72,'Male','O+');
INSERT INTO Patient VALUES (12,'Aaron Martinez',38,'Female','A-');
INSERT INTO Patient VALUES (13,'Connor Hansen',75,'Female','A+');
INSERT INTO Patient VALUES (14,'Robert Bauer',68,'Female','AB+');
INSERT INTO Patient VALUES (15,'Brooke Brady',44,'Female','AB+');
INSERT INTO Patient VALUES (16,'Natalie Gamble',46,'Female','AB-');
INSERT INTO Patient VALUES (17,'Haley Perkins',63,'Female','A+');
INSERT INTO Patient VALUES (18,'Jamie Campbell',38,'Male','AB-');
INSERT INTO Patient VALUES (19,'Luke Burgess',34,'Female','A-');
INSERT INTO Patient VALUES (20,'Daniel Schmidt',63,'Male','B+');
INSERT INTO Patient VALUES (21,'Timothy Burns',67,'Female','A-');
INSERT INTO Patient VALUES (22,'Christopher Bright',48,'Male','B+');
INSERT INTO Patient VALUES (23,'Kathryn Stewart',58,'Female','O+');
INSERT INTO Patient VALUES (24,'Eileen Thompson',59,'Male','A+');
INSERT INTO Patient VALUES (25,'Paul Henderson',72,'Female','AB+');
COMMIT;

INSERT INTO Patient VALUES (26,'Peter Fitzgerald',73,'Male','AB+');
INSERT INTO Patient VALUES (27,'Cathy Small',51,'Female','O-');
INSERT INTO Patient VALUES (28,'Kenneth Moore',34,'Female','A+');
INSERT INTO Patient VALUES (29,'Mary Hunter',38,'Female','O-');
INSERT INTO Patient VALUES (30,'Joshua Oliver',63,'Female','B+');
INSERT INTO Patient VALUES (31,'Thomas Martinez',34,'Male','B-');
INSERT INTO Patient VALUES (32,'James Patterson',23,'Female','A+');
INSERT INTO Patient VALUES (33,'William Cooper',78,'Male','AB-');
INSERT INTO Patient VALUES (34,'Erin Ortega',43,'Male','AB-');
INSERT INTO Patient VALUES (35,'Nicole Rodriguez',30,'Female','AB+');
INSERT INTO Patient VALUES (36,'David Anderson',25,'Female','AB+');
INSERT INTO Patient VALUES (37,'Denise Torres',33,'Male','AB+');
INSERT INTO Patient VALUES (38,'Cassandra Robinson',26,'Female','B-');
INSERT INTO Patient VALUES (39,'Nicole Lucero',70,'Female','O-');
INSERT INTO Patient VALUES (40,'Pamela Fernandez',57,'Female','B-');
INSERT INTO Patient VALUES (41,'Christopher Lee',74,'Female','B-');
INSERT INTO Patient VALUES (42,'Thomas Morse',81,'Male','A+');
INSERT INTO Patient VALUES (43,'Eric Lane',49,'Female','A-');
INSERT INTO Patient VALUES (44,'Katherine Smith',26,'Female','AB+');
INSERT INTO Patient VALUES (45,'Paul Williams',81,'Female','AB-');
INSERT INTO Patient VALUES (46,'Lynn Martinez',65,'Male','O+');
INSERT INTO Patient VALUES (47,'Christopher Chapman',31,'Female','O+');
INSERT INTO Patient VALUES (48,'Chris Frye',58,'Male','A-');
INSERT INTO Patient VALUES (49,'Kyle Bennett',22,'Male','O+');
INSERT INTO Patient VALUES (50,'Brandon Collins',77,'Female','O+');
COMMIT;

INSERT INTO Doctor VALUES (1,'Matthew Smith','Oncology','LIC-10001','267-501-1001');
INSERT INTO Doctor VALUES (2,'Samantha Davies','Endocrinology','LIC-10002','610-502-1002');
INSERT INTO Doctor VALUES (3,'Tiffany Mitchell','Bariatric Medicine','LIC-10003','484-503-1003');
INSERT INTO Doctor VALUES (4,'Kevin Wells','Endocrinology','LIC-10004','302-504-1004');
INSERT INTO Doctor VALUES (5,'Kathleen Hanna','Surgical Oncology','LIC-10005','215-505-1005');
INSERT INTO Doctor VALUES (6,'Taylor Newton','Pulmonology','LIC-10006','267-506-1006');
INSERT INTO Doctor VALUES (7,'Kelly Olson','Internal Medicine','LIC-10007','610-507-1007');
INSERT INTO Doctor VALUES (8,'Suzanne Thomas','Radiation Oncology','LIC-10008','484-508-1008');
INSERT INTO Doctor VALUES (9,'Daniel Ferguson','Allergy and Immunology','LIC-10009','302-509-1009');
INSERT INTO Doctor VALUES (10,'Heather Day','Oncology','LIC-10010','215-510-1010');
INSERT INTO Doctor VALUES (11,'John Duncan','Surgical Oncology','LIC-10011','267-511-1011');
INSERT INTO Doctor VALUES (12,'Douglas Mayo','Cardiology','LIC-10012','610-512-1012');
INSERT INTO Doctor VALUES (13,'Kenneth Fletcher','Nephrology','LIC-10013','484-513-1013');
INSERT INTO Doctor VALUES (14,'Theresa Freeman','Internal Medicine','LIC-10014','302-514-1014');
INSERT INTO Doctor VALUES (15,'Roberta Stewart','Radiation Oncology','LIC-10015','215-515-1015');
INSERT INTO Doctor VALUES (16,'Maria Dougherty','Internal Medicine','LIC-10016','267-516-1016');
INSERT INTO Doctor VALUES (17,'Erica Spencer','Rheumatology','LIC-10017','610-517-1017');
INSERT INTO Doctor VALUES (18,'Justin Kim','Endocrinology','LIC-10018','484-518-1018');
INSERT INTO Doctor VALUES (19,'Justin Moore Jr.','Internal Medicine','LIC-10019','302-519-1019');
INSERT INTO Doctor VALUES (20,'Denise Galloway','Pulmonology','LIC-10020','215-520-1020');
INSERT INTO Doctor VALUES (21,'Krista Smith','Allergy and Immunology','LIC-10021','267-521-1021');
INSERT INTO Doctor VALUES (22,'Gregory Smith','Internal Medicine','LIC-10022','610-522-1022');
INSERT INTO Doctor VALUES (23,'Vanessa Newton','Orthopedics','LIC-10023','484-523-1023');
INSERT INTO Doctor VALUES (24,'Donna Martinez MD','Pulmonology','LIC-10024','302-524-1024');
INSERT INTO Doctor VALUES (25,'Stephanie Kramer','Nephrology','LIC-10025','215-525-1025');
COMMIT;

INSERT INTO Doctor VALUES (26,'Angela Contreras','Bariatric Medicine','LIC-10026','267-526-1026');
INSERT INTO Doctor VALUES (27,'Wendy Glenn','Allergy and Immunology','LIC-10027','610-527-1027');
INSERT INTO Doctor VALUES (28,'James Ellis','Endocrinology','LIC-10028','484-528-1028');
INSERT INTO Doctor VALUES (29,'Jared Bruce Jr.','Cardiology','LIC-10029','302-529-1029');
INSERT INTO Doctor VALUES (30,'Brandy Mitchell','Internal Medicine','LIC-10030','215-530-1030');
INSERT INTO Doctor VALUES (31,'Jacob Huynh','Internal Medicine','LIC-10031','267-531-1031');
INSERT INTO Doctor VALUES (32,'Kristina Frazier','Physical Medicine','LIC-10032','610-532-1032');
INSERT INTO Doctor VALUES (33,'John Hartman','Rheumatology','LIC-10033','484-533-1033');
INSERT INTO Doctor VALUES (34,'Heather Garcia','Oncology','LIC-10034','302-534-1034');
INSERT INTO Doctor VALUES (35,'Lynn Young','Internal Medicine','LIC-10035','215-535-1035');
INSERT INTO Doctor VALUES (36,'Emma Allison','Pulmonology','LIC-10036','267-536-1036');
INSERT INTO Doctor VALUES (37,'Laura Myers','Nephrology','LIC-10037','610-537-1037');
INSERT INTO Doctor VALUES (38,'Travis Parsons','Nephrology','LIC-10038','484-538-1038');
INSERT INTO Doctor VALUES (39,'Christine Johnson','Endocrinology','LIC-10039','302-539-1039');
INSERT INTO Doctor VALUES (40,'Emily Taylor','Internal Medicine','LIC-10040','215-540-1040');
INSERT INTO Doctor VALUES (41,'William Reynolds','Cardiology','LIC-10041','267-541-1041');
INSERT INTO Doctor VALUES (42,'Jennifer Carter','Internal Medicine','LIC-10042','610-542-1042');
INSERT INTO Doctor VALUES (43,'Matthew Thomas','Allergy and Immunology','LIC-10043','484-543-1043');
INSERT INTO Doctor VALUES (44,'Mary Logan','Endocrinology','LIC-10044','302-544-1044');
INSERT INTO Doctor VALUES (45,'Kristin Martinez','Surgical Oncology','LIC-10045','215-545-1045');
INSERT INTO Doctor VALUES (46,'Daniel Murphy','Radiation Oncology','LIC-10046','267-546-1046');
INSERT INTO Doctor VALUES (47,'Emily Patterson','Nephrology','LIC-10047','610-547-1047');
INSERT INTO Doctor VALUES (48,'Heather Smith','Internal Medicine','LIC-10048','484-548-1048');
INSERT INTO Doctor VALUES (49,'John Smith','Cardiology','LIC-10049','302-549-1049');
INSERT INTO Doctor VALUES (50,'Cameron Young','Internal Medicine','LIC-10050','215-550-1050');
COMMIT;

-- ------------------------------------------------------------
-- Member: Yabo Detchou
-- Drexel ID: 14265881
-- Contribution: Hospital and Appointment data population
-- ------------------------------------------------------------

INSERT INTO Hospital VALUES (1,'Sons and Miller');
INSERT INTO Hospital VALUES (2,'Kim Inc');
INSERT INTO Hospital VALUES (3,'Cook PLC');
INSERT INTO Hospital VALUES (4,'Hernandez Rogers and Vang,');
INSERT INTO Hospital VALUES (5,'White-White');
INSERT INTO Hospital VALUES (6,'Nunez-Humphrey');
INSERT INTO Hospital VALUES (7,'Group Middleton');
INSERT INTO Hospital VALUES (8,'Powell Robinson and Valdez,');
INSERT INTO Hospital VALUES (9,'Sons Rich and');
INSERT INTO Hospital VALUES (10,'Padilla-Walker');
INSERT INTO Hospital VALUES (11,'Schaefer-Porter');
INSERT INTO Hospital VALUES (12,'Lyons-Blair');
INSERT INTO Hospital VALUES (13,'Powers Miller, and Flores');
INSERT INTO Hospital VALUES (14,'Rivera-Gutierrez');
INSERT INTO Hospital VALUES (15,'Morris-Arellano');
INSERT INTO Hospital VALUES (16,'Cline-Williams');
INSERT INTO Hospital VALUES (17,'Cervantes-Wells');
INSERT INTO Hospital VALUES (18,'Torres, and Harrison Jones');
INSERT INTO Hospital VALUES (19,'Houston PLC');
INSERT INTO Hospital VALUES (20,'Hammond Ltd');
INSERT INTO Hospital VALUES (21,'Jones LLC');
INSERT INTO Hospital VALUES (22,'Williams-Davis');
INSERT INTO Hospital VALUES (23,'Clark-Mayo');
INSERT INTO Hospital VALUES (24,'and Sons Smith');
INSERT INTO Hospital VALUES (25,'Wilson Group');
COMMIT;

INSERT INTO Hospital VALUES (26,'Garner-Bowman');
INSERT INTO Hospital VALUES (27,'Brown, and Jones Weaver');
INSERT INTO Hospital VALUES (28,'Serrano-Dixon');
INSERT INTO Hospital VALUES (29,'Gardner-Miller');
INSERT INTO Hospital VALUES (30,'Guerrero-Boone');
INSERT INTO Hospital VALUES (31,'Hart Ltd');
INSERT INTO Hospital VALUES (32,'Cruz-Santiago');
INSERT INTO Hospital VALUES (33,'Group Duncan');
INSERT INTO Hospital VALUES (34,'Lopez-Phillips');
INSERT INTO Hospital VALUES (35,'Poole Inc');
INSERT INTO Hospital VALUES (36,'Sons and Cox');
INSERT INTO Hospital VALUES (37,'LLC Martin');
INSERT INTO Hospital VALUES (38,'Espinoza-Stone');
INSERT INTO Hospital VALUES (39,'and Garcia Morris Cunningham,');
INSERT INTO Hospital VALUES (40,'Walton-Meyer');
INSERT INTO Hospital VALUES (41,'PLC Young');
INSERT INTO Hospital VALUES (42,'Meadows Group');
INSERT INTO Hospital VALUES (43,'and Howell Brooks, Rogers');
INSERT INTO Hospital VALUES (44,'and Mcclure White Boone,');
INSERT INTO Hospital VALUES (45,'Gates Brown, and Stuart');
INSERT INTO Hospital VALUES (46,'Group Armstrong');
INSERT INTO Hospital VALUES (47,'Ltd Schwartz');
INSERT INTO Hospital VALUES (48,'Nelson-Phillips');
INSERT INTO Hospital VALUES (49,'Knight and Nguyen, Riggs');
INSERT INTO Hospital VALUES (50,'Lopez PLC');
COMMIT;

INSERT INTO Appointment VALUES (1,'Urgent',328,TO_DATE('2024-01-31','YYYY-MM-DD'),NULL,1,1,1);
INSERT INTO Appointment VALUES (2,'Emergency',265,TO_DATE('2019-08-20','YYYY-MM-DD'),TO_DATE('2019-08-26','YYYY-MM-DD'),2,2,2);
INSERT INTO Appointment VALUES (3,'Emergency',205,TO_DATE('2022-09-22','YYYY-MM-DD'),TO_DATE('2022-10-07','YYYY-MM-DD'),3,3,3);
INSERT INTO Appointment VALUES (4,'Elective',450,TO_DATE('2020-11-18','YYYY-MM-DD'),TO_DATE('2020-12-18','YYYY-MM-DD'),4,4,4);
INSERT INTO Appointment VALUES (5,'Urgent',458,TO_DATE('2022-09-19','YYYY-MM-DD'),TO_DATE('2022-10-09','YYYY-MM-DD'),5,5,5);
INSERT INTO Appointment VALUES (6,'Urgent',389,TO_DATE('2023-12-20','YYYY-MM-DD'),NULL,6,6,6);
INSERT INTO Appointment VALUES (7,'Emergency',389,TO_DATE('2020-11-03','YYYY-MM-DD'),TO_DATE('2020-11-15','YYYY-MM-DD'),7,7,7);
INSERT INTO Appointment VALUES (8,'Emergency',277,TO_DATE('2021-12-28','YYYY-MM-DD'),TO_DATE('2022-01-07','YYYY-MM-DD'),8,8,8);
INSERT INTO Appointment VALUES (9,'Elective',316,TO_DATE('2020-07-01','YYYY-MM-DD'),TO_DATE('2020-07-14','YYYY-MM-DD'),9,9,9);
INSERT INTO Appointment VALUES (10,'Elective',249,TO_DATE('2021-05-23','YYYY-MM-DD'),TO_DATE('2021-06-22','YYYY-MM-DD'),10,10,10);
INSERT INTO Appointment VALUES (11,'Urgent',394,TO_DATE('2020-04-19','YYYY-MM-DD'),TO_DATE('2020-04-22','YYYY-MM-DD'),11,11,11);
INSERT INTO Appointment VALUES (12,'Urgent',288,TO_DATE('2023-08-13','YYYY-MM-DD'),TO_DATE('2023-09-05','YYYY-MM-DD'),12,12,12);
INSERT INTO Appointment VALUES (13,'Emergency',134,TO_DATE('2019-12-12','YYYY-MM-DD'),TO_DATE('2019-12-28','YYYY-MM-DD'),13,13,13);
INSERT INTO Appointment VALUES (14,'Urgent',309,TO_DATE('2020-05-22','YYYY-MM-DD'),TO_DATE('2020-06-19','YYYY-MM-DD'),14,14,14);
INSERT INTO Appointment VALUES (15,'Urgent',182,TO_DATE('2021-10-08','YYYY-MM-DD'),TO_DATE('2021-10-13','YYYY-MM-DD'),15,15,15);
INSERT INTO Appointment VALUES (16,'Elective',465,TO_DATE('2023-01-01','YYYY-MM-DD'),TO_DATE('2023-01-11','YYYY-MM-DD'),16,16,16);
INSERT INTO Appointment VALUES (17,'Elective',114,TO_DATE('2020-06-23','YYYY-MM-DD'),TO_DATE('2020-07-14','YYYY-MM-DD'),17,17,17);
INSERT INTO Appointment VALUES (18,'Urgent',449,TO_DATE('2020-03-08','YYYY-MM-DD'),TO_DATE('2020-04-02','YYYY-MM-DD'),18,18,18);
INSERT INTO Appointment VALUES (19,'Elective',260,TO_DATE('2021-03-04','YYYY-MM-DD'),TO_DATE('2021-03-14','YYYY-MM-DD'),19,19,19);
INSERT INTO Appointment VALUES (20,'Elective',465,TO_DATE('2022-11-15','YYYY-MM-DD'),TO_DATE('2022-11-22','YYYY-MM-DD'),20,20,20);
INSERT INTO Appointment VALUES (21,'Elective',115,TO_DATE('2023-06-28','YYYY-MM-DD'),TO_DATE('2023-07-02','YYYY-MM-DD'),21,21,21);
INSERT INTO Appointment VALUES (22,'Urgent',295,TO_DATE('2020-01-21','YYYY-MM-DD'),TO_DATE('2020-02-09','YYYY-MM-DD'),22,22,22);
INSERT INTO Appointment VALUES (23,'Urgent',327,TO_DATE('2022-05-12','YYYY-MM-DD'),TO_DATE('2022-06-10','YYYY-MM-DD'),23,23,23);
INSERT INTO Appointment VALUES (24,'Urgent',119,TO_DATE('2021-08-02','YYYY-MM-DD'),TO_DATE('2021-08-12','YYYY-MM-DD'),24,24,24);
INSERT INTO Appointment VALUES (25,'Emergency',109,TO_DATE('2020-05-15','YYYY-MM-DD'),TO_DATE('2020-06-08','YYYY-MM-DD'),25,25,25);
COMMIT;

INSERT INTO Appointment VALUES (26,'Urgent',162,TO_DATE('2020-05-15','YYYY-MM-DD'),TO_DATE('2020-05-20','YYYY-MM-DD'),26,26,26);
INSERT INTO Appointment VALUES (27,'Elective',401,TO_DATE('2023-12-23','YYYY-MM-DD'),NULL,27,27,27);
INSERT INTO Appointment VALUES (28,'Emergency',157,TO_DATE('2022-06-21','YYYY-MM-DD'),TO_DATE('2022-06-30','YYYY-MM-DD'),28,28,28);
INSERT INTO Appointment VALUES (29,'Emergency',223,TO_DATE('2021-01-03','YYYY-MM-DD'),TO_DATE('2021-01-16','YYYY-MM-DD'),29,29,29);
INSERT INTO Appointment VALUES (30,'Elective',293,TO_DATE('2023-10-03','YYYY-MM-DD'),NULL,30,30,30);
INSERT INTO Appointment VALUES (31,'Urgent',371,TO_DATE('2019-08-18','YYYY-MM-DD'),TO_DATE('2019-09-01','YYYY-MM-DD'),31,31,31);
INSERT INTO Appointment VALUES (32,'Urgent',108,TO_DATE('2019-11-03','YYYY-MM-DD'),TO_DATE('2019-11-29','YYYY-MM-DD'),32,32,32);
INSERT INTO Appointment VALUES (33,'Elective',245,TO_DATE('2023-05-18','YYYY-MM-DD'),TO_DATE('2023-06-15','YYYY-MM-DD'),33,33,33);
INSERT INTO Appointment VALUES (34,'Elective',494,TO_DATE('2023-05-24','YYYY-MM-DD'),TO_DATE('2023-06-03','YYYY-MM-DD'),34,34,34);
INSERT INTO Appointment VALUES (35,'Emergency',285,TO_DATE('2020-01-17','YYYY-MM-DD'),TO_DATE('2020-02-10','YYYY-MM-DD'),35,35,35);
INSERT INTO Appointment VALUES (36,'Elective',228,TO_DATE('2021-01-07','YYYY-MM-DD'),TO_DATE('2021-01-26','YYYY-MM-DD'),36,36,36);
INSERT INTO Appointment VALUES (37,'Urgent',481,TO_DATE('2019-10-14','YYYY-MM-DD'),TO_DATE('2019-10-19','YYYY-MM-DD'),37,37,37);
INSERT INTO Appointment VALUES (38,'Urgent',212,TO_DATE('2021-12-19','YYYY-MM-DD'),TO_DATE('2022-01-16','YYYY-MM-DD'),38,38,38);
INSERT INTO Appointment VALUES (39,'Emergency',113,TO_DATE('2022-03-12','YYYY-MM-DD'),TO_DATE('2022-03-29','YYYY-MM-DD'),39,39,39);
INSERT INTO Appointment VALUES (40,'Urgent',272,TO_DATE('2021-01-17','YYYY-MM-DD'),TO_DATE('2021-01-29','YYYY-MM-DD'),40,40,40);
INSERT INTO Appointment VALUES (41,'Emergency',478,TO_DATE('2021-09-15','YYYY-MM-DD'),TO_DATE('2021-10-05','YYYY-MM-DD'),41,41,41);
INSERT INTO Appointment VALUES (42,'Urgent',196,TO_DATE('2020-01-27','YYYY-MM-DD'),TO_DATE('2020-02-09','YYYY-MM-DD'),42,42,42);
INSERT INTO Appointment VALUES (43,'Elective',418,TO_DATE('2022-06-24','YYYY-MM-DD'),TO_DATE('2022-07-18','YYYY-MM-DD'),43,43,43);
INSERT INTO Appointment VALUES (44,'Urgent',410,TO_DATE('2021-06-09','YYYY-MM-DD'),TO_DATE('2021-07-01','YYYY-MM-DD'),44,44,44);
INSERT INTO Appointment VALUES (45,'Urgent',328,TO_DATE('2020-08-23','YYYY-MM-DD'),TO_DATE('2020-09-08','YYYY-MM-DD'),45,45,45);
INSERT INTO Appointment VALUES (46,'Emergency',300,TO_DATE('2022-10-12','YYYY-MM-DD'),TO_DATE('2022-11-02','YYYY-MM-DD'),46,46,46);
INSERT INTO Appointment VALUES (47,'Elective',211,TO_DATE('2021-12-01','YYYY-MM-DD'),TO_DATE('2021-12-09','YYYY-MM-DD'),47,47,47);
INSERT INTO Appointment VALUES (48,'Urgent',413,TO_DATE('2020-05-04','YYYY-MM-DD'),TO_DATE('2020-05-13','YYYY-MM-DD'),48,48,48);
INSERT INTO Appointment VALUES (49,'Urgent',157,TO_DATE('2023-09-09','YYYY-MM-DD'),TO_DATE('2023-09-23','YYYY-MM-DD'),49,49,49);
INSERT INTO Appointment VALUES (50,'Urgent',138,TO_DATE('2019-07-19','YYYY-MM-DD'),TO_DATE('2019-07-29','YYYY-MM-DD'),50,50,50);
COMMIT;

-- ------------------------------------------------------------
-- Member: Chris Karpuk
-- Drexel ID: 14763114
-- Contribution: InsuranceProvider and Billing data population
-- ------------------------------------------------------------

INSERT INTO InsuranceProvider VALUES (1,'Aetna');
INSERT INTO InsuranceProvider VALUES (2,'Blue Cross');
INSERT INTO InsuranceProvider VALUES (3,'Cigna');
INSERT INTO InsuranceProvider VALUES (4,'Medicare');
INSERT INTO InsuranceProvider VALUES (5,'UnitedHealthcare');
COMMIT;

INSERT INTO Billing VALUES (1,18856.28,TO_DATE('2024-01-31','YYYY-MM-DD'),1,2);
INSERT INTO Billing VALUES (2,33643.33,TO_DATE('2019-08-26','YYYY-MM-DD'),2,4);
INSERT INTO Billing VALUES (3,27955.1,TO_DATE('2022-10-07','YYYY-MM-DD'),3,1);
INSERT INTO Billing VALUES (4,37909.78,TO_DATE('2020-12-18','YYYY-MM-DD'),4,4);
INSERT INTO Billing VALUES (5,14238.32,TO_DATE('2022-10-09','YYYY-MM-DD'),5,1);
INSERT INTO Billing VALUES (6,48145.11,TO_DATE('2023-12-20','YYYY-MM-DD'),6,5);
INSERT INTO Billing VALUES (7,19580.87,TO_DATE('2020-11-15','YYYY-MM-DD'),7,4);
INSERT INTO Billing VALUES (8,45820.46,TO_DATE('2022-01-07','YYYY-MM-DD'),8,3);
INSERT INTO Billing VALUES (9,50119.22,TO_DATE('2020-07-14','YYYY-MM-DD'),9,3);
INSERT INTO Billing VALUES (10,19784.63,TO_DATE('2021-06-22','YYYY-MM-DD'),10,5);
INSERT INTO Billing VALUES (11,12576.8,TO_DATE('2020-04-22','YYYY-MM-DD'),11,4);
INSERT INTO Billing VALUES (12,7999.59,TO_DATE('2023-09-05','YYYY-MM-DD'),12,4);
INSERT INTO Billing VALUES (13,43282.28,TO_DATE('2019-12-28','YYYY-MM-DD'),13,3);
INSERT INTO Billing VALUES (14,33207.71,TO_DATE('2020-06-19','YYYY-MM-DD'),14,5);
INSERT INTO Billing VALUES (15,40701.6,TO_DATE('2021-10-13','YYYY-MM-DD'),15,5);
INSERT INTO Billing VALUES (16,12263.36,TO_DATE('2023-01-11','YYYY-MM-DD'),16,2);
INSERT INTO Billing VALUES (17,24499.85,TO_DATE('2020-07-14','YYYY-MM-DD'),17,5);
INSERT INTO Billing VALUES (18,17440.47,TO_DATE('2020-04-02','YYYY-MM-DD'),18,3);
INSERT INTO Billing VALUES (19,18843.02,TO_DATE('2021-03-14','YYYY-MM-DD'),19,2);
INSERT INTO Billing VALUES (20,23762.2,TO_DATE('2022-11-22','YYYY-MM-DD'),20,3);
INSERT INTO Billing VALUES (21,42.51,TO_DATE('2023-07-02','YYYY-MM-DD'),21,2);
INSERT INTO Billing VALUES (22,17695.91,TO_DATE('2020-02-09','YYYY-MM-DD'),22,1);
INSERT INTO Billing VALUES (23,5998.1,TO_DATE('2022-06-10','YYYY-MM-DD'),23,1);
INSERT INTO Billing VALUES (24,25250.05,TO_DATE('2021-08-12','YYYY-MM-DD'),24,1);
INSERT INTO Billing VALUES (25,33211.3,TO_DATE('2020-06-08','YYYY-MM-DD'),25,4);
COMMIT;

INSERT INTO Billing VALUES (26,19746.83,TO_DATE('2020-05-20','YYYY-MM-DD'),26,4);
INSERT INTO Billing VALUES (27,26786.53,TO_DATE('2023-12-23','YYYY-MM-DD'),27,2);
INSERT INTO Billing VALUES (28,18834.8,TO_DATE('2022-06-30','YYYY-MM-DD'),28,5);
INSERT INTO Billing VALUES (29,32643.3,TO_DATE('2021-01-16','YYYY-MM-DD'),29,3);
INSERT INTO Billing VALUES (30,5767.01,TO_DATE('2023-10-03','YYYY-MM-DD'),30,1);
INSERT INTO Billing VALUES (31,47909.13,TO_DATE('2019-09-01','YYYY-MM-DD'),31,3);
INSERT INTO Billing VALUES (32,25835.32,TO_DATE('2019-11-29','YYYY-MM-DD'),32,5);
INSERT INTO Billing VALUES (33,17993.23,TO_DATE('2023-06-15','YYYY-MM-DD'),33,4);
INSERT INTO Billing VALUES (34,21185.95,TO_DATE('2023-06-03','YYYY-MM-DD'),34,4);
INSERT INTO Billing VALUES (35,8408.95,TO_DATE('2020-02-10','YYYY-MM-DD'),35,2);
INSERT INTO Billing VALUES (36,45453.42,TO_DATE('2021-01-26','YYYY-MM-DD'),36,4);
INSERT INTO Billing VALUES (37,4397.78,TO_DATE('2019-10-19','YYYY-MM-DD'),37,1);
INSERT INTO Billing VALUES (38,9380.33,TO_DATE('2022-01-16','YYYY-MM-DD'),38,1);
INSERT INTO Billing VALUES (39,48290.69,TO_DATE('2022-03-29','YYYY-MM-DD'),39,3);
INSERT INTO Billing VALUES (40,32973.94,TO_DATE('2021-01-29','YYYY-MM-DD'),40,4);
INSERT INTO Billing VALUES (41,49943.28,TO_DATE('2021-10-05','YYYY-MM-DD'),41,3);
INSERT INTO Billing VALUES (42,35633.96,TO_DATE('2020-02-09','YYYY-MM-DD'),42,3);
INSERT INTO Billing VALUES (43,25966.33,TO_DATE('2022-07-18','YYYY-MM-DD'),43,3);
INSERT INTO Billing VALUES (44,21784.45,TO_DATE('2021-07-01','YYYY-MM-DD'),44,5);
INSERT INTO Billing VALUES (45,42684.56,TO_DATE('2020-09-08','YYYY-MM-DD'),45,4);
INSERT INTO Billing VALUES (46,45585.89,TO_DATE('2022-11-02','YYYY-MM-DD'),46,4);
INSERT INTO Billing VALUES (47,29615.44,TO_DATE('2021-12-09','YYYY-MM-DD'),47,3);
INSERT INTO Billing VALUES (48,36992.27,TO_DATE('2020-05-13','YYYY-MM-DD'),48,3);
INSERT INTO Billing VALUES (49,28051.5,TO_DATE('2023-09-23','YYYY-MM-DD'),49,5);
INSERT INTO Billing VALUES (50,16320.23,TO_DATE('2019-07-29','YYYY-MM-DD'),50,3);
COMMIT;

-- ------------------------------------------------------------
-- Member: Nick Sichani
-- Drexel ID: 14843547
-- Contribution: MedicalCondition and Appointment_MedicalCondition data population
-- ------------------------------------------------------------

INSERT INTO MedicalCondition VALUES (1,'Arthritis');
INSERT INTO MedicalCondition VALUES (2,'Asthma');
INSERT INTO MedicalCondition VALUES (3,'Cancer');
INSERT INTO MedicalCondition VALUES (4,'Diabetes');
INSERT INTO MedicalCondition VALUES (5,'Hypertension');
INSERT INTO MedicalCondition VALUES (6,'Obesity');
COMMIT;

INSERT INTO Appointment_MedicalCondition VALUES (1,3);
INSERT INTO Appointment_MedicalCondition VALUES (2,6);
INSERT INTO Appointment_MedicalCondition VALUES (3,6);
INSERT INTO Appointment_MedicalCondition VALUES (4,4);
INSERT INTO Appointment_MedicalCondition VALUES (5,3);
INSERT INTO Appointment_MedicalCondition VALUES (6,2);
INSERT INTO Appointment_MedicalCondition VALUES (7,4);
INSERT INTO Appointment_MedicalCondition VALUES (8,3);
INSERT INTO Appointment_MedicalCondition VALUES (9,2);
INSERT INTO Appointment_MedicalCondition VALUES (10,3);
INSERT INTO Appointment_MedicalCondition VALUES (11,3);
INSERT INTO Appointment_MedicalCondition VALUES (12,5);
INSERT INTO Appointment_MedicalCondition VALUES (13,4);
INSERT INTO Appointment_MedicalCondition VALUES (14,2);
INSERT INTO Appointment_MedicalCondition VALUES (15,3);
INSERT INTO Appointment_MedicalCondition VALUES (16,6);
INSERT INTO Appointment_MedicalCondition VALUES (17,1);
INSERT INTO Appointment_MedicalCondition VALUES (18,6);
INSERT INTO Appointment_MedicalCondition VALUES (19,5);
INSERT INTO Appointment_MedicalCondition VALUES (20,2);
INSERT INTO Appointment_MedicalCondition VALUES (21,2);
INSERT INTO Appointment_MedicalCondition VALUES (22,2);
INSERT INTO Appointment_MedicalCondition VALUES (23,1);
INSERT INTO Appointment_MedicalCondition VALUES (24,2);
INSERT INTO Appointment_MedicalCondition VALUES (25,5);
COMMIT;

INSERT INTO Appointment_MedicalCondition VALUES (26,6);
INSERT INTO Appointment_MedicalCondition VALUES (27,2);
INSERT INTO Appointment_MedicalCondition VALUES (28,4);
INSERT INTO Appointment_MedicalCondition VALUES (29,5);
INSERT INTO Appointment_MedicalCondition VALUES (30,5);
INSERT INTO Appointment_MedicalCondition VALUES (31,2);
INSERT INTO Appointment_MedicalCondition VALUES (32,1);
INSERT INTO Appointment_MedicalCondition VALUES (33,1);
INSERT INTO Appointment_MedicalCondition VALUES (34,3);
INSERT INTO Appointment_MedicalCondition VALUES (35,4);
INSERT INTO Appointment_MedicalCondition VALUES (36,2);
INSERT INTO Appointment_MedicalCondition VALUES (37,4);
INSERT INTO Appointment_MedicalCondition VALUES (38,5);
INSERT INTO Appointment_MedicalCondition VALUES (39,4);
INSERT INTO Appointment_MedicalCondition VALUES (40,6);
INSERT INTO Appointment_MedicalCondition VALUES (41,5);
INSERT INTO Appointment_MedicalCondition VALUES (42,5);
INSERT INTO Appointment_MedicalCondition VALUES (43,2);
INSERT INTO Appointment_MedicalCondition VALUES (44,6);
INSERT INTO Appointment_MedicalCondition VALUES (45,3);
INSERT INTO Appointment_MedicalCondition VALUES (46,3);
INSERT INTO Appointment_MedicalCondition VALUES (47,5);
INSERT INTO Appointment_MedicalCondition VALUES (48,4);
INSERT INTO Appointment_MedicalCondition VALUES (49,5);
INSERT INTO Appointment_MedicalCondition VALUES (50,2);
COMMIT;

INSERT INTO Appointment_MedicalCondition VALUES (1,5);
INSERT INTO Appointment_MedicalCondition VALUES (2,5);
INSERT INTO Appointment_MedicalCondition VALUES (3,1);
INSERT INTO Appointment_MedicalCondition VALUES (4,5);
INSERT INTO Appointment_MedicalCondition VALUES (5,2);
INSERT INTO Appointment_MedicalCondition VALUES (6,6);
INSERT INTO Appointment_MedicalCondition VALUES (7,6);
INSERT INTO Appointment_MedicalCondition VALUES (8,4);
INSERT INTO Appointment_MedicalCondition VALUES (9,5);
INSERT INTO Appointment_MedicalCondition VALUES (10,4);
INSERT INTO Appointment_MedicalCondition VALUES (11,4);
INSERT INTO Appointment_MedicalCondition VALUES (12,3);
INSERT INTO Appointment_MedicalCondition VALUES (13,5);
INSERT INTO Appointment_MedicalCondition VALUES (14,1);
INSERT INTO Appointment_MedicalCondition VALUES (15,2);
COMMIT;

-- ------------------------------------------------------------
-- Member: Ahmed Syed
-- Drexel ID: 14421663
-- Contribution: Medication and Appointment_Medication data population
-- ------------------------------------------------------------

INSERT INTO Medication VALUES (1,'Aspirin');
INSERT INTO Medication VALUES (2,'Ibuprofen');
INSERT INTO Medication VALUES (3,'Lipitor');
INSERT INTO Medication VALUES (4,'Paracetamol');
INSERT INTO Medication VALUES (5,'Penicillin');
COMMIT;

INSERT INTO Appointment_Medication VALUES (1,4);
INSERT INTO Appointment_Medication VALUES (2,2);
INSERT INTO Appointment_Medication VALUES (3,1);
INSERT INTO Appointment_Medication VALUES (4,2);
INSERT INTO Appointment_Medication VALUES (5,5);
INSERT INTO Appointment_Medication VALUES (6,2);
INSERT INTO Appointment_Medication VALUES (7,4);
INSERT INTO Appointment_Medication VALUES (8,4);
INSERT INTO Appointment_Medication VALUES (9,1);
INSERT INTO Appointment_Medication VALUES (10,4);
INSERT INTO Appointment_Medication VALUES (11,4);
INSERT INTO Appointment_Medication VALUES (12,3);
INSERT INTO Appointment_Medication VALUES (13,5);
INSERT INTO Appointment_Medication VALUES (14,3);
INSERT INTO Appointment_Medication VALUES (15,4);
INSERT INTO Appointment_Medication VALUES (16,1);
INSERT INTO Appointment_Medication VALUES (17,4);
INSERT INTO Appointment_Medication VALUES (18,4);
INSERT INTO Appointment_Medication VALUES (19,1);
INSERT INTO Appointment_Medication VALUES (20,5);
INSERT INTO Appointment_Medication VALUES (21,1);
INSERT INTO Appointment_Medication VALUES (22,3);
INSERT INTO Appointment_Medication VALUES (23,3);
INSERT INTO Appointment_Medication VALUES (24,3);
INSERT INTO Appointment_Medication VALUES (25,4);
COMMIT;

INSERT INTO Appointment_Medication VALUES (26,1);
INSERT INTO Appointment_Medication VALUES (27,2);
INSERT INTO Appointment_Medication VALUES (28,3);
INSERT INTO Appointment_Medication VALUES (29,5);
INSERT INTO Appointment_Medication VALUES (30,4);
INSERT INTO Appointment_Medication VALUES (31,2);
INSERT INTO Appointment_Medication VALUES (32,5);
INSERT INTO Appointment_Medication VALUES (33,5);
INSERT INTO Appointment_Medication VALUES (34,2);
INSERT INTO Appointment_Medication VALUES (35,3);
INSERT INTO Appointment_Medication VALUES (36,3);
INSERT INTO Appointment_Medication VALUES (37,4);
INSERT INTO Appointment_Medication VALUES (38,2);
INSERT INTO Appointment_Medication VALUES (39,3);
INSERT INTO Appointment_Medication VALUES (40,5);
INSERT INTO Appointment_Medication VALUES (41,3);
INSERT INTO Appointment_Medication VALUES (42,1);
INSERT INTO Appointment_Medication VALUES (43,4);
INSERT INTO Appointment_Medication VALUES (44,4);
INSERT INTO Appointment_Medication VALUES (45,5);
INSERT INTO Appointment_Medication VALUES (46,5);
INSERT INTO Appointment_Medication VALUES (47,4);
INSERT INTO Appointment_Medication VALUES (48,1);
INSERT INTO Appointment_Medication VALUES (49,2);
INSERT INTO Appointment_Medication VALUES (50,2);
COMMIT;

INSERT INTO Appointment_Medication VALUES (1,2);
INSERT INTO Appointment_Medication VALUES (2,4);
INSERT INTO Appointment_Medication VALUES (3,5);
INSERT INTO Appointment_Medication VALUES (4,4);
INSERT INTO Appointment_Medication VALUES (5,4);
INSERT INTO Appointment_Medication VALUES (7,5);
INSERT INTO Appointment_Medication VALUES (8,2);
INSERT INTO Appointment_Medication VALUES (10,2);
INSERT INTO Appointment_Medication VALUES (11,3);
INSERT INTO Appointment_Medication VALUES (12,1);
INSERT INTO Appointment_Medication VALUES (13,2);
INSERT INTO Appointment_Medication VALUES (14,2);
INSERT INTO Appointment_Medication VALUES (15,3);
COMMIT;

-- ============================================================
-- SECTION C: DATA VERIFICATION / SECTION 7.2
-- ============================================================

SET LINESIZE 160;
SET PAGESIZE 60;
SET FEEDBACK ON;

SELECT * FROM Patient;
SELECT * FROM Doctor;
SELECT * FROM Hospital;
SELECT * FROM Appointment;
SELECT * FROM InsuranceProvider;
SELECT * FROM Billing;
SELECT * FROM MedicalCondition;
SELECT * FROM Medication;
SELECT * FROM Appointment_MedicalCondition;
SELECT * FROM Appointment_Medication;

-- ============================================================
-- SECTION D: DATA QUERIES / SECTION 8
-- ============================================================

SET LINESIZE 160;
SET PAGESIZE 60;
SET FEEDBACK ON;

COLUMN name FORMAT A25
COLUMN patient_name FORMAT A25
COLUMN doctor_name FORMAT A25
COLUMN hospitalName FORMAT A30
COLUMN providerName FORMAT A20
COLUMN conditionName FORMAT A22
COLUMN medicationName FORMAT A20
COLUMN specialty FORMAT A25

-- ------------------------------------------------------------
-- Member: Prosper Bowman
-- Drexel ID: 14839280
-- Contribution: Section 8.1 query scenarios
-- ------------------------------------------------------------

SELECT
    p.patientID,
    p.name                 AS patient_name,
    a.appointmentID,
    a.appointmentType,
    a.roomNumber,
    a.appointmentDate,
    a.dischargeDate,
    d.name                 AS doctor_name,
    h.hospitalName
FROM   Patient     p
JOIN   Appointment a  ON  p.patientID  = a.patientID
JOIN   Doctor      d  ON  a.doctorID   = d.doctorID
JOIN   Hospital    h  ON  a.hospitalID = h.hospitalID
WHERE  p.patientID = 2
ORDER  BY a.appointmentDate DESC;

SELECT
    p.patientID,
    p.name          AS patient_name,
    p.age,
    p.bloodType,
    d.name          AS doctor_name,
    d.specialty,
    h.hospitalName,
    a.appointmentDate,
    a.roomNumber
FROM   Patient     p
JOIN   Appointment a  ON  p.patientID  = a.patientID
JOIN   Doctor      d  ON  a.doctorID   = d.doctorID
JOIN   Hospital    h  ON  a.hospitalID = h.hospitalID
WHERE  a.appointmentType = 'Urgent'
ORDER  BY a.appointmentDate DESC;

SELECT
    p.patientID,
    p.name          AS patient_name,
    p.age,
    p.gender,
    p.bloodType,
    mc.conditionName,
    d.name          AS doctor_name,
    d.specialty,
    a.appointmentType,
    a.appointmentDate
FROM   Patient                       p
JOIN   Appointment                   a
         ON  p.patientID             = a.patientID
JOIN   Doctor                        d
         ON  a.doctorID              = d.doctorID
JOIN   Appointment_MedicalCondition  amc
         ON  a.appointmentID         = amc.appointmentID
JOIN   MedicalCondition              mc
         ON  amc.conditionID         = mc.conditionID
WHERE  p.age >= 60
ORDER  BY p.age DESC, a.appointmentDate DESC;

-- ------------------------------------------------------------
-- Member: Yabo Detchou
-- Drexel ID: 14265881
-- Contribution: Section 8.2 query scenarios
-- ------------------------------------------------------------

SELECT
    d.doctorID,
    d.name                 AS doctor_name,
    a.appointmentID,
    a.appointmentType,
    a.roomNumber,
    p.name                 AS patient_name,
    h.hospitalName
FROM   Doctor      d
JOIN   Appointment a  ON  d.doctorID    = a.doctorID
JOIN   Patient     p  ON  a.patientID   = p.patientID
JOIN   Hospital    h  ON  a.hospitalID  = h.hospitalID
WHERE  d.doctorID        = 14
  AND  a.appointmentDate = TO_DATE('2020-05-22','YYYY-MM-DD')
ORDER  BY a.roomNumber;

SELECT
    d.doctorID,
    d.name                      AS doctor_name,
    d.specialty,
    COUNT(a.appointmentID)      AS total_appointments
FROM   Doctor      d
LEFT JOIN Appointment a ON d.doctorID = a.doctorID
GROUP  BY d.doctorID, d.name, d.specialty
ORDER  BY total_appointments DESC;

SELECT
    d.doctorID,
    d.name                      AS doctor_name,
    d.specialty,
    mc.conditionName,
    COUNT(a.appointmentID)      AS case_count
FROM   Doctor                       d
JOIN   Appointment                  a
         ON  d.doctorID             = a.doctorID
JOIN   Appointment_MedicalCondition amc
         ON  a.appointmentID        = amc.appointmentID
JOIN   MedicalCondition             mc
         ON  amc.conditionID        = mc.conditionID
WHERE  mc.conditionName = 'Asthma'
GROUP  BY d.doctorID, d.name, d.specialty, mc.conditionName
ORDER  BY case_count DESC;

-- ------------------------------------------------------------
-- Member: Chris Karpuk
-- Drexel ID: 14763114
-- Contribution: Section 8.3 query scenarios
-- ------------------------------------------------------------

SELECT
    ip.providerID,
    ip.providerName,
    COUNT(b.billingID)              AS total_appointments_covered,
    SUM(b.billingAmount)            AS total_billed,
    ROUND(AVG(b.billingAmount),2)   AS avg_bill,
    MIN(b.billingAmount)            AS min_bill,
    MAX(b.billingAmount)            AS max_bill
FROM   InsuranceProvider ip
JOIN   Billing           b  ON  ip.providerID = b.providerID
GROUP  BY ip.providerID, ip.providerName
ORDER  BY total_billed DESC;

SELECT
    b.billingID,
    b.billingAmount,
    b.billingDate,
    a.appointmentType,
    a.appointmentDate,
    p.name              AS patient_name,
    ip.providerName
FROM   Billing           b
JOIN   Appointment       a   ON  b.appointmentID = a.appointmentID
JOIN   Patient           p   ON  a.patientID     = p.patientID
JOIN   InsuranceProvider ip  ON  b.providerID    = ip.providerID
WHERE  b.billingAmount > 40000
ORDER  BY b.billingAmount DESC;

SELECT
    h.hospitalID,
    h.hospitalName,
    COUNT(b.billingID)              AS total_appointments_billed,
    SUM(b.billingAmount)            AS total_revenue,
    ROUND(AVG(b.billingAmount),2)   AS avg_revenue_per_appointment
FROM   Hospital    h
JOIN   Appointment a  ON  h.hospitalID    = a.hospitalID
JOIN   Billing     b  ON  a.appointmentID = b.appointmentID
GROUP  BY h.hospitalID, h.hospitalName
ORDER  BY total_revenue DESC;

-- ------------------------------------------------------------
-- Member: Nick Sichani
-- Drexel ID: 14843547
-- Contribution: Section 8.4 query scenarios
-- ------------------------------------------------------------

SELECT
    mc.conditionID,
    mc.conditionName,
    COUNT(amc.appointmentID) AS diagnosis_count
FROM   MedicalCondition mc
JOIN   Appointment_MedicalCondition amc
       ON mc.conditionID = amc.conditionID
GROUP  BY mc.conditionID, mc.conditionName
ORDER  BY diagnosis_count DESC;

SELECT
    mc.conditionName,
    p.patientID,
    p.name          AS patient_name,
    p.age,
    p.gender,
    a.appointmentID,
    a.appointmentType,
    a.appointmentDate,
    a.dischargeDate
FROM   MedicalCondition              mc
JOIN   Appointment_MedicalCondition  amc
         ON  mc.conditionID   = amc.conditionID
JOIN   Appointment               a
         ON  amc.appointmentID = a.appointmentID
JOIN   Patient                   p
         ON  a.patientID       = p.patientID
WHERE  mc.conditionName = 'Cancer'
ORDER  BY a.appointmentDate DESC;

SELECT
    m.medicationID,
    m.medicationName,
    COUNT(am.appointmentID)    AS prescription_count
FROM   Medication              m
JOIN   Appointment_Medication  am
         ON  m.medicationID = am.medicationID
GROUP  BY m.medicationID, m.medicationName
ORDER  BY prescription_count DESC;

-- ------------------------------------------------------------
-- Member: Ahmed Syed
-- Drexel ID: 14421663
-- Contribution: Section 8.5 query scenarios
-- ------------------------------------------------------------

SELECT
    a.appointmentID,
    p.patientID,
    p.name              AS patient_name,
    d.name              AS doctor_name,
    h.hospitalName,
    a.appointmentType,
    a.roomNumber,
    a.appointmentDate,
    a.dischargeDate
FROM   Appointment a
JOIN   Patient     p ON a.patientID  = p.patientID
JOIN   Doctor      d ON a.doctorID   = d.doctorID
JOIN   Hospital    h ON a.hospitalID = h.hospitalID
WHERE  a.dischargeDate IS NULL
ORDER  BY a.appointmentDate DESC;

SELECT
    a.appointmentType,
    ROUND(AVG(a.dischargeDate - a.appointmentDate), 2) AS avg_length_of_stay_days,
    COUNT(*)                                           AS completed_appointments
FROM   Appointment a
WHERE  a.dischargeDate IS NOT NULL
GROUP  BY a.appointmentType
ORDER  BY avg_length_of_stay_days DESC;

SELECT
    a.appointmentID,
    p.name              AS patient_name,
    d.name              AS doctor_name,
    h.hospitalName,
    mc.conditionName,
    m.medicationName,
    a.appointmentType,
    a.appointmentDate,
    a.dischargeDate
FROM   Appointment a
JOIN   Patient p ON a.patientID = p.patientID
JOIN   Doctor d ON a.doctorID = d.doctorID
JOIN   Hospital h ON a.hospitalID = h.hospitalID
LEFT JOIN Appointment_MedicalCondition amc
       ON a.appointmentID = amc.appointmentID
LEFT JOIN MedicalCondition mc
       ON amc.conditionID = mc.conditionID
LEFT JOIN Appointment_Medication am
       ON a.appointmentID = am.appointmentID
LEFT JOIN Medication m
       ON am.medicationID = m.medicationID
WHERE  a.appointmentID = 1
ORDER  BY mc.conditionName, m.medicationName;

-- ============================================================
-- SECTION E: DATA MANIPULATION / SECTION 9
-- ============================================================

SET LINESIZE 160;
SET PAGESIZE 60;
SET FEEDBACK ON;

COLUMN name FORMAT A25
COLUMN patient_name FORMAT A25
COLUMN doctor_name FORMAT A25
COLUMN hospitalName FORMAT A30
COLUMN providerName FORMAT A20
COLUMN conditionName FORMAT A22
COLUMN medicationName FORMAT A20
COLUMN specialty FORMAT A25

-- ------------------------------------------------------------
-- Member: Prosper Bowman
-- Drexel ID: 14839280
-- Contribution: Section 9.1 UPDATE and DELETE
-- ------------------------------------------------------------

PROMPT ===== PROSPER BOWMAN | UPDATE | BEFORE =====
SELECT patientID, name, age, gender, bloodType
FROM Patient
WHERE patientID = 1;

PROMPT ===== PROSPER BOWMAN | UPDATE STATEMENT =====
UPDATE Patient
SET age = 31
WHERE patientID = 1;

COMMIT;

PROMPT ===== PROSPER BOWMAN | UPDATE | AFTER =====
SELECT patientID, name, age, gender, bloodType
FROM Patient
WHERE patientID = 1;

PROMPT ===== PROSPER BOWMAN | DELETE | BEFORE =====
SELECT appointmentID, conditionID
FROM Appointment_MedicalCondition
WHERE appointmentID = 15
ORDER BY appointmentID, conditionID;

PROMPT ===== PROSPER BOWMAN | DELETE STATEMENT =====
DELETE FROM Appointment_MedicalCondition
WHERE appointmentID = 15;

COMMIT;

PROMPT ===== PROSPER BOWMAN | DELETE | AFTER =====
SELECT appointmentID, conditionID
FROM Appointment_MedicalCondition
WHERE appointmentID = 15
ORDER BY appointmentID, conditionID;

-- ------------------------------------------------------------
-- Member: Yabo Detchou
-- Drexel ID: 14265881
-- Contribution: Section 9.2 UPDATE and DELETE
-- ------------------------------------------------------------

PROMPT ===== YABO DETCHOU | UPDATE | BEFORE =====
SELECT appointmentID, appointmentType, roomNumber, appointmentDate, dischargeDate
FROM Appointment
WHERE appointmentID = 14;

PROMPT ===== YABO DETCHOU | UPDATE STATEMENT =====
UPDATE Appointment
SET roomNumber = 310
WHERE appointmentID = 14;

COMMIT;

PROMPT ===== YABO DETCHOU | UPDATE | AFTER =====
SELECT appointmentID, appointmentType, roomNumber, appointmentDate, dischargeDate
FROM Appointment
WHERE appointmentID = 14;

PROMPT ===== YABO DETCHOU | DELETE | BEFORE =====
SELECT appointmentID, medicationID
FROM Appointment_Medication
WHERE appointmentID = 15
ORDER BY appointmentID, medicationID;

PROMPT ===== YABO DETCHOU | DELETE STATEMENT =====
DELETE FROM Appointment_Medication
WHERE appointmentID = 15;

COMMIT;

PROMPT ===== YABO DETCHOU | DELETE | AFTER =====
SELECT appointmentID, medicationID
FROM Appointment_Medication
WHERE appointmentID = 15
ORDER BY appointmentID, medicationID;

-- ------------------------------------------------------------
-- Member: Chris Karpuk
-- Drexel ID: 14763114
-- Contribution: Section 9.3 UPDATE and DELETE
-- ------------------------------------------------------------

PROMPT ===== CHRIS KARPUK | UPDATE | BEFORE =====
SELECT billingID, billingAmount, billingDate, appointmentID, providerID
FROM Billing
WHERE billingID = 1;

PROMPT ===== CHRIS KARPUK | UPDATE STATEMENT =====
UPDATE Billing
SET billingAmount = 19000.00
WHERE billingID = 1;

COMMIT;

PROMPT ===== CHRIS KARPUK | UPDATE | AFTER =====
SELECT billingID, billingAmount, billingDate, appointmentID, providerID
FROM Billing
WHERE billingID = 1;

PROMPT ===== CHRIS KARPUK | DELETE | BEFORE =====
SELECT billingID, billingAmount, billingDate, appointmentID, providerID
FROM Billing
WHERE billingID = 50;

PROMPT ===== CHRIS KARPUK | DELETE STATEMENT =====
DELETE FROM Billing
WHERE billingID = 50;

COMMIT;

PROMPT ===== CHRIS KARPUK | DELETE | AFTER =====
SELECT billingID, billingAmount, billingDate, appointmentID, providerID
FROM Billing
WHERE billingID = 50;

-- ------------------------------------------------------------
-- Member: Nick Sichani
-- Drexel ID: 14843547
-- Contribution: Section 9.4 UPDATE and DELETE
-- ------------------------------------------------------------

PROMPT ===== NICK SICHANI | UPDATE | BEFORE =====
SELECT *
FROM MedicalCondition
ORDER BY conditionID;

PROMPT ===== NICK SICHANI | UPDATE STATEMENT =====
UPDATE MedicalCondition
SET conditionName = 'Chronic Hypertension'
WHERE conditionID = 5;

COMMIT;

PROMPT ===== NICK SICHANI | UPDATE | AFTER =====
SELECT *
FROM MedicalCondition
ORDER BY conditionID;

PROMPT ===== NICK SICHANI | DELETE | BEFORE =====
SELECT *
FROM Appointment_MedicalCondition
WHERE conditionID = 1
ORDER BY appointmentID, conditionID;

PROMPT ===== NICK SICHANI | DELETE STATEMENT =====
DELETE FROM Appointment_MedicalCondition
WHERE conditionID = 1;

COMMIT;

PROMPT ===== NICK SICHANI | DELETE | AFTER =====
SELECT *
FROM Appointment_MedicalCondition
WHERE conditionID = 1
ORDER BY appointmentID, conditionID;

-- ------------------------------------------------------------
-- Member: Ahmed Syed
-- Drexel ID: 14421663
-- Contribution: Section 9.5 UPDATE and DELETE
-- ------------------------------------------------------------

PROMPT ===== AHMED SYED | UPDATE | BEFORE =====
SELECT medicationID, medicationName
FROM Medication
WHERE medicationID = 4;

PROMPT ===== AHMED SYED | UPDATE STATEMENT =====
UPDATE Medication
SET medicationName = 'Acetaminophen'
WHERE medicationID = 4;

COMMIT;

PROMPT ===== AHMED SYED | UPDATE | AFTER =====
SELECT medicationID, medicationName
FROM Medication
WHERE medicationID = 4;

PROMPT ===== AHMED SYED | DELETE | BEFORE =====
SELECT appointmentID, medicationID
FROM Appointment_Medication
WHERE medicationID = 1
ORDER BY appointmentID, medicationID;

PROMPT ===== AHMED SYED | DELETE STATEMENT =====
DELETE FROM Appointment_Medication
WHERE medicationID = 1;

COMMIT;

PROMPT ===== AHMED SYED | DELETE | AFTER =====
SELECT appointmentID, medicationID
FROM Appointment_Medication
WHERE medicationID = 1
ORDER BY appointmentID, medicationID;

-- ============================================================
-- END OF SCRIPT
-- ============================================================