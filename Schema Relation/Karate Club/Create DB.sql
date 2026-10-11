CREATE DATABASE KarateClub;

USE KarateClub;


-- =========================================
-- 1. Persons
-- =========================================

CREATE TABLE Persons
(
    PersonId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    Address NVARCHAR(100),
    ContactInformation NVARCHAR(100),

    CONSTRAINT PK_Persons
        PRIMARY KEY (PersonId)
);


-- =========================================
-- 2. BeltRanks
-- =========================================

CREATE TABLE BeltRanks
(
    RankId INT IDENTITY(1,1) NOT NULL,
    Name NVARCHAR(100),
    RankDate DATE,

    CONSTRAINT PK_PersonsS
        PRIMARY KEY (RankId)
);


-- =========================================
-- 3. Instructors
-- =========================================

CREATE TABLE Instructors
(
    InstructorId INT IDENTITY(1,1) NOT NULL,
    PersonId INT NOT NULL,
    Qualifications NVARCHAR(100),

    CONSTRAINT PK_Instructors
        PRIMARY KEY (InstructorId),

    CONSTRAINT FK_Instructors_Persons
        FOREIGN KEY (PersonId)
        REFERENCES Persons(PersonId)
);


-- =========================================
-- 4. Members
-- =========================================

CREATE TABLE Members
(
    MemberId INT IDENTITY(1,1) NOT NULL,
    PersonId INT NOT NULL,
    EmergencyContact NVARCHAR(100),
    LastBeltRankId INT,
    IsActive BIT NOT NULL,

    CONSTRAINT PK_Members
        PRIMARY KEY (MemberId),

    CONSTRAINT FK_Members_Persons
        FOREIGN KEY (PersonId)
        REFERENCES Persons(PersonId),

    CONSTRAINT FK_Members_BeltRanks
        FOREIGN KEY (LastBeltRankId)
        REFERENCES BeltRanks(RankId)
);


-- =========================================
-- 5. MembersInstructors
-- =========================================

CREATE TABLE MembersInstructors
(
    MemberId INT NOT NULL,
    InstructorId INT NOT NULL,
    AssigningDate DATETIME,

    CONSTRAINT PK_MembersInstructors
        PRIMARY KEY (MemberId, InstructorId),

    CONSTRAINT FK_MembersInstructors_Members
        FOREIGN KEY (MemberId)
        REFERENCES Members(MemberId),

    CONSTRAINT FK_MembersInstructors_Instructors
        FOREIGN KEY (InstructorId)
        REFERENCES Instructors(InstructorId)
);



CREATE TABLE Payments
(
    PaymentId INT IDENTITY(1,1) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    Date DATETIME NOT NULL,
    MemberId INT NOT NULL,

    CONSTRAINT PK_Payments
        PRIMARY KEY (PaymentId),

    CONSTRAINT FK_Payments_Members
        FOREIGN KEY (MemberId)
        REFERENCES Members(MemberId)
);



CREATE TABLE SubscriptionPeriods
(
    PeriodId INT IDENTITY(1,1) NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    Fees SMALLMONEY NOT NULL,
    PaymentId INT NOT NULL,
    MemberId INT NOT NULL,

    CONSTRAINT PK_SubscriptionPeriods
        PRIMARY KEY (PeriodId),

    CONSTRAINT FK_SubscriptionPeriods_Payments
        FOREIGN KEY (PaymentId)
        REFERENCES Payments(PaymentId),

    CONSTRAINT FK_SubscriptionPeriods_Members
        FOREIGN KEY (MemberId)
        REFERENCES Members(MemberId)
);



CREATE TABLE BeltTests
(
    TestId INT IDENTITY(1,1) NOT NULL,
    MemberId INT NOT NULL,
    RankId INT NOT NULL,
    Result BIT NOT NULL,
    Date DATE NOT NULL,
    TestedByInstructorId INT NOT NULL,
    PaymentId INT NOT NULL,

    CONSTRAINT PK_BeltTests
        PRIMARY KEY (TestId),

    CONSTRAINT FK_BeltTests_Members
        FOREIGN KEY (MemberId)
        REFERENCES Members(MemberId),

    CONSTRAINT FK_BeltTests_BeltRanks
        FOREIGN KEY (RankId)
        REFERENCES BeltRanks(RankId),

    CONSTRAINT FK_BeltTests_Instructors
        FOREIGN KEY (TestedByInstructorId)
        REFERENCES Instructors(InstructorId),

    CONSTRAINT FK_BeltTests_Payments
        FOREIGN KEY (PaymentId)
        REFERENCES Payments(PaymentId)
);