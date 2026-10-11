-- create database SimpleClinic;

use SimpleClinic;

create table Persons
(
   PersonID int identity(1,1) NOT NULL,
   Name nvarchar(100) NOT NULL,
   DateOfBirth date ,
   Gender nvarchar(1) NOT NULL,
   PhoneNumber nvarchar(200),
   Email nvarchar(100),
   Address nvarchar(200),
   PRIMARY KEY(PersonID)
);

CREATE TABLE Patients
(
   PatientID int identity(1,1) NOT NULL,
   PersonID int REFERENCES Persons(PersonID),
   PRIMARY KEY(PatientID)
);

CREATE TABLE Doctors
(
  DoctorID int identity(1,1) NOT NULL,
  PersonID int REFERENCES Persons(PersonID),
  PRIMARY KEY(DoctorID)
);

CREATE TABLE Payments
(
  PaymentID int identity(1,1) NOT NULL,
  PaymentDate Date NOT NULL,
  PaymentMethod nvarchar(100) NOT NULL,
  AmountPaid Decimal NOT NULL,
  AdditionalNotes nvarchar(200),

  PRIMARY KEY(PaymentID)
);

CREATE TABLE MedicalRecords
(
  MedicalRecordID int identity(1,1) NOT NULL,
  VisitDescription nvarchar(200),
  Diagonsis nvarchar(200),
  AdditionalNotes nvarchar(200),

  PRIMARY KEY(MedicalRecordID)
);

CREATE TABLE Appointments
(
  AppointmentID int identity(1,1) NOT NULL,
  AppointmentDateTime datetime NOT NULL,
  AppointmentStatus tinyint,

  PatientID int REFERENCES Patients(PatientID),
  DoctorID int REFERENCES Doctors(DoctorID),
  MedicalRecordID int REFERENCES MedicalRecords(MedicalRecordID),
  PaymentID int REFERENCES Payments(PaymentID),
);

CREATE TABLE Prescritions
(
  PrescritionID int identity(1,1) NOT NULL,
  MedicationName nvarchar(100),
  Dosage nvarchar(20),
  Frequency nvarchar(50),
  StartDate date,
  EndDate date,
  SpecialInstructions nvarchar(200),
  
  PRIMARY KEY(PrescritionID),
  MedicalRecordID int REFERENCES MedicalRecords(MedicalRecordID),
);