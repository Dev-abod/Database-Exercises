create database SimpleLibrary;

use SimpleLibrary;


create table Books
(
  BookId int identity(1,1) NOT NULL,
  Title nvarchar(255),
  ISBN nvarchar(50),
  PublicationDate date,
  Genre nvarchar(50),
  AdditionalDetails nvarchar(Max),
  PRIMARY KEY(BookId)
);

create table BookCopies
(
  CopyId int identity(1,1) NOT NULL,
  BookId int REFERENCES Books(BookId),
  AvailabilityStatus bit,
  PRIMARY KEY (CopyId)  
);

create table Users
(
  UserId int identity(1,1) NOT NULL,
  Name nvarchar(50),
  ContactInformation nvarchar(255),
  LibraryCardNumber nvarchar(50),
  PRIMARY KEY (UserId)
);

create table BorrowingRecords
(
  BorrowingRecordId int identity(1,1) NOT NULL,
  UserId int REFERENCES Users(UserId),
  CopyId int REFERENCES BookCopies(CopyId),
  BorrowingDate date Not NULL,
  DueDate date NOT NULL,
  ActualReturnDate date,

  PRIMARY KEY(BorrowingRecordId)
);

create table Fines
(
  FineId int identity(1,1) NOT NULL,
  UserId int REFERENCES Users(UserId),
  BorrowingRecordId int REFERENCES BorrowingRecords(BorrowingRecordId),
  NumberOfLateDays smallint,
  FineAmount decimal,
  PaymentStatus bit,

  PRIMARY KEY(FineId)
);

create table Reservations
(
  ReservationId int identity(1,1) NOT NULL,
  UserId int REFERENCES Users(UserId),
  CopyId int REFERENCES BookCopies(CopyId),
  ReservationDate date,

  PRIMARY KEY(ReservationId)
);


create table Settings
(
  DefaultBorrowDays tinyint,
  DefaultFinePerDay tinyint
);
