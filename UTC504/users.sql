
DROP USER 'mike'@'localhost';

CREATE USER 'mike'@'localhost' IDENTIFIED BY 'azerty';

GRANT ALL PRIVILEGES ON *.* TO 'mike'@'localhost' WITH GRANT OPTION; 

-- GRANT GRANT OPTION TO 'mike'@'localhost';

/*
GRANT UPDATE(order_quantity, order_paid) 
ON tp_agence_voyages.orders 
TO 'mike'@'localhost'; 


GRANT SELECT ON tp_agence_voyages.cities TO 'mike'@'localhost';
*/

SHOW GRANTS FOR 'mike'@'localhost';


