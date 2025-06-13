-- Verifique quem está autorizado
SELECT * FROM leitores
WHERE autorizado = 1;
-- Filtre empréstimos no dia do desaparecimento (2023-11-15)
SELECT * FROM emprestimos
WHERE data_emprestimo = '2023-11-15';
--Descubra quem pegou qual livro nesse dia
SELECT 
	a.nome,
    b.data_emprestimo,
    c.titulo
FROM leitores as a
join emprestimos  as b ON a.id_leitor = b.id_leitor
join livros as c on b.id_livro = c.id_livro
WHERE b.data_emprestimo = '2023-11-15';
--Descubra qual livro tem apenas 1 exemplar (raro)
SELECT * from livros
where quantidade_estoque = 1;
--Quantos livros cada pessoa pegou naquela noite?
SELECT 
	a.nome,
    count(b.id_emprestimo) as quant_emprestimo
from leitores AS a
join emprestimos as b on a.id_leitor = b.id_leitor
where data_emprestimo = '2023-11-15'
GROUP bY a.nome
order by quant_emprestimo desc;
--Quem pegou esse livro raro na data?
SELECT 
	a.nome,
    c.titulo,
    b.data_emprestimo
from leitores as a
join emprestimos as b on a.id_leitor = b.id_leitor
join livros as c on b.id_livro = c.id_livro
where b.data_emprestimo = '2023-11-15' and c.id_livro = '3'
--Filtrar apenas leitores autorizados que pegaram o livro raro:
SELECT 
	a.nome,
    a.autorizado,
    c.titulo,
    b.data_emprestimo
from leitores as a
join emprestimos as b on a.id_leitor = b.id_leitor
join livros as c on b.id_livro = c.id_livro
where b.data_emprestimo = '2023-11-15' and c.id_livro = '3' and a.autorizado = '1';