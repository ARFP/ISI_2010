
DROP DATABASE IF EXISTS db_bibli_isi;

CREATE DATABASE db_bibli_isi CHARACTER SET utf8 COLLATE utf8_unicode_ci; 

USE db_bibli_isi;


CREATE TABLE clients(
   client_id INT AUTO_INCREMENT PRIMARY KEY,
   client_lastname VARCHAR(50) NOT NULL,
   client_firstname VARCHAR(50) NOT NULL,
   client_address VARCHAR(255) NOT NULL,
   client_deposit SMALLINT NOT NULL
) Engine InnoDb;


CREATE TABLE borrow_points(
   borrow_point_id INT AUTO_INCREMENT,
   borrow_point_name VARCHAR(50) NOT NULL,
   PRIMARY KEY(borrow_point_id),
   UNIQUE(borrow_point_name)
) Engine InnoDb;


CREATE TABLE books(
   book_id INT AUTO_INCREMENT,
   book_title VARCHAR(255) NOT NULL,
   book_author VARCHAR(255) NOT NULL,
   book_editor VARCHAR(255) NOT NULL,
   book_price DECIMAL(6,2),
   book_buy_date DATE NOT NULL,
   book_state VARCHAR(50) NOT NULL,
   borrow_point_id INT NOT NULL,
   PRIMARY KEY(book_id),
   FOREIGN KEY(borrow_point_id) REFERENCES borrow_points(borrow_point_id)
) Engine InnoDb;

CREATE TABLE borrow(
   book_id INT,
   client_id INT,
   borrow_date DATETIME,
   borrow_return DATETIME,
   PRIMARY KEY(book_id, client_id, borrow_date)
);


ALTER TABLE borrow
  ADD FOREIGN KEY(book_id) REFERENCES books(book_id),
  ADD FOREIGN KEY(client_id) REFERENCES clients(client_id);


INSERT INTO clients 
(client_firstname, client_lastname, client_address, client_deposit)
VALUES
('PRENOM', 'NOM', 'ADDRESS', 50),
('PRENOM2', 'NOM2', 'ADDRESS2', 20);


UPDATE clients SET client_firstname="Mike" WHERE client_id=2;

SELECT * FROM clients;

select client_id, client_lastname FROM clients;


CREATE VIEW clients_riches
AS 
SELECT * FROM clients WHERE client_deposit > 20;


SELECT * FROM clients_riches WHERE client_lastname LIKE "N%";



DELIMITER $$

CREATE PROCEDURE add_client(lastname VARCHAR(50), firstname VARCHAR(50))
BEGIN
	
    IF LENGTH(lastname) > 3
    THEN
		INSERT INTO clients 
		(client_firstname, client_lastname, client_address, client_deposit)
		VALUES 
		(firstname, firstname, 'ADDRESS', 50);
    END IF;
    
END$$

DELIMITER ;