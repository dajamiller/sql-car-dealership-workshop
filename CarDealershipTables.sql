-- CREATE database cardealership
-- USE cardealership

-- dealership table
/*CREATE table dealership (
	dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(12) NOT NULL
    );*/
    
-- dealership sample data
/*INSERT INTO dealership (name, address, phone) VALUES
('CarMax Auto Center', '123 Maple Street', '555-123-4567'),
('Premium Motors', '78 Oak Avenue', '555-987-6543'),
('Sunshine Autos', '450 Pine Road', '555-222-3344'),
('Metro City Cars', '900 Downtown Blvd', '555-444-8899'),
('Elite Auto Plaza', '250 Horizon Drive', '555-101-2020'),
('Westside Dealership', '19 Sunset Lane', '555-303-4040'),
('North Ridge Autos', '765 Mountain View', '555-505-6060'),
('Speedline Motors', '88 Highway Road', '555-707-8080');*/-- Use cardealership

-- vehicles table (nazik)
/*CREATE TABLE vehicles (
    vin VARCHAR(17) PRIMARY KEY,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    color VARCHAR(30),
    number_of_passengers INT,
    cargo_capacity INT,
    fuel_capacity INT,
    sold BOOLEAN DEFAULT FALSE
);*/

-- vehicle sample data
/*INSERT INTO vehicles (vin, make, model, year, color, number_of_passengers, cargo_capacity, fuel_capacity, sold) VALUES
('1HGCM82633A004352', 'Honda', 'Civic', 2020, 'Red', 5, 350, 45, FALSE),
('1FAFP404X1F102030', 'Ford', 'Mustang', 2019, 'Blue', 4, 300, 60, TRUE),
('2T1BURHE0FC123456', 'Toyota', 'Corolla', 2021, 'Silver', 5, 370, 50, FALSE),
('3N1AB7AP2FY246810', 'Nissan', 'Sentra', 2018, 'Black', 5, 360, 48, TRUE),
('5YJSA1DP9DFP78910', 'Tesla', 'Model S', 2022, 'White', 5, 400, 0, FALSE),
('JHMCM56557C404040', 'Honda', 'Accord', 2020, 'Gray', 5, 375, 52, TRUE),
('1GCHK23D47F789123', 'Chevrolet', 'Silverado', 2017, 'Green', 6, 1200, 80, TRUE),
('WBA3A5C52DF123321', 'BMW', '3 Series', 2019, 'Black', 5, 300, 55, FALSE);*/

-- sales contract table (daja)
/*CREATE TABLE sales_contracts (
    salescontract_id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(17) NOT NULL,
    dealership_id INT NOT NULL,
    saleprice DECIMAL(10,2) NOT NULL,
    sale_date DATE NOT NULL,
    customername VARCHAR(50) NOT NULL,
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
    );*/

-- sales contract sample data
/*INSERT INTO sales_contracts (vin, dealership_id, saleprice, sale_date, customername)
VALUES
('1HGCM82633A004352', 1, 22000.00, '2025-11-01', 'James Carter'),
('1FAFP404X1F102030', 2, 35000.00, '2025-10-15', 'Sophia Martinez'),
('2T1BURHE0FC123456', 3, 21000.00, '2025-09-20', 'Liam Johnson'),
('3N1AB7AP2FY246810', 4, 19000.00, '2025-11-10', 'Olivia Brown'),
('5YJSA1DP9DFP78910', 105, 75000.00, '2025-08-05', 'Ethan Davis'),
('JHMCM56557C404040', 101, 24000.00, '2025-07-22', 'Emma Wilson'),
('1GCHK23D47F789123', 106, 48000.00, '2025-06-30', 'Noah Thompson'),
('WBA3A5C52DF123321', 107, 41000.00, '2025-05-18', 'Ava Anderson'),
('1HGCM82633A004352', 101, 22500.00, '2025-04-10', 'Mason Clark'),
('2T1BURHE0FC123456', 103, 21500.00, '2025-03-25', 'Isabella Lewis');


--inventory table (MJ)
CREATE TABLE inventory (
    dealership_id INT NOT NULL,
    VIN VARCHAR(17) NOT NULL,
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealership(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

--inventory sample data
INSERT INTO inventory (dealership_id, vin) 
VALUES
(1, '1HGCM82633A004352'),  -- CarMax Auto Center has a Honda Civic
(1, '5YJSA1DP9DFP78910'),  -- CarMax also has a Tesla Model S
(2, '1FAFP404X1F102030'),  -- Premium Motors has the Ford Mustang
(3, '2T1BURHE0FC123456'),  -- Sunshine Autos has a Toyota Corolla
(4, '3N1AB7AP2FY246810'),  -- Metro City Cars has a Nissan Sentra
(5, 'JHMCM56557C404040'),  -- Elite Auto Plaza has the Honda Accord
(6, '1GCHK23D47F789123'),  -- Westside Dealership has a Chevy Silverado
(7, 'WBA3A5C52DF123321');  -- North Ridge Autos has a BMW 3 Series */


-- lease table (hoang)
/*CREATE TABLE Lease_Contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
   dealership_id INT NOT NULL,
    vin VARCHAR(17) NOT NULL,
       customer_name VARCHAR(100),   -- Customer full name
    lease_start_date DATE NOT NULL,
    lease_end_date DATE NOT NULL,
    monthly_payment DECIMAL(10,2) NOT NULL,
    down_payment DECIMAL(10,2) DEFAULT 0,
    security_deposit DECIMAL(10,2) DEFAULT 0,
    lease_term_months INT NOT NULL,
    contract_status ENUM('Active','Completed','Terminated') DEFAULT 'Active',
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- lease sample data
INSERT INTO Lease_Contracts (dealership_id, vin, customer_name, 
lease_start_date, lease_end_date, monthly_payment, down_payment, 
security_deposit, lease_term_months, contract_status)
VALUES
-- 1
(1, '1HGCM82633A004352', 'John Doe',
'2025-01-15', '2028-01-15',
399.99, 1500.00, 500.00,
36, 'Active'),
 
-- 2
(2, '1FAFP404X1F102030', 'Sarah Johnson',
'2025-03-01', '2028-03-01',
455.50, 2000.00, 600.00,
36, 'Active'),
 
-- 3
(3, '2T1BURHE0FC123456', 'Michael Smith',
'2024-11-10', '2027-11-10',
379.00, 1000.00, 500.00,
36, 'Completed'),
 
-- 4
(1, '3N1AB7AP2FY246810', 'Emily Carter',
'2025-04-20', '2028-04-20',
499.99, 2500.00, 700.00,
36, 'Active'),
 
-- 5
(4, '5YJSA1DP9DFP78910', 'David Wilson',
'2023-08-01', '2026-08-01',
329.99, 1200.00, 400.00,
36, 'Terminated'),
 
-- 6
(3, 'JHMCM56557C404040', 'Jessica Brown',
'2025-02-10', '2028-02-10',
415.75, 1800.00, 550.00,
36, 'Active');*/






