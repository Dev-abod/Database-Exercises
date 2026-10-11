
--- By Having
SELECT Makes.Make  ,count(*) as NumberOfVehicles , (select count(*) from VehicleDetails) as TotalVehicals
FROM VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE (VehicleDetails.Year between 1950 AND 2000)
GROUP by Makes.Make
ORDER BY NumberOfVehicles DESC





