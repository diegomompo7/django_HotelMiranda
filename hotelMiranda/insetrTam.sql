
It seems you're attempting to update the fullName for existing records in the website_contact table based on their id, and then you're trying to insert new records. However, there might be an issue with your updates because you're updating all records to have the same name 'María Sánchez'.

Let's correct the updates to reflect the correct full names for each contact:

sql
Copy code
UPDATE website_contact
SET fullName = 'Ana González' WHERE id = 1;
UPDATE website_contact
SET fullName = 'Luis Martínez' WHERE id = 2;
UPDATE website_contact
SET fullName = 'María Sánchez' WHERE id = 3;
UPDATE website_contact
SET fullName = 'Carlos Gómez' WHERE id = 4;
UPDATE website_contact
SET fullName = 'Laura Fernández' WHERE id = 5;
UPDATE website_contact
SET fullName = 'Pedro Rodríguez' WHERE id = 6;
UPDATE website_contact
SET fullName = 'Carmen López' WHERE id = 7;
UPDATE website_contact
SET fullName = 'Juan Díaz' WHERE id = 8;
UPDATE website_contact
SET fullName = 'Elena Pérez' WHERE id = 9;
UPDATE website_contact
SET fullName = 'Manuel García' WHERE id = 10;
UPDATE website_contact
SET fullName = 'Isabel Martínez' WHERE id = 11;
UPDATE website_contact
SET fullName = 'David Sánchez' WHERE id = 12;
UPDATE website_contact
SET fullName = 'Laura Gómez' WHERE id = 13;
UPDATE website_contact
SET fullName = 'Miguel Martínez' WHERE id = 14;
UPDATE website_contact
SET fullName = 'Eva Rodríguez' WHERE id = 15;