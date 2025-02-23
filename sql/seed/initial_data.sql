-- This script seeds the database with initial data for the hospital management system.
-- It performs the following operations:
-- 1. Disables foreign key checks to allow truncation of tables.
-- 2. Clears existing data from the 'appointments', 'doctors', 'patients', and 'specializations' tables.
-- 3. Re-enables foreign key checks.
-- 4. Inserts sample data into the 'specializations' table.
-- 5. Inserts sample data into the 'patients' table.
-- 6. Inserts sample data into the 'doctors' table.
-- 7. Inserts sample data into the 'appointments' table, including both scheduled and historical (completed/cancelled) appointments.

USE hospital;

-- Clear existing data
SET FOREIGN_KEY_CHECKS = 0;  -- Temporarily disable foreign key constraint checks
TRUNCATE TABLE medical_records;
TRUNCATE TABLE appointments;  -- Clear all data from appointments table
TRUNCATE TABLE doctors;      -- Clear all data from doctors table
TRUNCATE TABLE patients;     -- Clear all data from patients table
TRUNCATE TABLE specializations;
SET FOREIGN_KEY_CHECKS = 1;  -- Re-enable foreign key constraint checks

-- Insert Specializations
INSERT INTO specializations (name, description) VALUES
('Cardiology', 'Heart and cardiovascular system'),
('Pediatrics', 'Medical care of infants, children, and adolescents'),
('Orthopedics', 'Musculoskeletal system'),
('Neurology', 'Nervous system disorders'),
('General Medicine', 'Primary healthcare'),
('Dermatology', 'Skin conditions'),
('Psychiatry', 'Mental health');

-- Seed Patients
INSERT INTO patients (first_name, last_name, date_of_birth, gender, email, phone_number, address) VALUES
('John', 'Smith', '1985-03-15', 'Male', 'john.smith@email.com', '5550101123', '123 Oak Street, Boston, MA 02108'),
('Sarah', 'Johnson', '1992-07-22', 'Female', 'sarah.j@email.com', '5550102123', '456 Maple Ave, Boston, MA 02109'),
('Michael', 'Williams', '1978-11-30', 'Male', 'mwilliams@email.com', '5550103123', '789 Pine Road, Boston, MA 02110'),
('Emily', 'Brown', '1990-04-18', 'Female', 'emily.brown@email.com', '5550104123', '321 Elm Street, Boston, MA 02111'),
('David', 'Lee', '1982-09-05', 'Male', 'david.lee@email.com', '5550105123', '654 Cedar Lane, Boston, MA 02112'),
('Lisa', 'Garcia', '1988-12-03', 'Female', 'lisa.g@email.com', '5550106123', '987 Birch Blvd, Boston, MA 02113'),
('Robert', 'Chen', '1975-06-28', 'Male', 'r.chen@email.com', '5550107123', '147 Walnut St, Boston, MA 02114');

-- Seed Doctors
INSERT INTO doctors (first_name, last_name, specialization_id, email, phone_number) VALUES
('Robert', 'Wilson', 1, 'dr.wilson@hospital.com', '5550201123'),
('Jennifer', 'Martinez', 2, 'dr.martinez@hospital.com', '5550202123'),
('James', 'Anderson', 3, 'dr.anderson@hospital.com', '5550203123'),
('Patricia', 'Taylor', 4, 'dr.taylor@hospital.com', '5550204123'),
('William', 'Thomas', 5, 'dr.thomas@hospital.com', '5550205123'),
('Sarah', 'Kim', 6, 'dr.kim@hospital.com', '5550206123'),
('Michael', 'Patel', 7, 'dr.patel@hospital.com', '5550207123');

-- Seed Appointments (Current and Future)
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, CURDATE() + INTERVAL 1 DAY + INTERVAL 9 HOUR, 'Scheduled', 'Regular cardiac checkup'),
(2, 2, CURDATE() + INTERVAL 1 DAY + INTERVAL 10 HOUR + INTERVAL 30 MINUTE, 'Scheduled', 'Vaccination appointment'),
(3, 3, CURDATE() + INTERVAL 1 DAY + INTERVAL 14 HOUR, 'Scheduled', 'Follow-up for knee surgery'),
(4, 4, CURDATE() + INTERVAL 2 DAY + INTERVAL 11 HOUR, 'Scheduled', 'Migraine consultation'),
(5, 5, CURDATE() + INTERVAL 2 DAY + INTERVAL 15 HOUR + INTERVAL 30 MINUTE, 'Scheduled', 'Annual physical examination'),
(6, 6, CURDATE() + INTERVAL 3 DAY + INTERVAL 13 HOUR, 'Scheduled', 'Skin examination'),
(7, 7, CURDATE() + INTERVAL 3 DAY + INTERVAL 14 HOUR, 'Scheduled', 'Initial consultation');

-- Add historical appointments (Past appointments)
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, CURDATE() - INTERVAL 5 DAY + INTERVAL 9 HOUR, 'Completed', 'Patient reported improvement in condition'),
(2, 2, CURDATE() - INTERVAL 4 DAY + INTERVAL 10 HOUR, 'Cancelled', 'Patient called to reschedule'),
(3, 3, CURDATE() - INTERVAL 3 DAY + INTERVAL 14 HOUR, 'Completed', 'Prescribed physiotherapy exercises'),
(4, 4, CURDATE() - INTERVAL 2 DAY + INTERVAL 11 HOUR, 'Completed', 'Prescribed medication for migraines'),
(5, 5, CURDATE() - INTERVAL 1 DAY + INTERVAL 15 HOUR, 'Completed', 'Regular checkup completed'),
(6, 6, CURDATE() - INTERVAL 6 DAY + INTERVAL 13 HOUR, 'Cancelled', 'Doctor emergency'),
(7, 7, CURDATE() - INTERVAL 7 DAY + INTERVAL 14 HOUR, 'Completed', 'Therapy session completed');