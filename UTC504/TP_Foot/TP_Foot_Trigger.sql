DELIMITER $$

/*
déclarer une variable de type INT
recherche l'identifiant de l'équipe dans la table players (p_id=NEW.p_id)
comparer cet identifiant avec l'identiant de l'equipe en cours d'insertion
si c'est différent, je leve une erreur
*/
CREATE trigger inclusion_test 
BEFORE INSERT ON soccer_match
FOR EACH ROW 
BEGIN

	DECLARE C INT DEFAULT 0;
	/* SET C = 0; */

	SELECT t_id INTO C FROM players WHERE p_id=NEW.p_id;
    
	IF C <> NEW.t_id 
	THEN 
	 SIGNAL SQLSTATE '45000' 
	 SET MESSAGE_TEXT = '';
	END IF ;
    
    /*
    SELECT COUNT(*) INTO C 
	FROM players WHERE p_id=NEW.p_id AND t_id=NEW.t_id;
    
    IF C <> 1 
	THEN
	 SIGNAL SQLSTATE '45000' 
	 SET MESSAGE_TEXT = '';
	END IF ;
    */
    
    
END $$

DELIMITER ;