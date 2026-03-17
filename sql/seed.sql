USE traveljabs;

-- Insert Roles
INSERT INTO roles (RoleID, RoleName) VALUES
(1, 'Manager'),
(2, 'Clinician');

-- Insert Status
INSERT INTO status (StatusID, StatusName) VALUES
(1, 'Pending'),
(2, 'Booked'),
(3, 'Arrived'),
(4, 'In Progress'),
(5, 'Completed'),
(6, 'Cancelled'),
(7, 'No Show');

-- Insert Clinics (10 clinics)
INSERT INTO clinics (ClinicID, ClinicName, ClinicAddress, ClinicPostcode, ClinicContact, ClinicManagerID, ClinicManagerFirstname, ClinicManagerLastname) VALUES
(1, 'TravelJabs Brighton', '12 Queens Road, Brighton, East Sussex', 'BN1 3XF', '01273 800 121', 1, 'Emma', 'Collins'),
(2, 'TravelJabs Hastings', '5 Robertson Street, Hastings, East Sussex', 'TN34 1HL', '01424 700 242', 5, 'Omar', 'Rahman'),
(3, 'TravelJabs Eastbourne', '22 Terminus Road, Eastbourne, East Sussex', 'BN21 3LP', '01323 810 363', 9, 'Priya', 'Shah'),
(4, 'TravelJabs Worthing', '14 Montague Street, Worthing, West Sussex', 'BN11 3BX', '01903 820 484', 13, 'Thomas', 'Hughes'),
(5, 'TravelJabs Crawley', '7 High Street, Crawley, West Sussex', 'RH10 1BW', '01293 830 505', 17, 'Samira', 'Noor'),
(6, 'TravelJabs Guildford', '18 High Street, Guildford, Surrey', 'GU1 3EL', '01483 840 626', 21, 'Mehdi', 'Farouk'),
(7, 'TravelJabs Woking', '9 Commercial Way, Woking, Surrey', 'GU21 6XN', '01483 850 747', 25, 'William', 'Lee'),
(8, 'TravelJabs Reading', '25 Broad Street, Reading, Berkshire', 'RG1 2BH', '0118 860 868', 29, 'Saira', 'Malik'),
(9, 'TravelJabs Milton Keynes', '6 Midsummer Boulevard, Milton Keynes, Buckinghamshire', 'MK9 2EA', '01908 870 989', 33, 'Khalid', 'Nasser'),
(10, 'TravelJabs Oxford', '11 Cornmarket Street, Oxford, Oxfordshire', 'OX1 3EX', '01865 880 101', 37, 'Robert', 'Mitchell');

-- Insert Staff (Managers and Clinicians)
-- Clinic 1 (Brighton) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(1, 'Emma', 'Collins', 1, 1),
(2, 'Farhan', 'Ali', 2, 1),
(3, 'Leila', 'Haddad', 2, 1),
(4, 'Jack', 'Turner', 2, 1);

-- Clinic 2 (Hastings) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(5, 'Omar', 'Rahman', 1, 2),
(6, 'Aisha', 'Ahmed', 2, 2),
(7, 'Daniel', 'Lloyd', 2, 2),
(8, 'Lisa', 'Chen', 2, 2);

-- Clinic 3 (Eastbourne) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(9, 'Priya', 'Shah', 1, 3),
(10, 'Michael', 'Brown', 2, 3),
(11, 'Sophie', 'Williams', 2, 3),
(12, 'David', 'Johnson', 2, 3);

-- Clinic 4 (Worthing) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(13, 'Thomas', 'Hughes', 1, 4),
(14, 'Rachel', 'Green', 2, 4),
(15, 'Christopher', 'Blake', 2, 4),
(16, 'Anna', 'White', 2, 4);

-- Clinic 5 (Crawley) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(17, 'Samira', 'Noor', 1, 5),
(18, 'Kevin', 'Parker', 2, 5),
(19, 'Emma', 'Taylor', 2, 5),
(20, 'Jason', 'Anderson', 2, 5);

-- Clinic 6 (Guildford) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(21, 'Mehdi', 'Farouk', 1, 6),
(22, 'Natalie', 'Foster', 2, 6),
(23, 'Simon', 'Roberts', 2, 6),
(24, 'James', 'Walker', 2, 6);

-- Clinic 7 (Woking) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(25, 'William', 'Lee', 1, 7),
(26, 'Paul', 'Edwards', 2, 7),
(27, 'Victoria', 'Harris', 2, 7),
(28, 'Matthew', 'Young', 2, 7);

-- Clinic 8 (Reading) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(29, 'Saira', 'Malik', 1, 8),
(30, 'Andrew', 'Martin', 2, 8),
(31, 'Jennifer', 'Davis', 2, 8),
(32, 'Samuel', 'King', 2, 8);

-- Clinic 9 (Milton Keynes) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(33, 'Khalid', 'Nasser', 1, 9),
(34, 'Lisa', 'Miller', 2, 9),
(35, 'Marcus', 'Wilson', 2, 9),
(36, 'Catherine', 'Moore', 2, 9);

-- Clinic 10 (Oxford) - Manager and Clinicians
INSERT INTO staff (StaffID, StaffFirstname, StaffLastname, StaffRoleID, StaffClinicID) VALUES
(37, 'Robert', 'Mitchell', 1, 10),
(38, 'Patricia', 'Taylor', 2, 10),
(39, 'Oliver', 'Jackson', 2, 10),
(40, 'Eleanor', 'Scott', 2, 10);

-- Insert Patients
INSERT INTO patients (PatientID, PatientFirstname, PatientLastname, PatientAddress, PatientPostcode, Patientage) VALUES
(1, 'John', 'Brown', '42 High Street', 'BN1 2AB', 28),
(2, 'Sarah', 'Smith', '15 Queens Road', 'BN1 3XF', 34),
(3, 'Michael', 'Johnson', '7 Park Lane', 'BN2 1AB', 45),
(4, 'Emily', 'Williams', '23 Elm Street', 'BN3 2CD', 31),
(5, 'David', 'Jones', '88 Oak Avenue', 'BN4 3EF', 52),
(6, 'Jennifer', 'Garcia', '12 Pine Road', 'BN5 4GH', 27),
(7, 'Robert', 'Martinez', '34 Cedar Lane', 'BN6 5IJ', 41),
(8, 'Lisa', 'Rodriguez', '56 Birch Street', 'BN7 6KL', 29),
(9, 'James', 'Lee', '78 Maple Drive', 'BN8 7MN', 38),
(10, 'Maria', 'Perez', '90 Spruce Court', 'BN9 8OP', 33);

-- Insert Vaccines (9 vaccines)
INSERT INTO vaccines (VaccineID, VaccineName, VaccineCost) VALUES
(1, 'Hepatitis A', 65.00),
(2, 'Typhoid', 35.00),
(3, 'Tetanus / Diphtheria / Polio (Td/IPV booster)', 45.00),
(4, 'Hepatitis B', 60.00),
(5, 'Rabies', 95.00),
(6, 'Influenza', 18.00),
(7, 'Covid-19', 10.00),
(8, 'Measles / Mumps / Rubella (MMR)', 40.00),
(9, 'Yellow fever', 85.00);

-- Insert Appointments
INSERT INTO appointments (AppointmentID, AppointmentDatetime, AppointmentPatientID, AppointmentClinicID, AppointmentStaffID, AppointmentStatusID) VALUES
(1, '2026-04-15 09:00:00', 1, 1, 2, 2),
(2, '2026-04-15 10:30:00', 2, 1, 3, 2),
(3, '2026-04-15 14:00:00', 3, 1, 4, 1),
(4, '2026-04-16 09:30:00', 4, 2, 6, 2),
(5, '2026-04-16 11:00:00', 5, 2, 7, 2),
(6, '2026-04-17 10:00:00', 6, 3, 10, 1),
(7, '2026-04-17 14:30:00', 7, 3, 11, 2),
(8, '2026-04-18 09:00:00', 8, 4, 14, 2),
(9, '2026-04-18 15:00:00', 9, 5, 18, 1),
(10, '2026-04-19 11:00:00', 10, 6, 22, 2);

-- Insert Vaccinations (vaccines administered in appointments)
INSERT INTO vaccinations (VaccinationID, VaccinationAppointmentID, VaccinationVaccineID, VaccinationOutcomeID) VALUES
(1, 1, 1, 1),
(2, 1, 9, 1),
(3, 2, 4, 1),
(4, 2, 5, 1),
(5, 3, 1, 1),
(6, 3, 5, 1),
(7, 3, 9, 1),
(8, 3, 4, 1),
(9, 3, 8, 1),
(10, 4, 2, 1),
(11, 4, 3, 1),
(12, 5, 6, 1),
(13, 5, 7, 1),
(14, 6, 9, 1),
(15, 7, 1, 1),
(16, 7, 4, 1),
(17, 8, 5, 1),
(18, 9, 2, 1),
(19, 9, 3, 1),
(20, 10, 8, 1);

-- Insert Invoices
INSERT INTO invoices (InvoiceID, InvoiceAppointmentID, InvoiceDatetime, InvoiceStatus) VALUES
(1, 1, '2026-04-15 16:00:00', 'Paid'),
(2, 2, '2026-04-15 16:30:00', 'Paid'),
(3, 4, '2026-04-16 12:00:00', 'Pending'),
(4, 5, '2026-04-16 13:00:00', 'Paid'),
(5, 7, '2026-04-17 16:00:00', 'Pending'),
(6, 8, '2026-04-18 10:00:00', 'Paid'),
(7, 10, '2026-04-19 13:00:00', 'Paid');
