SELECT VendorName, PhoneNumber FROM Vendor 
UNION
SELECT TrainerName, PhoneNumber FROM Trainer

SELECT 'Vendor' AS ContactType, VendorName, PhoneNumber FROM Vendor
UNION
SELECT 'Trainer' AS ContactType, TrainerName, PhoneNumber FROM Trainer

