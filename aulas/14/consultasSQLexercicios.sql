Execute o script na raiz desse repositório chamado "gestao_academica.sql" (caso já tenha o banco, drop o schema e crie um novo com base nesse script).

Crie um novo script e cole nele os seguintes comentários:

-- Selecionar todos os alunos
SELECT *
FROM ALUNO;

-- Selecionar apenas os nomes e CPFs dos alunos
SELECT ALUNO.CPF
FROM ALUNO;

-- Selecionar alunos matriculados após uma data específica
SELECT Aluno.nome, Matricula.DataMatricula
FROM Aluno
JOIN Matricula ON Aluno_ID = Matricula.aluno_id
WHERE Matricula.DataMatricula > '2024-02-01';


-- Contar quantas disciplinas existem com carga horária maior que X
SELECT *
FROM DISCIPLINA
WHERE HORAS > 45;

-- Contar quantas matrículas existem para cada curso
SELECT count(*)
FROM MATRICULA;

-- Contar quantas disciplinas cada professor leciona
SELECT COUNT(*)
FROM professores_disciplinas;

-- Combinar nome do aluno e data da matrícula
SELECT ALUNO.NOME, MATRICULA.DataMatricula
FROM ALUNO
join matricula on aluno.matricula = matricula.aluno_id;

-- Combinar nome do curso e nome do aluno
select curso.nome as curso_nome, aluno.nome as aluno_nome
from aluno
join curso on curso.id = aluno.matricula;

-- Contar quantos alunos se matricularam em cada curso
SELECT COUNT(NOME)
FROM CURSO;


Resolva as consultas que conseguir. Para as que não conseguir, adicione comentários informando suas dúvidas e até onde conseguiu evoluir seu código.

Envie um commit com a solução para o sue respositório e me encaminhe o link no Teams.

Exemplo Join N*N

-- Selecionar professores e disciplinas associadas
SELECT Professor.Nome AS Professor, Disciplina.Nome AS Disciplina
FROM Professor
JOIN professores_disciplinas 
ON Professor.ID = professores_disciplinas.Professor_ID
JOIN disciplina 
ON professores_disciplinas.Disciplina_ID = disciplina.Id;