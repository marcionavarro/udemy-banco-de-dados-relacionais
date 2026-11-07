use universidade_u;

-- Desativa o modo seguro para a sessão atual
SET SQL_SAFE_UPDATES = 0;

/* Select - Selecionando registros de tabelas */
select * from aluno;
select * from aluno where cpf = '333.111.111-11';
select * from aluno where nome = 'José';
select * from aluno where idaluno = 4;

desc aluno;

/* add inclusão */
alter table aluno add cpf varchar(11) after email;
alter table aluno add email varchar(150) after idade;
alter table aluno add cpf varchar(14) after email;

alter table aluno add idaluno int primary key auto_increment;

alter table aluno add logradouro varchar(100);
alter table aluno add numero varchar(10);
alter table aluno add complemento varchar(20);
alter table aluno add bairro varchar(100);
alter table aluno add cidade varchar(50);
alter table aluno add estado char(2);

/* modify modificar */
alter table aluno modify column cpf varchar(14);

/* drop remover */
alter table aluno drop column cpf;

update aluno set cpf = '111.111.111-11' where nome = 'João';
update aluno set cpf = '222.111.111-11' where nome = 'Fernanda';
update aluno set cpf = '333.111.111-11' where nome = 'José';
update aluno set cpf = '444.111.111-11' where nome = 'Maria';
update aluno set cpf = '555.111.111-11' where nome = 'Marcelo';

update aluno set nome = 'José' where cpf = '111.111.111-11';

