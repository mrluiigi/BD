USE quinta;

-- Verifica que animais expiram a vacina dentro de um mês
SELECT * FROM animal WHERE ValidadeVacina <= (DATE(NOW()) + INTERVAL 1 MONTH);


-- Altera validade da vacina +2 anos
DROP PROCEDURE IF EXISTS alteraValidadeVacina;
DELIMITER //

CREATE PROCEDURE alteraValidadeVacina(idAnimal INT)
BEGIN
UPDATE animal 
	SET ValidadeVacina = (ValidadeVacina + INTERVAL 2 YEAR)
    WHERE animal.ID = idAnimal;
END //
DELIMITER ;



-- Adiciona ao stock de um certo recurso uma quantidade
DROP PROCEDURE IF EXISTS adicionaStockRecurso;
DELIMITER //

CREATE PROCEDURE adicionaStockRecurso(idRecurso INT, quantidade INT)
BEGIN
UPDATE recurso
	SET Stock = Stock + quantidade
    where recurso.ID = idRecurso;
END//
DELIMITER ;

-- remove stock do recurso animal e regista que animal consumiu e que quantidade consumiu e a data do ultimo consumo do mesmo animal
DELIMITER //
CREATE PROCEDURE removeStockRecursoAnimal(idRecurso INT, quantidade INT, idAnimal INT)
BEGIN
		if(quantidadeRecurso(idRecurso) > quantidade) then
		UPDATE animalrecurso
				SET QuantidadeConsumida = QuantidadeConsumida + quantidade,
                DataUltimoConsumo = NOW()
                WHERE Recurso_ID = idRecurso AND Animal_ID = idAnimal;
			 UPDATE recurso
				SET Stock = Stock - quantidade
				WHERE ID = idRecurso;
	end if;
END //
-- remove stock do recurso plantação e regista que plantação consumiu e que quantidade e a data do ultimo consumo da plantação
DELIMITER //
CREATE PROCEDURE removeStockRecursoPlantacao(idRecurso INT, quantidade INT, idPlantacao INT)
BEGIN
		if(quantidadeRecurso(idRecurso) > quantidade) then
		UPDATE plantaçãorecurso
				SET QuantidadeConsumida = QuantidadeConsumida + quantidade,
                DataUltimoConsumo = NOW()
                WHERE Recurso_ID = idRecurso AND Plantação_ID = idPlantacao;
			 UPDATE recurso
				SET Stock = Stock - quantidade
				WHERE ID = idRecurso;
	end if;
END //
DELIMITER ;

DELIMITER ;
-- Plantação a colher no mês indicado
DROP PROCEDURE IF EXISTS colheitaMes;
DELIMITER //

CREATE PROCEDURE colheitaMes(mes int)
BEGIN
	SELECT * FROM plantação 
		WHERE MesColheita = mes;
END//
DELIMITER //;
-- CALL colheitaMes(6);


-- Quantidade em Stock do recurso X
DROP FUNCTION IF EXISTS quantidadeRecurso;
DELIMITER %%

CREATE FUNCTION quantidadeRecurso(id INT) RETURNS INT
READS SQL DATA
	BEGIN 
		DECLARE quantidade INT;
        
        SELECT R.Stock INTO quantidade FROM Recurso AS R
			WHERE R.ID = id;
		RETURN quantidade;
        
	END %%
DELIMITER ;
-- SELECT quantidadeRecurso(4);


-- Quantos espécies de animais existem na quinta 
SELECT COUNT(DISTINCT Espécie) AS TotalEspécies FROM Animal;



-- Que funcionario cuidou do Animal X
DROP PROCEDURE IF EXISTS qualFuncionario
DELIMITER %%
CREATE PROCEDURE qualFuncionario(idAnimal INT)
	BEGIN
		SELECT Funcionário_Número FROM FuncionárioAnimal AS FA
			WHERE FA.Animal_ID = idAnimal;
            

	END %%
DELIMITER ;

-- CALL qualFuncionario(3);






DELIMITER %%

CREATE FUNCTION existeAnimal(id INT) RETURNS INT
READS SQL DATA
	BEGIN 
    DECLARE existe INT;
	SELECT COUNT(A.id) INTO existe FROM Animal AS A
			WHERE A.ID = id;
	RETURN existe;
	END %%
DELIMITER ;


-- Soma das vendas num intervalo de tempo 
delimiter //
CREATE PROCEDURE valorVendasIntervalo (inicio DATE, fim DATE)
	BEGIN 
		SELECT SUM(Valor) FROM Encomenda 
			WHERE (data BETWEEN inicio  AND fim);
	END//
delimiter ;

-- valor das vendas totais de um cliente
DELIMITER %%
CREATE FUNCTION totalVendasCliente(id INT) RETURNS INT
READS SQL DATA
	BEGIN
		DECLARE total INT;
		SELECT Valor INTO total FROM cliente
		INNER JOIN encomenda ON encomenda.cliente = cliente.NIF AND cliente.NIF = id;
        RETURN total;
	END%%
DELIMITER ;

-- produtos do animal x

DELIMITER //
CREATE PROCEDURE produtosDoAnimal(id int)
BEGIN
	select * from produtoanimal where Animal_ID = id;
END//
DELIMITER ;



DROP PROCEDURE IF EXISTS passouValidadeAnimal;
DELIMITER //
CREATE PROCEDURE passouValidadeAnimal(dataA DATE)
BEGIN
        SELECT * FROM produtoanimal 
                WHERE Validade <= dataA;
END//
DELIMITER //;

DROP PROCEDURE IF EXISTS produtovegetal;
DELIMITER //
CREATE PROCEDURE passouValidadePlanta(dataA DATE)
BEGIN
        SELECT * FROM produtovegetal
                WHERE Validade <= dataA;
END//
DELIMITER //;


-- Lucro gerado por um animal/plantação (preço dos produtos - custo dos recursos) (num intervalo de tempo?)

-- Custo dos recursos: tabela do animal com o animalrecurso para saber quantidade consumida e depois animalrecurso com recurso para saber o preço
-- Associar produtoanimal com encomenda para ver o lucro que esse animal gerou

DROP PROCEDURE IF EXISTS recursosConsumidosAnimal;

DELIMITER //
CREATE PROCEDURE recursosConsumidosAnimal(idAnimal INT)
BEGIN
        SELECT A.ID, A.Espécie, R.Tipo, AR.QuantidadeConsumida FROM animal AS A
                INNER JOIN animalrecurso AS AR ON AR.Animal_ID = A.ID
        INNER JOIN recurso AS R ON R.ID = AR.Recurso_ID
                WHERE A.ID = idAnimal;
END //
DELIMITER //;

CALL recursosConsumidosAnimal(1);


DELIMITER %%
CREATE FUNCTION calculaCustoConsumidoAnimal(idAnimal INT) RETURNS int
READS SQL DATA
	BEGIN 
		DECLARE total INT;
        SELECT SUM(R.Preco * AR.QuantidadeConsumida) INTO total FROM animal AS A
            INNER JOIN animalrecurso AS AR ON AR.Animal_ID = A.ID
			INNER JOIN recurso AS R ON R.ID = AR.Recurso_ID
                WHERE A.ID = idAnimal;
                
			RETURN total;
	END %%
DELIMITER %%;

DELIMITER %%
CREATE FUNCTION calculaVendaProdutosAnimal(idAnimal INT) RETURNS INT
READS SQL DATA
	BEGIN 
		DECLARE total INT;
        SELECT SUM(PA.Preco * PAE.Quantidade) INTO total FROM animal AS A
			INNER JOIN produtoanimal AS PA ON PA.Animal_ID = A.ID
			INNER JOIN produtoanimalencomenda AS PAE ON PAE.ProdutoAnimal_ID = PA.ID
				WHERE A.ID = idAnimal;
                
			RETURN total;
	END %%
DELIMITER %%;

DELIMITER //
CREATE PROCEDURE calculaLucro(idAnimal INT)
BEGIN
    SELECT (calculaVendaProdutosAnimal(idAnimal) - calculaCustoConsumidoAnimal(idAnimal));
END //
DELIMITER //;

-- Funcionários da Plantação X
DELIMITER //
CREATE PROCEDURE funcionariosDaPlantacao(idPlantação INT)
BEGIN
	SELECT * FROM funcionário 
		INNER JOIN funcionárioplantação AS FP ON FP.Funcionário_Número = funcionário.Número
		WHERE Plantação_ID = idPlantação;
END //
DELIMITER ;


-- Número de animais da espécie X

DELIMITER //
CREATE PROCEDURE animalEspecie(especie varchar(45))
BEGIN
    SELECT COUNT(*) FROM animal
		WHERE animal.Espécie = especie AND animal.Vida = 'V';
END //
DELIMITER //;

CALL animalEspecie('Vaca minhota');



-- Área total das plantações (é preciso atributo para saber se foi colhida)

DELIMITER //
CREATE PROCEDURE areaPlantacoes()
BEGIN
    SELECT SUM(Area) FROM plantação;
END //
DELIMITER //;

CALL areaPlantacoes();


-- Numero de encomendas feitas

DELIMITER //
CREATE PROCEDURE quantasEncomendas()
BEGIN
    SELECT COUNT(*) FROM encomenda;
END //
DELIMITER //;

CALL quantasEncomendas();



-- Que espécies consomem o recurso X

DELIMITER //
CREATE PROCEDURE especiesConsomem(recurso INT)
BEGIN
    SELECT DISTINCT(Espécie) FROM animal
		INNER JOIN animalrecurso AS AR ON AR.Animal_ID = animal.ID
        WHERE AR.Recurso_ID = recurso;
END //
DELIMITER //;

CALL especiesConsomem(1);