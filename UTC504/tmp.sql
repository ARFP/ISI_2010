START TRANSACTION;
/* CREATE PROCEDURE; */

DELIMITER $

CREATE TRIGGER before_insert_client
BEFORE INSERT ON clients 
FOR EACH ROW 
BEGIN
	DECLARE today DATETIME;
    DECLARE date_last_client DATETIME;
    
    SET today = NOW();
	
    SELECT client_added INTO date_last_client FROM clients WHERE client_id=1;
    
    IF NEW.client_added > today
    THEN 
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Date future interdite';
    END IF;
    
END $

DELIMITER ;


CREATE VIEW cities_view 
AS 
SELECT city_code, city_name, country_name 
FROM cities 
INNER JOIN countries ON cities.country_code = countries.country_code;


SELECT city_name, country_name from cities_view WHERE city_name='Mulhouse' ORDER BY city_code DESC LIMIT 1;

DELIMITER $

CREATE trigger before_insert_customer 
BEFORE INSERT ON borrow 
FOR EACH ROW 
BEGIN 
	/*NEW.customer_id*/
    DECLARE isExists INT;
    
    SELECT COUNT(*) INTO isExists 
    FROM subscribe WHERE customer_id = NEW.customer_id; 
    
    IF isExists < 1 THEN 
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Un client non inscrit ne peut pas emprunter';
    END IF;
    
END $

DELIMITER ;


