-- ----------------------
-- consultas basicas
-- ----------------------
select * from aluno;

-- select
-- from
-- where
-- order by

SELECT *
FROM aluno
WHERE matricula > 3
order by nome;

-- operadores matematicos e logicos:
SELECT * FROM disciplina;

SELECT nome, horas
from disciplina
where horas >= 40 AND horas <= 50;

SELECT nome as nome_disciplina, horas as carga_horaria #mudança de nome para colula com comando AS
FROM disciplina;

-- exiba da tabela professor, todos os professores por ordem alfabetica
-- onde o professor tenha id maior que 2 e menor que 6
-- nao exibindo a especialização e mudando a coluna "nome" para "nome_professor"

SELECT id, nome AS Nome_Professor
FROM professor
WHERE id > 2 AND ID < 6
ORDER BY NOME;


-- exemplo: contar quantas disciplinas existem
SELECT COUNT(*) AS QUANTIDADE_DE_DISCIPLINAS
FROM disciplina
WHERE horas > 50;


SELECT count(*) AS QuantidadeMatriculas
FROM matricula
WHERE Curso_id = 2;


















