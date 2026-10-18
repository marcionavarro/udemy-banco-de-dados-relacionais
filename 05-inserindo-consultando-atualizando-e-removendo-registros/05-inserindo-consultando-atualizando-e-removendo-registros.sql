use universidade_u;

/* Select - Selecionando registros de tabelas */
select * from aluno;
select nome, idade, telefone from aluno;
select idade, telefone, nome from aluno;

/* Filtrando registros (Where) */
select * from aluno where sexo = 'F';
select * from aluno where valor_pago_curso < 600;
select * from aluno where valor_pago_curso > 600;
select * from aluno where valor_pago_curso <= 600.55;
select * from aluno where valor_pago_curso >= 655.45;

/* Select - Filtros com operadores de Comparação */
select * from aluno where sexo = 'M' AND ativo_sn = 1;
select * from aluno where sexo = 'M' AND ativo_sn = 1 AND valor_pago_curso <= 625;
select * from aluno where sexo = 'F' OR idade >= 40;

/* Select - Filtros com o operador Between */
select * from aluno where idade between 40 and 60;
select * from aluno where data_inscricao_curso between '2025-05-12' and '2026-11-18';

/* Select - Filtros com o operadore In */
select * from aluno where nome = 'Fernanda' OR nome = 'Maria' OR nome = 'Marcelo';
select * from aluno where nome in ('Fernanda', 'Maria', 'Marcelo');
select * from aluno where nome not in ('Fernanda', 'Maria', 'Marcelo');

/* Select - Filtros com o operador Like */
select * from aluno where nome like '%o';
select * from aluno where nome like '%r%';
select * from aluno where nome like 'm%';
select * from aluno where nome like 'm%a';
select * from aluno where nome like '_osé';
select * from aluno where nome like '_oã_';
select * from aluno where nome like '___é';
select * from aluno where nome like '%d_';

/* Select - Ordenando o resultado */
select * from aluno order by nome ASC;
select * from aluno order by valor_pago_curso DESC;
select * from aluno order by sexo ASC, idade DESC;

/* Update - Atualizando registros de tabelas */
update aluno set ativo_sn = 1, valor_pago_curso = 750 where nome = 'José';
update aluno set telefone = '11 8888-4444' where telefone = '11 7777-777';

/* Deletando registros de tabelas */
-- delete from aluno; -- Deleta todos os registros da tabela
delete from aluno where ativo_sn = 0;
delete from aluno where idade in(30,29) OR sexo = 'F';
delete from aluno where nome = 'Marcelo';


