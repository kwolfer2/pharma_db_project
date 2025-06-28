DROP TABLE if EXISTS drugs, ingredients, drug_by_ingred, patients, patients_contraindications, prescriptions, doctor;

CREATE TABLE drugs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60),
    generic VARCHAR(60),
    form VARCHAR(20),
    dosage_mg INT,
    mfid INT
);
CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name TEXT,
    active BOOLEAN NOT NULL
);
CREATE TABLE drug_by_ingred (
    drug INT references drugs(id),
    ingred INT references ingredients(id),
    PRIMARY KEY (drug, ingred)
);
CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first VARCHAR(50) NOT NULL,
    last VARCHAR(50) NOT NULL,
    birth DATE,
    sex VARCHAR(8)
);
CREATE TABLE conditions (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);
CREATE TABLE patients_contraindications (
    patients_id INT references patients(id),
    condition_id INT references conditions(id),
    PRIMARY KEY (patients_id, condition_id)
);
CREATE TABLE drug_conditions (
    drug_id REFERENCES drugs(id),
    condition_id REFERENCES conditions(id),
    PRIMARY KEY (drug_id, condition_id)
);
CREATE TABLE prescriptions (
    id SERIAL PRIMARY KEY,
    patients_id INT references patients(id),
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