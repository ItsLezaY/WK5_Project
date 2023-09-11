CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    First_Name VARCHAR,
    Last_Name VARCHAR,
    Phone_Number VARCHAR,
    Email VARCHAR,
    Address VARCHAR
);


CREATE TABLE Car (
    Car_ID INT PRIMARY KEY,
    Serial BOOLEAN,
    Make VARCHAR,
    Model VARCHAR,
    car_year INT,
    Color VARCHAR,
    Mileage INT,
    VIN VARCHAR(17)
);


CREATE TABLE Salesperson (
    Salesperson_ID INT PRIMARY KEY,
    First_Name VARCHAR,
    Last_Name VARCHAR
);


CREATE TABLE Purchase_Invoice (
    Invoice_ID INT PRIMARY KEY,
    Car_ID INT,
    Customer_ID INT,
    Salesperson_ID INT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Salesperson_ID) REFERENCES Salesperson(Salesperson_ID)
);


CREATE TABLE Mechanic (
    Mechanic_ID INT PRIMARY KEY,
    First_Name VARCHAR,
    Last_Name VARCHAR
);


CREATE TABLE Service_Invoice (
    Service_Invoice_ID INT PRIMARY KEY,
    Car_ID INT,
    Dealer_Serial BOOLEAN,
    Dropoff_Date DATE,
    Pickup_Date DATE,
    Mechanic_ID INT,
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    FOREIGN KEY (Mechanic_ID) REFERENCES Mechanic(Mechanic_ID)
);


CREATE TABLE Services (
    Service_ID INT PRIMARY KEY,
    Services_Done VARCHAR
);


CREATE TABLE Part_Used (
    PartUsed_ID INT PRIMARY KEY,
    Service_Invoice_ID INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (Service_Invoice_ID) REFERENCES Service_Invoice(Service_Invoice_ID)
);


CREATE TABLE Mechanic_Services (
    Mechanic_Services_ID INT PRIMARY KEY,
    Mechanic_ID INT,
    Service_ID INT,
    Service_Invoice_ID INT,
    FOREIGN KEY (Mechanic_ID) REFERENCES Mechanic(Mechanic_ID),
    FOREIGN KEY (Service_ID) REFERENCES Services(Service_ID),
    FOREIGN KEY (Service_Invoice_ID) REFERENCES Service_Invoice(Service_Invoice_ID)
);