CREATE DATABASE IF NOT EXISTS traveljabs;
USE traveljabs;

CREATE TABLE roles (
  RoleID INT AUTO_INCREMENT PRIMARY KEY,
  RoleName VARCHAR(100) NOT NULL
);

CREATE TABLE clinics (
  ClinicID INT AUTO_INCREMENT PRIMARY KEY,
  ClinicName VARCHAR(255) NOT NULL,
  ClinicAddress VARCHAR(255) NOT NULL,
  ClinicPostcode VARCHAR(20) NOT NULL,
  ClinicContact VARCHAR(100) NOT NULL,
  ClinicManagerID INT,
  ClinicManagerFirstname VARCHAR(100),
  ClinicManagerLastname VARCHAR(100)
);

CREATE TABLE staff (
  StaffID INT AUTO_INCREMENT PRIMARY KEY,
  StaffFirstname VARCHAR(100) NOT NULL,
  StaffLastname VARCHAR(100) NOT NULL,
  StaffRoleID INT NOT NULL,
  StaffClinicID INT NOT NULL,
  FOREIGN KEY (StaffRoleID) REFERENCES roles(RoleID),
  FOREIGN KEY (StaffClinicID) REFERENCES clinics(ClinicID)
);

CREATE TABLE patients (
  PatientID INT AUTO_INCREMENT PRIMARY KEY,
  PatientFirstname VARCHAR(100) NOT NULL,
  PatientLastname VARCHAR(100) NOT NULL,
  PatientAddress VARCHAR(255) NOT NULL,
  PatientPostcode VARCHAR(20) NOT NULL,
  Patientage INT NOT NULL
);

CREATE TABLE status (
  StatusID INT AUTO_INCREMENT PRIMARY KEY,
  StatusName VARCHAR(100) NOT NULL
);

CREATE TABLE vaccines (
  VaccineID INT AUTO_INCREMENT PRIMARY KEY,
  VaccineName VARCHAR(255) NOT NULL,
  VaccineCost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE appointments (
  AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
  AppointmentDatetime DATETIME NOT NULL,
  AppointmentPatientID INT NOT NULL,
  AppointmentClinicID INT NOT NULL,
  AppointmentStaffID INT NOT NULL,
  AppointmentStatusID INT NOT NULL,
  FOREIGN KEY (AppointmentPatientID) REFERENCES patients(PatientID),
  FOREIGN KEY (AppointmentClinicID) REFERENCES clinics(ClinicID),
  FOREIGN KEY (AppointmentStaffID) REFERENCES staff(StaffID),
  FOREIGN KEY (AppointmentStatusID) REFERENCES status(StatusID)
);

CREATE TABLE vaccinations (
  VaccinationID INT AUTO_INCREMENT PRIMARY KEY,
  VaccinationAppointmentID INT NOT NULL,
  VaccinationVaccineID INT NOT NULL,
  VaccinationOutcomeID INT,
  FOREIGN KEY (VaccinationAppointmentID) REFERENCES appointments(AppointmentID),
  FOREIGN KEY (VaccinationVaccineID) REFERENCES vaccines(VaccineID)
);

CREATE TABLE invoices (
  InvoiceID INT AUTO_INCREMENT PRIMARY KEY,
  InvoiceAppointmentID INT NOT NULL,
  InvoiceDatetime DATETIME NOT NULL,
  InvoiceStatus VARCHAR(100) NOT NULL,
  FOREIGN KEY (InvoiceAppointmentID) REFERENCES appointments(AppointmentID)
);
