-- This script seeds the database with initial data for the hospital management system.
-- It performs the following operations:
-- 1. Disables foreign key checks to allow truncation of tables.
-- 2. Clears existing data from the 'appointments', 'doctors', and 'patients' tables.
-- 3. Re-enables foreign key checks.
-- 4. Inserts sample data into the 'patients' table.
-- 5. Inserts sample data into the 'doctors' table.
-- 6. Inserts sample data into the 'appointments' table, including both scheduled and historical (completed/cancelled) appointments.
-- Clear existing data
SET FOREIGN_KEY_CHECKS = 0;  -- Temporarily disable foreign key constraint checks
TRUNCATE TABLE appointments;  -- Clear all data from appointments table
TRUNCATE TABLE doctors;      -- Clear all data from doctors table
TRUNCATE TABLE patients;     -- Clear all data from patients table
SET FOREIGN_KEY_CHECKS = 1;  -- Re-enable foreign key constraint checks

-- Seed Patients
INSERT INTO patients (first_name, last_name, date_of_birth, gender, email, phone, address) VALUES
('John', 'Smith', '1985-03-15', 'Male', 'john.smith@email.com', '555-0101', '123 Oak Street, Boston, MA 02108'),
('Sarah', 'Johnson', '1992-07-22', 'Female', 'sarah.j@email.com', '555-0102', '456 Maple Ave, Boston, MA 02109'),
('Michael', 'Williams', '1978-11-30', 'Male', 'mwilliams@email.com', '555-0103', '789 Pine Road, Boston, MA 02110'),
('Emily', 'Brown', '1990-04-18', 'Female', 'emily.brown@email.com', '555-0104', '321 Elm Street, Boston, MA 02111'),
('David', 'Lee', '1982-09-05', 'Male', 'david.lee@email.com', '555-0105', '654 Cedar Lane, Boston, MA 02112');

-- Seed Doctors
INSERT INTO doctors (first_name, last_name, specialization, email, phone) VALUES
('Robert', 'Wilson', 'Cardiology', 'dr.wilson@hospital.com', '555-0201'),
('Jennifer', 'Martinez', 'Pediatrics', 'dr.martinez@hospital.com', '555-0202'),
('James', 'Anderson', 'Orthopedics', 'dr.anderson@hospital.com', '555-0203'),
('Patricia', 'Taylor', 'Neurology', 'dr.taylor@hospital.com', '555-0204'),
('William', 'Thomas', 'General Medicine', 'dr.thomas@hospital.com', '555-0205');

-- Seed Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, '2025-02-24 09:00:00', 'Scheduled', 'Regular cardiac checkup'),
(2, 2, '2025-02-24 10:30:00', 'Scheduled', 'Vaccination appointment'),
(3, 3, '2025-02-24 14:00:00', 'Scheduled', 'Follow-up for knee surgery'),
(4, 4, '2025-02-25 11:00:00', 'Scheduled', 'Migraine consultation'),
(5, 5, '2025-02-25 15:30:00', 'Scheduled', 'Annual physical examination'),
(1, 4, '2025-02-26 09:30:00', 'Scheduled', 'Neurological evaluation'),
(3, 1, '2025-02-26 13:00:00', 'Scheduled', 'Heart screening'),
(2, 5, '2025-02-27 10:00:00', 'Scheduled', 'Flu symptoms');

-- Add some completed and cancelled appointments for history
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, '2025-02-20 09:00:00', 'Completed', 'Patient reported improvement in condition'),
(2, 2, '2025-02-21 10:30:00', 'Cancelled', 'Patient called to reschedule'),
(3, 3, '2025-02-22 14:00:00', 'Completed', 'Prescribed physiotherapy exercises'),
(4, 4, '2025-02-19 11:00:00', 'Completed', 'Prescribed medication for migraines');