USE quinta;

-- Nome e Horário de funcionários
CREATE VIEW Horarios AS
	SELECT F.Nome, F.Horário FROM Funcionário AS F;

-- SELECT * FROM Horarios;