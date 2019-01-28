USE quinta;

-- ---------------FUNCIONÁRIO PODE-----------------------

-- Verificar que animais expiram a vacina dentro de um mês
SELECT * FROM animal WHERE ValidadeVacina <= (DATE(NOW()) + INTERVAL 1 MONTH);


-- Adicionar stock a um certo recurso
CALL adicionaStockRecurso(4, 10);


-- Plantações a colher no mês ...
CALL colheitaMes(6);


-- Produtos animais fora de validade
SELECT * FROM ProdutoAnimal
	WHERE Validade < now();
 
 
-- Verificar que produtos animais estão dentro da validade
CALL passouValidadeAnimal(now());


-- Produtos vegetais fora de validade
SELECT * FROM ProdutoVegetal
	WHERE Validade < now();
    

-- Verificar que produtos vegetais estão dentro da validade
CALL passouValidadePlanta(now());


-- Quantas espécies de animais existem na quinta 
SELECT COUNT(DISTINCT Espécie) AS TotalEspécies FROM Animal;


-- Número de animais da espécie X
CALL animalEspecie('Vaca minhota');


-- Recursos consumidos pelo animal dado
CALL recursosConsumidosAnimal(1);


-- Recursos consumidos pela Plantação dada
CALL recursosConsumidosPlantacao(2);


-- Área total das plantações
SELECT SUM(Area) FROM plantação;


-- Que espécies consomem o recurso X
CALL especiesConsomem(1);


-- Produtos do animal x
CALL produtosDoAnimal(2);


-- Espécies que existem na quinta
SELECT DISTINCT(Espécie) FROM Animal;


-- Recursos consumidos pelo animal dado
CALL recursosConsumidosAnimal(1);


-- Recursos consumidos pela Plantação dada
CALL recursosConsumidosPlantacao(2);


-- Altera a data da última vez que os animais foram alimentados para a hora atual
CALL atualizaDataConsumo();

-- Adiciona encomenda de um cliente. (valor, data, nifcliente, idPA, qtdA, idPV, qtdV)
CALL addEncomenda(22, '2018-11-25', 1, 3, 10, 1, 3);