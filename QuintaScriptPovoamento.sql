USE quinta;




INSERT INTO animal
		(Espécie, Peso, DataNascimento, ValidadeVacina, Género, Vida)
        VALUES
        -- 0
		('Vaca minhota', 739, '2015/07/23', '2020/12/03', 'F', 'M'),
        ('Vaca minhota', 730, '2016/07/03', '2016/12/03', 'F', 'V'),
		('Vaca minhota', 1182, '2016/10/02', '2020/10/02', 'M', 'V'),
        ('Vaca minhota', 734, '2017/08/02', '2022/10/02', 'F', 'V'),       
        ('Vaca minhota', 696, '2017/08/30', '2020/12/03', 'F', 'V'),
        ('Vaca minhota', 320, '2018/06/02', '2023/02/02', 'F', 'V'),
        -- 6
        ('Galinha Amarela', 1.18, '2016/04/20', '2021/04/20', 'M', 'M'),
        ('Galinha Amarela', 1.53, '2016/04/20', '2021/04/20', 'F', 'M'),
        ('Galinha Amarela', 1.55, '2016/04/20', '2021/04/20', 'F', 'M'),
        ('Galinha Amarela', 1.23, '2016/04/20', '2021/04/20', 'F', 'M'),
        ('Galinha Amarela', 1.61, '2016/04/20', '2021/04/20', 'F', 'M'),
        ('Galinha Amarela', 1.44, '2016/04/20', '2021/04/21', 'F', 'M'),
        -- 12
        ('Galinha Amarela', 1.31, '2017/05/12', '2022/05/12', 'F', 'V'),
        ('Galinha Amarela', 1.41, '2017/05/12', '2022/05/12', 'F', 'V'),
        ('Galinha Amarela', 2.05, '2017/05/12', '2022/05/12', 'M', 'V'),
        ('Galinha Amarela', 1.33, '2017/05/12', '2022/05/12', 'F', 'V'),
        -- 16
        ('Galinha Amarela', 1.34, '2018/04/03', '2023/04/03', 'F', 'V'),
        ('Galinha Amarela', 1.22, '2018/04/03', '2023/04/03', 'F', 'V'),
        ('Galinha Amarela', 1.43, '2018/04/03', '2023/04/03', 'F', 'V'),
        ('Galinha Amarela', 1.41, '2018/04/03', '2023/04/03', 'F', 'V'),
        ('Galinha Amarela', 2.0, '2018/04/03', '2023/04/03', 'M', 'V');
        -- 21

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
        (1, 1, 40122, '2018-01-10'),
        (2, 1, 26425, '2018-11-20'),
        (3, 1, 23586, '2018-11-20'),
        (4, 1, 13495, '2018-11-20'),
        (5, 1, 12245, '2018-11-20'),
        (6, 1, 7421, '2018-11-20'),
        (1, 5, 12554, '2018-01-10'),
        (2, 5, 10242, '2018-11-20'),
        (3, 5, 11041, '2018-11-20'),
        (4, 5, 5042, '2018-11-20'),
        (5, 5, 5125, '2018-11-20'),
        (6, 5, 2020, '2018-11-20'),
        
        
		(7, 1, 253, '2018-04-22'),
        (8, 1, 247, '2018-04-22'),
        (9, 1, 291, '2018-04-22'),
        (10, 1, 214, '2018-04-22'),
        (11, 1, 242, '2018-04-23'),
        (12, 1, 262, '2018-04-23'),
        (7, 4, 70, '2018-04-22'),
        (8, 4, 83, '2018-04-22'),
        (9, 4, 84, '2018-04-22'),
        (10, 4, 81, '2018-04-22'),
        (11, 4, 79, '2018-04-23'),
        (12, 4, 88, '2018-04-23'),
        
        (13, 1, 223, '2018-11-20'),
        (14, 1, 247, '2018-11-20'),
        (15, 1, 211, '2018-11-20'),
        (16, 1, 261, '2018-11-20'),
        (13, 4, 73, '2018-11-20'),
        (14, 4, 77, '2018-11-20'),
        (15, 4, 71, '2018-11-20'),
        (16, 4, 71, '2018-11-20'),
        
        (17, 1, 151, '2018-04-17'),
        (18, 1, 145, '2018-04-17'),
        (19, 1, 112, '2018-04-18'),
        (20, 1, 145, '2018-04-18'),
        (21, 1, 172, '2018-04-19'),
        (17, 4, 41, '2018-04-17'),
        (18, 4, 45, '2018-04-17'),
        (19, 4, 42, '2018-04-18'),
        (20, 4, 45, '2018-04-18'),
        (21, 4, 44, '2018-04-19');
      



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
        ('Estufa', 10, 4),
        ('Exterior', 10, 5),
        ('Exterior', 10, 6),
        ('Estufa', 10, 10),
        ('Exterior', 2, 11),
        ('Estufa', 2, 12),
        ('Exterior', 3, 7),
        ('Estufa', 5, 5),
        ('Estufa', 5, 6),
        ('Exterior', 5, 6);

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
