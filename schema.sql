DROP TABLE if EXISTS drugs;

CREATE TABLE drugs (
id SERIAL PRIMARY KEY,
name VARCHAR(60) NOT NULL,
generic VARCHAR(60) NOT NULL,
form VARCHAR(20) NOT NULL,
dosage_mg INT,
mfid INT
);
CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    formula VARCHAR(60) NOT NULL,
    controlled_substance BOOLEAN NOT NULL,
    description TEXT
);
CREATE TABLE drug_by_ingred (
    id SERIAL PRIMARY KEY,
    drug INT references drugs(id),
    ingred INT references ingredients(id),
    dose_mg INT NOT NULL
);
CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    first VARCHAR(50) NOT NULL,
    last VARCHAR(50) NOT NULL,
    birth DATE,
    sex VARCHAR(8)
);
CREATE TABLE patient_conditions (
    id SERIAL PRIMARY KEY,
    patient_id INT references patient(id),
    allergy VARCHAR(60),
    condition TEXT
);
CREATE TABLE prescriptions (
    id SERIAL PRIMARY KEY,
    patient_id INT references patient(id),
    drug_id INT references drugs(id),
    dose_mg INT,
    frequency TEXT,
    start_date DATE,
    end_date DATE,
    doctor_id INT references doctor(id)
);
CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    first VARCHAR(50) NOT NULL,
    last VARCHAR(50) NOT NULL,
    title VARCHAR(50),
    location TEXT
);