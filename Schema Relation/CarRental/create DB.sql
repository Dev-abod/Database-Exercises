create database CarRental;


use CarRental;


CREATE TABLE Customers
(
  CustomerId int IDENTITY(1,1) NOT NULL,
  Name nvarchar(100),
  ContactInformation nvarchar(100),
  DriverLicenseNumber nvarchar(20),

  CONSTRAINT PK_Customers
    PRIMARY KEY(CustomerId)
);

CREATE TABLE FuelTypes
(
  FuelId int IDENTITY(1,1) NOT NULL,
  FuelType nvarchar(20),

  CONSTRAINT PK_FuelTypes
    PRIMARY KEY(FuelId)
);

CREATE TABLE VehicleCategories
(
  CategoryId int IDENTITY(1,1) NOT NULL,
  CategoryName nvarchar(50) NOT NULL,

  CONSTRAINT PK_VehicleCategories
    PRIMARY KEY(CategoryId)
);

CREATE TABLE Vehicles
(
  VehicleId int IDENTITY(1,1) NOT NULL,
  Make nvarchar(50) NOT NULL,
  Model nvarchar(50) NOT NULL,
  Year int NOT NULL,
  Mileage int NOT NULL,
  FuelTypeId INT,
  PlateNumber nvarchar(20) NOT NULL,
  CarCategoryId int,



  CONSTRAINT PK_Vehicles
  PRIMARY KEY(VehicleId),

  CONSTRAINT FK_VehicleCategory
  FOREIGN KEY(CarCategoryId)
  REFERENCES VehicleCategories(CategoryId),

  CONSTRAINT FK_FuelTypeId
  FOREIGN KEY(FuelTypeId)
  REFERENCES FuelTypes(FuelId)


);

CREATE TABLE Maintenances
(
  MaintenanceId int IDENTITY(1,1) NOT NULL,
  VehicleId int,
  Description nvarchar(100),
  MaintenanceDate date,
  Cost decimal NOT NULL,

  CONSTRAINT PK_Maintenances
   PRIMARY KEY(MaintenanceId),
  
  CONSTRAINT FK_Vehicles
  FOREIGN KEY(VehicleId)
  REFERENCES Vehicles(VehicleId)

);

CREATE TABLE VehicleReturns
(
  ReturnId int IDENTITY(1,1) NOT NULL,
  ActualReturnDate datetime NOT NULL,
  ActualReturnDays tinyint NOT NULL,
  Mileage smallint NOT NULL,
  ConsumedMileage smallint NOT NULL,
  FinalcheckNotes nvarchar(500),
  Additionalcharges smallmoney NOT NULL,
  ActualTotalDueAmount smallmoney NOT NULL,



  CONSTRAINT PK_VehicleReturns
  PRIMARY KEY(ReturnId)
);


CREATE TABLE RentalBooking
(
  BookingId int IDENTITY(1,1) NOT NULL,
  CustomerId int,
  VehicleId int,
  RentalStartDate date NOT NULL,
  RentalEndDate date NOT NULL,
  PickupLocation nvarchar(100),
  DropOffLocation nvarchar(100),
  InitialReturnDays tinyint NOT NULL,
  RentalPricePerDay smallmoney NOT NULL,
  IntialTotalDueAmount smallmoney NOT NULL,
  IntialCheckNotes nvarchar(500),



  CONSTRAINT PK_RentalBooking
  PRIMARY KEY(BookingId),


  CONSTRAINT FK_Customers
  FOREIGN KEY(CustomerId)
  REFERENCES Customers(CustomerId),

  CONSTRAINT FK_Vehicles
  FOREIGN KEY(VehicleId)
  REFERENCES Vehicles(VehicleId)

);



CREATE TABLE RentalTransaction
(
  TransactionId int IDENTITY(1,1) NOT NULL,
  BookingId int,
  ReturnId int,
  PaymentDetails nvarchar(50),
  PaidIntialTotalDueAmount smallmoney NOT NULL,
  ActualTotalDueAmont smallmoney NOT NULL,
  TotalRemaining smallmoney NOT NULL,
  TotalRefundedAmount smallmoney NOT NULL,
  TransactionDate datetime,
  UpdateTransactionDate datetime,



  CONSTRAINT RentalTransaction
  PRIMARY KEY(TransactionId),


  CONSTRAINT FK_RentalBooking
  FOREIGN KEY(BookingId)
  REFERENCES RentalBooking(BookingId),

  CONSTRAINT FK_VehicleReturns
  FOREIGN KEY(ReturnId)
  REFERENCES VehicleReturns(ReturnId)

);