USE quinta;


INSERT INTO animal
		(Espécie, Peso, DataNascimento, ValidadeVacina)
        VALUES
        ('Vaca', 1000, '2000/12/03', '2020/08/20'),
        ('Vaca', 1200, '2004/10/02', '2024/07/22'),
        ('Galinha', 3, '2013/01/20', '2021/03/13'),
        ('Cabra', 50, '2010/04/11', '2024/05/23');

INSERT INTO recurso
		(Tipo, Fornecedor, Preco, Stock)
        VALUES
        ('Água', 'Câmara Municipal', 0.01, 100000),
        ('Adubo', 'ADP Fertilizantes', 0.50, 1000),
        ('Herbicida', 'Bayer', 20, 124),
        ('Farinha para galinhas', 'Loja do Gusto', 0.30, 700),
        ('Farinha para vacas', 'Utilagro', 0.35, 1820);

INSERT INTO AnimalRecurso
		(Animal_ID, Recurso_ID, QuantidadeConsumida, DataUltimoConsumo)
        VALUES
        (1, 1, 100, '2018-11-20'),
        (2, 1, 100, '2018-11-20');



-- Cuidado, aldrabice 
-- SET foreign_key_checks = 0;
-- TRUNCATE  TABLE AnimalRecurso;
-- SET foreign_key_checks = 1;

-- SELECT * FROM AnimalRecurso;

INSERT INTO cliente
                (NIF, Nome, Tipo, Contacto)
        VALUES
        (1, 'Pedro Barbosa', 'Individual', '937573882'),
        (2, 'José Pinto', 'Individual', '911326812'),
        (3, 'Luís Correia', 'Individual', '932444512'),
        (4, 'Ângelo Sousa', 'Individual', '923612821'),
        (5, 'Diogo Pereira', 'Individual', '937172018'),
        (6, 'André Guimarães', 'Individual', '923499865'),
        (7, 'Ricardo Ribeiro', 'Individual', '933475867'),
        (8, 'Andreia Sousa', 'Individual', '912341786'),
        (9, 'Joana Matos', 'Individual', '912091344'),
        (10, 'Margarida Maia', 'Individual', '964324187'),
        (11, 'Frutas, Lda', 'Empresa', '252900345'),
        (12, 'Adubos e Adubos', 'Empresa', '254272138'),
        (13, 'Ração Armindo', 'Empresa', '251298458');

-- SELECT * FROM cliente;


INSERT INTO funcionário
                (Nome, Tipo, Salário, Contacto, Horário)
        VALUES
        ('Gabriel Trovão', 'Animais', 750, '955521239', 'S'),
        ('Nuno Carvalho', 'Animais', 800, '940808728', 'S'),
        ('Simão Pereira', 'Plantas', 650, '969054305', 'S'),
        ('João Machado', 'Plantas', 675,  '919954869', 'S'),
        ('Beatriz Abreu', 'Animais', 725, '938003443', 'S'),
        ('Maria Silva', 'Animais', 825, '931116199', 'D'),
        ('Paulo Carvalho', 'Plantas', 925, '927680363', 'D'),
        ('Fábio Cunha', 'Plantas', 875, '961458206', 'D'),
        ('Filipa Machado', 'Animais', 950, '921072714', 'D'),
        ('Jéssica Patrícia', 'Plantas', 1000, '960591820', 'D');

-- SELECT * FROM funcionário;


INSERT INTO plantação
                (Tipo, Area, MesColheita)
        VALUES
        ('Terrestres', 10, 4),
        ('Terrestres', 10, 5),
        ('Terrestres', 10, 6),
        ('Terrestres', 10, 10),
        ('Medicinais', 2, 11),
        ('Medicinais', 2, 12),
        ('Medicinais', 3, 7),
        ('Ornamentais', 5, 5),
        ('Ornamentais', 5, 6),
        ('Ornamentais', 5, 6);

-- SELECT * FROM plantação;

INSERT INTO FuncionárioAnimal
	(Funcionário_Número, Animal_ID)
    VALUES
		(1, 1),
        (10, 2),
        (7, 3),
        (5, 4);
        
INSERT INTO FuncionárioPlantação
	(Funcionário_Número, Plantação_ID)
    VALUES
		(5, 1),
        (10, 2),
        (6, 3),
        (8, 4),
        (4, 5),
        (10 , 6),
        (3 , 7),
        (10 , 8),
        (7 , 9),
        (1 , 10);

INSERT INTO PlantaçãoRecurso
		(Plantação_ID, Recurso_ID, QuantidadeConsumida, DataUltimoConsumo)
        VALUES
        (1, 1, 100, '2018-11-20'),
        (2, 1, 100, '2018-11-20'),
        (3, 1, 100, '2018-11-20'),
        (4, 1, 100, '2018-11-20');



INSERT INTO produtoanimal
                (Designacao, Preco, Stock, Validade, Animal_ID)
        VALUES
        ('Ovos', 0.89, 750, "2019-03-11", 1),
        ('Leite', 1.19, 1500, "2019-05-23", 2),
        ('Lã', 50, 200, "9999-01-01", 3),
        ('Mel', 14.76, 250, "2020-01-31", 4),
        ('Carne', 17.23, 500, "2018-12-20", 2);

-- SELECT * FROM produtoanimal;


INSERT INTO produtovegetal
                (Designacao, Preco, Stock, Validade, Plantação_ID)
        VALUES
        ('Cenouras', 0.75, 1500, "2018-12-23", 1),
        ('Batatas', 5.45, 1750, "2018-12-21", 2),
        ('Cebola', 1.13, 2000, "2019-1-2", 3),
        ('Beterraba', 6.95, 1000, "2019-1-12", 4),
        ('Camomila', 40, 100, "2019-05-13", 5),
        ('Agrião', 11.93, 200, "2019-06-14", 6),
        ('Alfazema', 37.80, 115, "2019-8-11", 7),
        ('Rosas', 0.47, 350, "2018-11-30", 8),
        ('Papoilas', 0.87, 300, "2018-11-30", 9),
        ('Tulipas', 0.56, 275, "2018-11-30", 10);

-- SELECT * FROM produtovegetal;

INSERT INTO encomenda
                (Valor, Data, Cliente)
        VALUES
        (2500, "2018-06-12", 1),
        (3000, "2018-11-09", 2),
        (750, "2018-11-03", 3),
        (250, "2018-4-23", 4),
        (10000, "2018-1-11", 5);

INSERT INTO produtoAnimalEncomenda
                (ProdutoAnimal_ID, Encomenda_ID, Quantidade)
        VALUES
        (1, 3, 50),
        (2, 4, 100),
        (3, 2, 10),
        (4, 1, 5),
        (5, 5, 20),
        (2, 5, 10),
        (1, 4, 24);
        
INSERT INTO produtoVegetalEncomenda
                (ProdutoVegetal_ID, Encomenda_ID, Quantidade)
        VALUES
        (1, 2, 20),
        (2, 3, 55),
        (3, 3, 25),
        (8, 1, 10),
        (4, 4, 15),
        (6, 5, 5);
        
        

-- SELECT * FROM encomenda;
