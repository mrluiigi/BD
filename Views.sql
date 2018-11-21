USE quinta;

-- Nome e Horário de funcionários
DROP VIEW Horarios;
CREATE VIEW Horarios AS
	SELECT F.Nome, F.Horário, FP.Plantação_ID, FA.Animal_ID FROM Funcionário AS F
		LEFT JOIN FuncionárioPlantação AS FP ON F.Número = FP.Funcionário_Número
		LEFT JOIN FuncionárioAnimal AS FA ON F.Número = FA.Funcionário_Número;

-- SELECT * FROM Horarios;