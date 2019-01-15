USE quinta;

-- ---------------GESTOR PODE:---------------------

-- Alterar Salário de um funcionário
CALL alteraSalario(1, 750);

-- Alterar o Horário de um funcionário
CALL alteraHorario(1, 'S');
-- Select * from funcionário;

-- Lucro do animal 9
CALL calculaLucro(9);

-- Produtos animais fora de validade
SELECT * FROM ProdutoAnimal
	WHERE Validade < now();
    
-- Produtos vegetais fora de validade
SELECT * FROM ProdutoVegetal
	WHERE Validade < now();
    
-- Total de encomendas
SELECT COUNT(*) AS TotalEncomendas FROM Encomenda;

-- Que funcionario cuidou do Animal X
CALL qualFuncionario(3);

-- Funcionários da Plantação X
CALL funcionariosDaPlantacao(3);

-- Quantidade em Stock do recurso X
SELECT quantidadeRecurso(4);

-- Valor das vendas totais de um cliente
SELECT totalVendasCliente(2);


-- Valor total das encomendas num intervalo de tempo
CALL valorVendasIntervalo('2018-01-01', now());


-- Valor total das vendas de um cliente
SELECT totalVendasCliente(2);


-- Calcula o valor de todas as vendas dos produtos provindos de certo animal
SELECT calculaVendaProdutosAnimal(8);
 
-- Altera informação de cliente (21)
CALL alteraCliente(21, 'Jerónimo Martins', 'E', '250912378');

-- Adiciona Cliente
CALL addCliente(22, 'Manuel Dias', 'I', '920358942');

