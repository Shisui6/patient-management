/* Database schema to keep the structure of entire database. */

-- Patients table
CREATE TABLE patients (
    id                  SERIAL PRIMARY KEY,
    name                VARCHAR(100),
    date_of_birth       DATE
);

-- Medical histories table
CREATE TABLE medical_histories (
    id                  SERIAL PRIMARY KEY,
    admitted_at         TIMESTAMP,
    patient_id          INT REFERENCES patients(id),
    status              VARCHAR(100)
);

-- Treatments table
CREATE TABLE treatments (
    id                  SERIAL PRIMARY KEY,
    type                VARCHAR(100),
    name                VARCHAR(100)
);

-- Medical history treatments table
CREATE TABLE medical_history_treatments (
    id                  SERIAL PRIMARY KEY,
    medical_history_id  INT REFERENCES medical_histories(id),
    treatment_id        INT REFERENCES treatments(id)
);

-- Create table Invoices
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount FLOAT,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT REFERENCES medical_histories(id)
);

-- Create table invoice_items
CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price FLOAT,
    quantity INT,
    total_price FLOAT,
    invoice_id INT REFERENCES invoices(id),
    treatment_id INT REFERENCES treatments(id)
);