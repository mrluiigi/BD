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

DELIMITER //
CREATE PROCEDURE addProdAnimal(nome varchar(45), preco float, stock int, validade datetime, idAnimal int)
BEGIN
	BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN 
			ROLLBACK;
		END;
        
        START TRANSACTION;
        
        INSERT INTO produtoanimal  (Designacao, Preco, Stock, Validade, Animal_ID) 
			VALUE (nome,preco,stock,validade,idAnimal);
		COMMIT;
	END;
END //

DELIMITER ;


DELIMITER //
CREATE PROCEDURE addProdVegetal(nome varchar(45), preco float, stock int, validade datetime, idPlantação int)
BEGIN
	BEGIN
        DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN 
			ROLLBACK;
		END;
        
        START TRANSACTION;
        
        INSERT INTO produtovegetal  (Designacao, Preco, Stock, Validade, Plantação_ID) 
			VALUE (nome,preco,stock,validade,idPlantação);
		COMMIT;
	END;
END //

DELIMITER ;

