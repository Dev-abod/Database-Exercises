
--- By Having
select *,CAST(NumberOfVehicles as float) / CAST(TotalVehicals as float) as Perc from
(
SELECT Makes.Make  ,count(*) as NumberOfVehicles , (select count(*) from VehicleDetails) as TotalVehicals
FROM VehicleDetails INNER JOIN
                         Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE (VehicleDetails.Year between 1950 AND 2000) 
GROUP by Makes.Make
)R1

ORDER BY NumberOfVehicles DESC



