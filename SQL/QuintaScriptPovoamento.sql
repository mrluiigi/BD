USE quinta;




INSERT INTO animal
		(Espécie, Peso, DataNascimento, ValidadeVacina, Género, Vida)
        VALUES
        -- 0
		('Vaca minhota', 739, '2015/07/23', '2020/12/03', 'F', 'M'),
        ('Vaca minhota', 730, '2016/07/03', '2016/12/03', 'F', 'M'),
		('Vaca minhota', 1182, '2016/10/02', '2020/10/02', 'M', 'V'),
        ('Vaca minhota', 734, '2017/08/02', '2022/10/02', 'F', 'V'),       
        ('Vaca minhota', 696, '2017/08/30', '2020/12/03', 'F', 'V'),
        ('Vaca minhota', 320, '2018/06/02', '2023/02/02', 'F', 'V'),
        -- 6
        ('Galinha Amarela', 1.183, '2016/04/20', '2021/04/20', 'M', 'M'),
        ('Galinha Amarela', 0.913, '2016/04/20', '2021/04/20', 'F', 'M'),
        ('Galinha Amarela', 0.855, '2016/04/20', '2021/04/20', 'F', 'M'),
        ('Galinha Amarela', 1.23, '2016/04/20', '2021/04/20', 'F', 'M'),
        ('Galinha Amarela', 1.06, '2016/04/20', '2021/04/20', 'F', 'M'),
        ('Galinha Amarela', 0.944, '2016/04/20', '2021/04/21', 'F', 'M'),
        -- 12
        ('Galinha Amarela', 1.31, '2017/05/12', '2022/05/12', 'F', 'V'),
        ('Galinha Amarela', 1.41, '2017/05/12', '2022/05/12', 'F', 'V'),
        ('Galinha Amarela', 1.551, '2017/05/12', '2022/05/12', 'M', 'V'),
        ('Galinha Amarela', 1.33, '2017/05/12', '2022/05/12', 'F', 'V'),
        -- 16
        ('Galinha Amarela', 1.34, '2018/04/03', '2023/04/03', 'F', 'V'),
        ('Galinha Amarela', 0.922, '2018/04/03', '2023/04/03', 'F', 'V'),
        ('Galinha Amarela', 0.843, '2018/04/03', '2023/04/03', 'F', 'V'),
        ('Galinha Amarela', 0.941, '2018/04/03', '2023/04/03', 'F', 'V'),
        ('Galinha Amarela', 1.220, '2018/04/03', '2023/04/03', 'M', 'V'),
        -- 21
		('Coelho europeu', 1.234 , '2016/05/07', '2021/05/07', 'F', 'M'),
        ('Coelho europeu', 1.156 , '2016/05/07', '2021/05/07', 'M', 'M'),
        ('Coelho europeu', 1.205 , '2016/05/07', '2021/05/07', 'M', 'M'),
        ('Coelho europeu', 1.356 , '2016/05/07', '2021/05/07', 'F', 'M'),
        -- 25
		('Coelho europeu', 1.304 , '2017/04/03', '2022/04/03', 'F', 'V'),
        ('Coelho europeu', 1.391 , '2017/04/03', '2022/04/03', 'M', 'V'),
        ('Coelho europeu', 1.187 , '2017/04/03', '2022/04/03', 'F', 'V'),
        ('Coelho europeu', 1.095 , '2017/04/03', '2022/04/03', 'M', 'V'),
        ('Coelho europeu', 1.142 , '2017/04/03', '2022/04/03', 'F', 'V'),
        -- 30	
		('Ovelha Lacaune', 72, '2016/02/28', '2020/06/01', 'F', 'V'),
        ('Ovelha Lacaune', 73, '2016/01/31', '2020/04/02', 'F', 'V'),
        ('Ovelha Lacaune', 77, '2015/04/02', '2021/07/04', 'F', 'V'),
        ('Ovelha Lacaune', 75, '2015/11/03', '2022/01/05', 'F', 'V'),
        ('Ovelha Lacaune', 74, '2015/08/14', '2021/09/16', 'F', 'V'),
		-- 35
        ('Ovelha Merino', 50, '2014/05/07', '2018/12/03', 'F', 'V'), 
        ('Ovelha Merino', 55, '2015/09/23', '2019/11/28', 'M', 'V'),
        ('Ovelha Merino', 53, '2015/09/22', '2019/12/22', 'M', 'M'),
        ('Ovelha Merino', 47, '2016/04/27', '2020/06/01', 'F', 'M'),
        ('Ovelha Merino', 58, '2016/10/16', '2020/11/18', 'M', 'M');

		-- SELECT * FROM animal;

INSERT INTO recurso
		(Tipo, Fornecedor, Preco, Stock)
        VALUES
        ('Água', 'Câmara Municipal', 0.005, 100000),
        ('Adubo', 'ADP Fertilizantes', 0.50, 1000),
        ('Herbicida', 'Bayer', 20, 124),
        ('Farinha para galinhas', 'Loja do Gusto', 0.12, 700),
        ('Farinha para vacas', 'Utilagro', 0.25, 1820),
        ('Farinha para coelhos', 'Utilagro', 0.17, 1300),
        ('Farinha para ovelhas', 'Utilagro', 0.21, 1500);
        
        -- SELECT * FROM recurso;

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
        (21, 4, 44, '2018-04-19'),
        
		(22, 1, 203, '2017-11-17'),
		(23, 1, 192, '2017-11-17'),
		(24, 1, 212, '2017-11-17'),
		(25, 1, 198, '2017-11-17'),
		(22, 6, 145, '2017-11-17'),
		(23, 6, 139, '2017-11-17'),
		(24, 6, 152, '2017-11-17'),
		(25, 6, 146, '2017-11-17'),
        
        (26, 1, 202, '2017-11-17'),
		(27, 1, 194, '2017-11-17'),
		(28, 1, 211, '2017-11-17'),
		(29, 1, 188, '2017-11-17'),
        (30, 1, 178, '2017-11-17'),
		(26, 6, 135, '2017-11-17'),
		(27, 6, 129, '2017-11-17'),
		(28, 6, 154, '2017-11-17'),
		(29, 6, 143, '2017-11-17'),
        (30, 6, 188, '2017-11-17'),
        
        (31, 1, 149, '2018/11/20'),
        (32, 1, 152, '2018/11/20'),
        (33, 1, 137, '2018/11/20'),
        (34, 1, 161, '2018/11/20'),
        (35, 1, 155, '2018/11/20'),
        (31, 7, 100, '2018/11/20'),
        (32, 7, 107, '2018/11/20'),
        (33, 7, 110, '2018/11/20'),
        (34, 7, 105, '2018/11/20'),
        (35, 7, 103, '2018/11/20'),
        
        (36, 1, 160, '2018/11/20'),
        (37, 1, 165, '2018/11/20'),
        (38, 1, 163, '2018/09/28'),
        (39, 1, 157, '2018/09/28'),
        (40, 1, 148, '2018/09/28'),
        (36, 7, 110, '2018/11/20'),
        (37, 7, 116, '2018/11/20'),
        (38, 7, 113, '2018/09/28'),
        (39, 7, 107, '2018/09/28'),
        (40,7 , 109, '2018/09/28');
        
       -- SELECT * FROM AnimalRecurso;

INSERT INTO cliente
                (NIF, Nome, Tipo, Contacto)
        VALUES
        (1, 'Pedro Barbosa', 'I', '937573882'),
        (2, 'José Pinto', 'I', '911326812'),
        (3, 'Luís Correia', 'I', '932444512'),
        (4, 'Ângelo Sousa', 'I', '923612821'),
        (5, 'Diogo Pereira', 'I', '937172018'),
        (6, 'Margarida Maia', 'I', '964324187'),
        
        (7, 'Roupas, Lda', 'E', '252900345'),
        (8, 'Ervas Medicinais, Lda', 'E', '254272138'),
        (9, 'Ração Armindo', 'E', '251298458'),
        (10, 'Talho Macedo', 'E', '251977660'),
        (11, 'Lacticinios Antóni', 'E', '253473129');
        
        -- SELECT * FROM cliente;

INSERT INTO funcionário
                (Nome, Tipo, Salário, Contacto, Horário)
        VALUES
        ('Gabriel Trovão', 'T', 750, '955521239', 'S'),
        ('Nuno Carvalho', 'A', 800, '940808728', 'S'),
        ('Simão Pereira', 'P', 650, '969054305', 'S'),
        ('João Machado', 'P', 675,  '919954869', 'S'),
        ('Beatriz Abreu', 'T', 725, '938003443', 'S'),
        ('Maria Silva', 'A', 825, '931116199', 'D'),
        ('Paulo Carvalho', 'T', 925, '927680363', 'D'),
        ('Fábio Cunha', 'P', 875, '961458206', 'D'),
        ('Filipa Machado', 'A', 950, '921072714', 'D'),
        ('Jéssica Patrícia', 'T', 1000, '960591820', 'D'),
        ('João Matos', 'A' , 890, '917694787', 'D'),
        ('Andreia Rodrigues', 'A', 900, '936726675', 'S');

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
		(2,1),
        (2,2),
        (2,3),
        (2,4),
        (2,5),
        (2,6),
        
        (9,7),
        (9,8),
        (9,9),
        (9,10),
        (9,11),
        (9,12),
        (9,13),
        (9,14),
        (9,15),
        (9,16),
        (9,17),
        (9,18),
        (9,19),
        (9,20),
        (9,21),
        
        (1,22),
        (1,23),
        
        (2,24),
        (2,25),
        
        (5,26),
        (5,27),
        
        (10,28),
        (10,29),
        (10,30),
        
        (11, 31),
        (11, 32),
        (11, 33),
        (11, 34),
        (11, 35),
        
        (12, 36),
        (12, 37),
        (12, 38),
        (12, 39),
        (12, 40);
        
        -- SELECT * FROM FuncionárioAnimal;
        
INSERT INTO FuncionárioPlantação
	(Funcionário_Número, Plantação_ID)
    VALUES
		(5, 1),
        (10, 2),
        
        (6, 3),
        (8, 3),
        (6, 4),
        (8, 4),
        
        (4, 5),
        (3, 5),
        (4, 6),
        (3, 6),
        
        (7, 7),
        (7, 8),
        
        (2 , 9),
        (1 , 10);
        
        -- SELECT * FROM funcionárioPlantação;

INSERT INTO PlantaçãoRecurso
		(Plantação_ID, Recurso_ID, QuantidadeConsumida, DataUltimoConsumo)
        VALUES
        (1, 1, 100, '2018-11-20'),
        (1, 2, 3, '2018/11/01'),
        (1, 3, 1, '2018/10/01'),
        
        (2, 1, 100, '2018-11-20'),
        (2, 2, 3, '2018/11/01'),
        (2, 3, 1, '2018/10/01'),
        
        (3, 1, 100, '2018-11-20'),
        (3, 2, 3, '2018/11/01'),
        (3, 3, 1, '2018/10/01'),
        
        (4, 1, 100, '2018-11-20'),
        (4, 2, 3, '2018/11/01'),
        (4, 3, 1, '2018/10/01'),
        
        (5, 1, 100, '2018-11-20'),
        (5, 2, 3, '2018/11/01'),
        (5, 3, 1, '2018/10/01'),
        
        (6, 1, 100, '2018-11-20'),
        (6, 2, 3, '2018/11/01'),
        (6, 3, 1, '2018/10/02'),
        
        (7, 1, 100, '2018-11-20'),
        (7, 2, 3, '2018/11/01'),
        (7, 3, 1, '2018/10/01'),
        
        (8, 1, 100, '2018-11-20'),
        (8, 2, 3, '2018/11/01'),
        (8, 3, 1, '2018/10/01'),
        
        (9, 1, 100, '2018-11-20'),
        (9, 2, 3, '2018/11/01'),
        (9, 3, 1, '2018/10/01'),
        
        (10, 1, 100, '2018-11-20'),
		(10, 2, 3, '2018/11/01'),
        (10, 3, 1, '2018/10/01');
        
		-- SELECT * FROM plantaçãoRecurso;

INSERT INTO produtoanimal
                (Designacao, Preco, Stock, Validade, Animal_ID)
        VALUES
        ('Ovos', 0.89, 0, '2017-04-23', 8), -- 1
        ('Ovos', 0.89, 2, '2017-05-23', 8), -- 2
        
        ('Ovos', 0.89, 0, '2017-03-14', 9), -- 3
        ('Ovos', 0.89, 1, '2017-04-14', 9), -- 4
		
        ('Ovos', 0.89, 0, '2017-03-21', 10),
        ('Ovos', 0.89, 1, '2017-04-21', 10),
        
        ('Ovos', 0.89, 0, '2017-04-01', 11),
        ('Ovos', 0.89, 2, '2017-05-01', 11),
        
        ('Ovos', 0.89, 0, '2017-03-19', 12),
        ('Ovos', 0.89, 0, '2017-04-19', 12), -- 10
        
		('Ovos', 0.89, 0, '2018-04-09', 13),
        ('Ovos', 0.89, 0, '2018-03-23', 13),
        
		('Ovos', 0.89, 0, '2018-04-14', 14),
        ('Ovos', 0.89, 0, '2018-04-01', 14), -- 14
        
		('Ovos', 0.89, 0, '2018-04-06', 16), -- 15
		('Ovos', 0.89, 1, '2018-03-21', 16), -- 16
        
        ('Leite de Vaca', 1.19, 500, '2019-02-23', 1), -- 17
        ('Leite de Vaca', 1.19, 473, '2019-01-17', 2), -- 18
        ('Leite de Vaca', 1.19, 389, '2019-02-03', 3), -- 19
        ('Leite de Vaca', 1.19, 430, '2019-01-22', 4), -- 20
        ('Leite de Vaca', 1.19, 238, '2019-02-26', 5), -- 21
        ('Leite de Vaca', 1.19, 300, '2019-02-07', 6), -- 22
        
        ('Carne de Vaca', 17.23, 29, '2018-11-15', 1), -- 23
        ('Carne de Vaca', 17.23, 40, '2018-12-20', 2), -- 24
        
		('Lã', 7.75, 0, null, 38), -- 25
        ('Lã', 7.75, 0, null, 39), -- 26
        ('Lã', 7.75, 0, null, 40), -- 27
        
        ('Carne de Ovelha', 8.99, 3, '2019/01/14', 36), -- 28
        ('Carne de Ovelha', 8.99, 1, '2019/01/12', 37), -- 29
        ('Carne de Ovelha', 8.99, 0, '2018/12/22', 38), -- 30
        
        ('Leite de Ovelha', 3.15, 21, '2019/05/01', 31), -- 31
        ('Leite de Ovelha', 3.15, 12, '2019/06/10', 32), -- 32
        ('Leite de Ovelha', 3.15, 3, '2019/06/16', 33); -- 33

		-- SELECT * FROM produtoanimal;


INSERT INTO produtovegetal
                (Designacao, Preco, Stock, Validade, Plantação_ID)
        VALUES
        ('Cenouras', 0.75, 432, '2018-12-23', 1),
        ('Batatas', 1.79, 489, '2018-12-21', 2),
        ('Cebola', 1.13, 500, '2019-1-2', 3),
        ('Beterraba', 6.95, 328, '2019-1-12', 4),
        ('Camomila', 40, 20, '2019-05-13', 5),
        ('Agrião', 11.93, 72, '2019-06-14', 6),
        ('Alfazema', 37.80, 67, '2019-8-11', 7),
        ('Rosas', 0.47, 278, '2018-11-30', 8),
        ('Papoilas', 0.87, 139, '2018-11-30', 9),
        ('Tulipas', 0.56, 184, '2018-11-30', 10);

		-- SELECT * FROM produtovegetal;

INSERT INTO encomenda
                (Valor, Data, Cliente)
        VALUES
        (13.35, '2018-06-12', 1),
        (18.69, '2018-11-09', 2),
        (137.38, '2018-11-03', 3),
        (114.93, '2018-4-23', 4),
        (82.59, '2018-1-11', 5),
        (72.65, '2018/11/10', 6),
        
        (69.75, '2018/10/20', 7),
        (6759.25, '2018/10/13', 8),
        (6462.5, '2018/10/11', 9),
        (3554.65, '2018/09/30', 10),
        (1085.7, '2018/10/03', 11);
        
        -- SELECT * FROM encomenda;

INSERT INTO produtoAnimalEncomenda
                (ProdutoAnimal_ID, Encomenda_ID, Quantidade)
        VALUES
        (1, 1, 3),
        (2, 1, 3),
        (3, 1, 2),
        (4, 1, 2),
        (5, 1, 5),
        
        (6, 2, 5),
        (7, 2, 4),
        (8, 2, 4),
        (9, 2, 4),
        (10, 2, 4),
        
        (11, 3, 4),
        (12, 3, 4),
        (13, 3, 4),
        
        (14, 4, 4),
        (15, 4, 4),
        (16, 4, 4),

        (17, 5, 10),
        (13, 5, 3),
        
        (17, 6, 1),
        (23, 6, 4),
        (31, 6, 5),
        
        (25, 7, 3),
        (26, 7, 3),
        (27, 7, 3),
        
        (23 , 10, 100),
        (24 , 10, 75),
        (28 , 10, 20),
        (29 , 10, 20),
        (30 , 10, 20),
        
        (17, 11, 300),
        (19, 11, 150),
        (18, 11, 150),
        (31, 11, 50),
        (32, 11, 45),
        (33, 11, 23);
        
        -- SELECT * FROM produtoAnimalEncomenda;
        
INSERT INTO produtoVegetalEncomenda
                (ProdutoVegetal_ID, Encomenda_ID, Quantidade)
        VALUES        
        (2, 3, 55),
        (3, 3, 25),
        
        (4, 4, 15),
        
        (8, 5, 10),
        (9, 5, 10),
        (10, 5, 10),
        
        (1, 6, 5),
        (2, 6, 5),
        (8, 6, 15),
        
        (5, 8, 75),
        (6, 8, 125),
        (7, 8, 60),
        
        (1, 9, 1000),
        (2, 9, 1250),
        (4, 9, 500);
        
        -- SELECT * FROM produtoVegetalEncomenda;