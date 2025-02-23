USE hospital;

-- Create indexes
CREATE INDEX idx_patient_name ON patients(last_name, first_name);
CREATE INDEX idx_patient_dob ON patients(date_of_birth);

CREATE INDEX idx_doctor_name ON doctors(last_name, first_name);
CREATE INDEX idx_doctor_status ON doctors(status, specialization_id);

CREATE INDEX idx_appointment_date ON appointments(appointment_date);
CREATE INDEX idx_appointment_status_date ON appointments(status, appointment_date);

CREATE INDEX idx_medical_records_date ON medical_records(record_date);
CREATE INDEX idx_medical_record_patient_date ON medical_records(patient_id, record_date);
