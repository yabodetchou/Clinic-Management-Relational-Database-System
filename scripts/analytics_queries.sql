-- ============================================================
-- FILE: analytics_queries.sql
-- DESCRIPTION: Clinical operations tracking and analytical metrics
-- ============================================================

-- ------------------------------------------------------------
-- Member: Yabo Detchou
-- Drexel ID: 14265881
-- Contribution: Section 8.2 query scenarios
-- ------------------------------------------------------------

-- Scenario 1: Pinpointing doctor scheduling & room allocation
SELECT 
    d.doctorID, 
    (d.firstName || ' ' || d.lastName) AS doctor_name,
    a.appointmentID,
    a.roomNumber,
    a.appointmentDate
FROM Doctor d
JOIN Appointment a ON d.doctorID = a.doctorID
WHERE d.doctorID = 14 
  AND a.appointmentDate = TO_DATE('2020-05-22', 'YYYY-MM-DD');

-- Scenario 2: Doctor Caseload Aggregations (LEFT JOIN / COUNT)
SELECT 
    d.doctorID, 
    (d.firstName || ' ' || d.lastName) AS doctor_name,
    COUNT(a.appointmentID) AS total_appointments
FROM Doctor d
LEFT JOIN Appointment a ON d.doctorID = a.doctorID 
GROUP BY d.doctorID, d.firstName, d.lastName
ORDER BY total_appointments DESC;

-- Scenario 3: Tracking Asthma Case Frequencies
SELECT 
    d.doctorID, 
    (d.firstName || ' ' || d.lastName) AS doctor_name,
    mc.conditionName, 
    COUNT(a.appointmentID) AS case_count
FROM Doctor d
JOIN Appointment a ON d.doctorID = a.doctorID
JOIN Appointment_MedicalCondition mc ON a.appointmentID = mc.appointmentID
WHERE mc.conditionName = 'Asthma' 
GROUP BY d.doctorID, d.firstName, d.lastName, mc.conditionName;