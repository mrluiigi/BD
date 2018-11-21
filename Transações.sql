-- remove stock do recurso animal e regista que animal consumiu e que quantidade consumiu e a data do ultimo consumo do mesmo animal
DROP PROCEDURE IF EXISTS removeStockRecursoAnimal;
DELIMITER //
CREATE PROCEDURE removeStockRecursoAnimal(idRecurso INT, quantidade INT, idAnimal INT)
BEGIN
		if(quantidadeRecurso(idRecurso) > quantidade and existeAnimal(idAnimal)) then
        BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN 
			ROLLBACK;
		END;
        
        START TRANSACTION;
            
        UPDATE recurso
				SET Stock = Stock - quantidade
				WHERE ID = idRecurso;
                
		UPDATE animalrecurso
				SET QuantidadeConsumida = QuantidadeConsumida + quantidade,
                DataUltimoConsumo = NOW()
                WHERE Recurso_ID = idRecurso AND Animal_ID = idAnimal;
	   
                
		COMMIT;
        END;
	end if;
END //

DELIMITER ;
