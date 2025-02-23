USE hospital;

-- Foreign Key Constraints
ALTER TABLE appointments
    ADD CONSTRAINT fk_appointments_patient
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    ADD CONSTRAINT fk_appointments_doctor
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE doctors
    ADD CONSTRAINT fk_doctors_specialization
    FOREIGN KEY (specialization_id) REFERENCES specializations(specialization_id)
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE medical_records
    ADD CONSTRAINT fk_medical_records_patient
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    
    ADD CONSTRAINT fk_medical_records_doctor
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
    ON DELETE RESTRICT ON UPDATE CASCADE;

-- Additional Constraints

-- Remove problematic timestamp check and replace with trigger
DROP TRIGGER IF EXISTS before_appointment_insert;
DROP TRIGGER IF EXISTS before_appointment_update;

DELIMITER //

CREATE TRIGGER before_appointment_insert
BEFORE INSERT ON appointments
FOR EACH ROW
BEGIN
    -- Only check future appointments if status is 'Scheduled'
    IF NEW.status = 'Scheduled' AND NEW.appointment_date < NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot schedule new appointments in the past';
    END IF;
END//

CREATE TRIGGER before_appointment_update
BEFORE UPDATE ON appointments
FOR EACH ROW
BEGIN
    -- Only validate future dates for scheduled appointments
    IF NEW.status = 'Scheduled' AND NEW.appointment_date < NOW() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot reschedule appointments to past dates';
    END IF;
END//

DELIMITER ;

-- Ensure valid status values
ALTER TABLE appointments
    ADD CONSTRAINT check_appointment_status
    CHECK (status IN ('Scheduled', 'Completed', 'Cancelled', 'No-Show'));

ALTER TABLE doctors
    ADD CONSTRAINT check_doctor_status
    CHECK (status IN ('Active', 'On Leave', 'Inactive'));

-- Email constraints (using simpler pattern for MySQL compatibility)
ALTER TABLE patients
    ADD CONSTRAINT check_patient_email
    CHECK (email REGEXP '^[^@]+@[^@]+\.[^@]+$' OR email IS NULL);

ALTER TABLE doctors
    ADD CONSTRAINT check_doctor_email
    CHECK (email REGEXP '^[^@]+@[^@]+\.[^@]+$');

-- Ensure unique email addresses
ALTER TABLE patients
    ADD CONSTRAINT unique_patient_email
    UNIQUE (email);

ALTER TABLE doctors
    ADD CONSTRAINT unique_doctor_email
    UNIQUE (email);

-- Phone number constraints (allowing various formats)
ALTER TABLE patients
    ADD CONSTRAINT check_patient_phone
    CHECK (phone_number REGEXP '^[0-9]{10,15}$' OR phone_number IS NULL);

ALTER TABLE doctors
    ADD CONSTRAINT check_doctor_phone
    CHECK (phone_number REGEXP '^[0-9]{10,15}$');

-- Remove and replace the filtered index with a simple unique index
-- Note: MySQL automatically treats NULL values as distinct in unique indexes
CREATE UNIQUE INDEX idx_unique_patient_email 
ON patients(email);
