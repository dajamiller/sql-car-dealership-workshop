-- 1. Get all dealerships
SELECT * FROM dealership;
-- 2 Find all vehicles for a specific dealership
SELECT v.*
FROM vehicles v
JOIN inventory i ON v.vin = i.vin
WHERE i.dealership_id = 1;
-- 3. Find a car by VIN
SELECT * FROM vehicles
WHERE vin = '1HGCM82633A004352';
-- 4. Find the dealership where a certain car is located, by VIN
SELECT d.*
FROM dealership d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.vin = '1HGCM82633A004352';
-- 5. Find all Dealerships that have a certain car type (i.e. Red Ford Mustang)
SELECT DISTINCT d.*
FROM dealership d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.vin = v.vin
WHERE v.make = 'Honda'
  AND v.model = 'Civic'
  AND v.color = 'Red';
-- 6. Get all sales information for a specific dealer for a specific date range
SELECT 
    s.salescontract_id,
    s.vin,
    v.make,
    v.model,
    v.year,
    s.saleprice,
    s.sale_date,
    s.customername,
    d.name AS dealership_name
FROM 
    sales_contracts s
JOIN 
    vehicles v ON s.vin = v.vin
JOIN 
    dealership d ON s.dealership_id = d.dealership_id
WHERE 
    s.dealership_id = 1
    AND s.sale_date BETWEEN '2025-04-01' AND '2025-11-30'
ORDER BY 
    s.sale_date ASC;








  
    


