CREATE TABLE Customer(
   customer_id INT,
   PRIMARY KEY(customer_id)
);

CREATE TABLE Person(
   person_id INT,
   customer_id INT NOT NULL,
   PRIMARY KEY(person_id),
   UNIQUE(customer_id),
   FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Company(
   company_id INT,
   customer_id INT NOT NULL,
   PRIMARY KEY(company_id),
   UNIQUE(customer_id),
   FOREIGN KEY(customer_id) REFERENCES Customer(customer_id)
);

DELIMITER $

CREATE PROCEDURE add_customer 
(
IN new_customer_id INT, 
IN new_person_id INT
)
BEGIN 

    DECLARE nb INT;
    
	START TRANSACTION;

	INSERT INTO Customer (customer_id) VALUES (new_customer_id);
    
    SELECT COUNT(*) INTO nb FROM Company WHERE customer_id = new_customer_id;
    
    IF nb < 1 THEN
		INSERT INTO Person (person_id, customer_id) VALUES (new_person_id, new_customer_id);
        COMMIT;
	ELSE
		ROLLBACK;
	END IF;

END $

DELIMITER ;









