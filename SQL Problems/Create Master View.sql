
CREATE VIEW vEHICALmASTERdETAILS AS
SELECT        VehicleDetails.ID, VehicleDetails.MakeID, Makes.Make, VehicleDetails.ModelID, MakeModels.ModelName, VehicleDetails.SubModelID, SubModels.SubModelName, VehicleDetails.BodyID, Bodies.BodyName, 
                         VehicleDetails.Vehicle_Display_Name, VehicleDetails.Year, VehicleDetails.DriveTypeID, DriveTypes.DriveTypeName, VehicleDetails.Engine, VehicleDetails.Engine_CC, VehicleDetails.Engine_Cylinders, 
                         VehicleDetails.Engine_Liter_Display, VehicleDetails.FuelTypeID, FuelTypes.FuelTypeName, VehicleDetails.NumDoors
FROM            FuelTypes INNER JOIN
                         Bodies INNER JOIN
                         Makes INNER JOIN
                         MakeModels ON Makes.MakeID = MakeModels.MakeID INNER JOIN
                         SubModels ON MakeModels.ModelID = SubModels.ModelID INNER JOIN
                         VehicleDetails ON SubModels.SubModelID = VehicleDetails.SubModelID ON Bodies.BodyID = VehicleDetails.BodyID INNER JOIN
                         DriveTypes ON VehicleDetails.DriveTypeID = DriveTypes.DriveTypeID ON FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID