
--- By Top ---
SELECT TOP 3 Makes.Make  ,count(*) as NumberOfVehicles  
FROM VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE (VehicleDetails.Year between 1950 AND 2000)
GROUP by Makes.Make
ORDER BY NumberOfVehicles DESC



--- By Having
SELECT Makes.Make  ,count(*) as NumberOfVehicles  
FROM VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE (VehicleDetails.Year between 1950 AND 2000)
GROUP by Makes.Make
HAVING count(*) >12000
ORDER BY NumberOfVehicles DESC



--- By nested Select ---
select * from
(
SELECT Makes.Make  ,count(*) as NumberOfVehicles  
FROM VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE (VehicleDetails.Year between 1950 AND 2000)
GROUP by Makes.Make
HAVING count(*) >12000
) R1

where R1.NumberOfVehicles > 12000
ORDER BY NumberOfVehicles DESC






