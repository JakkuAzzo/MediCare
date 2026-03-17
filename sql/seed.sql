USE traveljabs;

INSERT INTO roles (RoleName) VALUES
('Manager'),
('Clinician');

INSERT INTO status (StatusName) VALUES
('Pending'),
('Booked'),
('Arrived'),
('In Progress'),
('Completed'),
('Cancelled'),
('No Show');

INSERT INTO clinics (ClinicName, ClinicAddress, ClinicPostcode, ClinicContact, ClinicManagerID, ClinicManagerFirstname, ClinicManagerLastname) VALUES
('Travel Jabs London', '10 High Street, London', 'SW1A 1AA', '02070000001', NULL, 'Sarah', 'Jones'),
('Travel Jabs Birmingham', '25 City Road, Birmingham', 'B1 1BB', '01210000002', NULL, 'Mark', 'Brown');

INSERT INTO patients (PatientFirstname, PatientLastname, PatientAddress, PatientPostcode, Patientage) VALUES
('Nathan', 'Brown', '12 Example Street', 'CR0 1AA', 24),
('Marisa', 'Olusemo', '34 Sample Road', 'KT1 2BB', 23);

INSERT INTO vaccines (VaccineName, VaccineCost) VALUES
('Yellow Fever', 85.00),
('Hepatitis A', 60.00),
('Typhoid', 45.00);

INSERT INTO staff (StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
('Sarah', 'Jones', 1, 1),
('Mark', 'Brown', 1, 2),
('Emma', 'Smith', 2, 1),
('John', 'Davis', 2, 2);

INSERT INTO appointments (AppointmentDatetime, AppointmentPatientID, AppointmentClinicID, AppointmentStaffID, AppointmentStatusID) VALUES
('2026-04-15 14:30:00', 1, 1, 3, 2),
('2026-04-20 10:00:00', 2, 2, 4, 1);
