SELECT Makes.Make  ,count(*) as NumberOfVehicles  
FROM VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE (VehicleDetails.Year between 1950 AND 2000)
group by Makes.Make
order by NumberOfVehicles DESC;






