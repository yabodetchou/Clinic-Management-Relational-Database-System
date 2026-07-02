-- ============================================================
-- FILE: dml_maintenance.sql
-- DESCRIPTION: Transactional operations, updates, deletes, and test logs
-- ============================================================

-- ------------------------------------------------------------
-- Member: Yabo Detchou
-- Drexel ID: 14265881
-- Contribution: Section 9.2 UPDATE and DELETE
-- ------------------------------------------------------------

-- System Test Block: Before Room Change Tracking
PROMPT ===== YABO DETCHOU | UPDATE | BEFORE =====
SELECT appointmentID, roomNumber 
FROM Appointment 
WHERE appointmentID = 14;

-- Transactional Update Block
UPDATE Appointment 
SET roomNumber = 310 
WHERE appointmentID = 14;

-- Save Changes
COMMIT;

-- System Test Block: After Room Change Verification
PROMPT ===== YABO DETCHOU | UPDATE | AFTER =====
SELECT appointmentID, roomNumber 
FROM Appointment 
WHERE appointmentID = 14;


-- System Test Block: Before Deletion Logging
PROMPT ===== YABO DETCHOU | DELETE | BEFORE =====
SELECT * 
FROM Appointment_Medication 
WHERE appointmentID = 15;

-- Transactional Clean Junction Deletion
DELETE FROM Appointment_Medication 
WHERE appointmentID = 15;

-- Save Changes
COMMIT;

-- System Test Block: After Deletion Verification
PROMPT ===== YABO DETCHOU | DELETE | AFTER =====
SELECT * 
FROM Appointment_Medication 
WHERE appointmentID = 15;