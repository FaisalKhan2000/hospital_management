-- Basic Queries:
-- 1. List all patients
SELECT 
    patient_id, 
    first_name, 
    last_name 
FROM patients;

-- 2. List all doctors
SELECT 
    doctor_id, 
    first_name, 
    last_name 
FROM doctors;

-- 3. View all appointments for today
SELECT 
    * 
FROM appointments
WHERE DATE(appointment_date) = CURDATE();

-- 4. Find patient by ID or name
SELECT 
    * 
FROM patients 
WHERE patient_id = 1
   OR first_name = '' 
   OR last_name = '';

-- 5. Find doctor by ID or name
SELECT 
    * 
FROM doctors 
WHERE doctor_id = 1
   OR first_name = '' 
   OR last_name = '';


-- Patient-related Queries:

-- 6. View patient appointment history
SELECT 
    p.patient_id, 
    p.first_name, 
    p.last_name, 
    a.appointment_id, 
    a.appointment_date, 
    a.status, 
    a.notes 
FROM patients p 
JOIN appointments a 
  ON p.patient_id = a.patient_id 
WHERE p.patient_id = 1;


-- 7. Find patients by age range


-- 8. Count patients by gender
-- 9. List patients who haven't had appointments in last 6 months
-- 10. Find patients with upcoming appointments

-- Doctor-related Queries:
-- 11. List doctors by specialization
-- 12. Count number of patients per doctor
-- 13. View doctor's schedule for specific day
-- 14. Find doctors with most appointments
-- 15. Calculate doctor's appointment completion rate

-- Appointment-related Queries:
-- 16. List appointments by status (Scheduled/Completed/Cancelled)
-- 17. View appointments for specific date range
-- 18. Calculate daily/weekly/monthly appointment statistics
-- 19. Find overlapping appointments
-- 20. List cancelled appointments with reasons

-- Administrative Queries:
-- 21. Calculate appointment cancellation rate
-- 22. Find busiest days of the week
-- 23. View appointment distribution by specialization
-- 24. Calculate average appointments per day
-- 25. Find time slots with most cancellations

-- Analytical Queries:
-- 26. Patient demographics analysis
-- 27. Doctor workload analysis
-- 28. Peak hours analysis
-- 29. Appointment booking patterns
-- 30. Patient visit frequency analysis

-- Reporting Queries:
-- 31. Monthly appointment summary
-- 32. Doctor performance metrics
-- 33. Patient visit history report
-- 34. Cancellation analysis report
-- 35. Specialization demand analysis