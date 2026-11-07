use universidade_u;

-- Desativa o modo seguro para a sessão atual
SET SQL_SAFE_UPDATES = 0;

/* Select - Selecionando registros de tabelas */
select * from aluno;
select * from telefone;
select * from endereco;
select * from curso;

desc aluno;
desc telefone;
desc endereco;
desc cursos;
desc aluno_curso;

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

alter table telefone add column fk_idaluno int;

/* modify modificar */
alter table aluno modify column cpf varchar(14);
alter table aluno modify column telefone varchar(60);

/* drop remover */
alter table aluno drop column cpf;
alter table aluno drop column endereco;
alter table aluno drop column telefone;

update aluno set cpf = '111.111.111-11' where nome = 'João';
update aluno set cpf = '222.111.111-11' where nome = 'Fernanda';
update aluno set cpf = '333.111.111-11' where nome = 'José';
update aluno set cpf = '444.111.111-11' where nome = 'Maria';
update aluno set cpf = '555.111.111-11' where nome = 'Marcelo';

update aluno set nome = 'José' where cpf = '111.111.111-11';
update aluno set telefone = '11 5555-2222 11 3333-444' where idaluno = 1;

update aluno set logradouro = 'Avenida Paulista', numero = '1500', complemento = 'ap315', bairro = 'Bela Vista', cidade = 'São Paulo', estado = 'SP' where idaluno = 1;
update aluno set logradouro = 'Rua Francisco Sá', numero = '10', complemento = '', bairro = 'Gutierrez', cidade = 'Belo Horizonte', estado = 'MG' where idaluno = 2;
update aluno set logradouro = 'Avenida Dom Manuel', numero = '300', complemento = '', bairro = 'Centro', cidade = 'Fortaleza', estado = 'CE' where idaluno = 3;
update aluno set logradouro = 'Rua Miramar', numero = '1200', complemento = 'ap112', bairro = 'Rocas', cidade = 'Natal', estado = 'RN' where idaluno = 4;
update aluno set logradouro = 'Rua João de Abreu', numero = '650', complemento = '', bairro = 'Setor Oeste', cidade = 'Goiânia', estado = 'GO' where idaluno = 5;

update telefone set fk_idaluno = 1 where numero in('11 5555-2222', '11 3333-444');

CREATE TABLE TELEFONE (
    idtelefone int auto_increment PRIMARY KEY,
    numero varchar(20) not null,
    tipo enum('res', 'com', 'cel') not null,
    fk_idaluno int not null
);

select * from telefone where numero is null;
delete from telefone where idtelefone = 7;
alter table telefone modify column numero varchar(20) not null;
alter table telefone modify column  tipo enum('res', 'com', 'cel') not null;
alter table telefone modify column fk_idaluno int not null;

insert into telefone (numero, tipo) values ('11 5555-2222', 'res');
insert into telefone (numero, tipo) values ('11 3333-444', 'com');
insert into telefone(numero, tipo, fk_idaluno) values ('11 5555-5555', 'res', 4);
insert into telefone(numero, tipo, fk_idaluno) values ('11 5555-7777', 'res', 3), ('11 5555-8888', 'res', 3), ('11 5555-9999', 'com', 3);

CREATE TABLE ENDERECO (
    idendereco int auto_increment PRIMARY KEY,
    logradouro varchar(100),
    numero varchar(10),
    complemento varchar(20),
    bairro varchar(100),
    cidade varchar(50),
    estado char(2),
    fk_idaluno int
);

ALTER TABLE ENDERECO ADD CONSTRAINT fk_aluno_endereco
    FOREIGN KEY (fk_idaluno)
    REFERENCES ALUNO (idAluno);

insert into endereco (numero, logradouro, complemento, fk_idaluno, bairro, cidade, estado)    
select numero, logradouro, complemento, idaluno, bairro, cidade, estado from aluno;

alter table aluno drop column logradouro;
alter table aluno drop column numero;
alter table aluno drop column complemento;
alter table aluno drop column bairro;
alter table aluno drop column cidade;
alter table aluno drop column estado;


CREATE TABLE CURSO (
    idcurso int auto_increment PRIMARY KEY,
    descricao varchar(50)
);

select * from aluno;
select * from telefone;
select * from endereco;
select * from curso;

select * from endereco where fk_idaluno = 3;

insert into curso(descricao) values('Curso completo do Desenvolvedor NodeJs e MongoDB');
insert into curso(descricao) values('Desenvolvedor Multiplataforma Android e IOS');
insert into curso(descricao) values('Desenvolvimento Web com Angular');
insert into curso(descricao) values('Desenvolvimento Web completo 2026');


CREATE TABLE ALUNO_CURSO (
    id_alunocurso int auto_increment PRIMARY KEY,
    fk_idaluno int,
    fk_idcurso int
);

ALTER TABLE ALUNO_CURSO ADD CONSTRAINT fk_aluno_curso
    FOREIGN KEY (fk_idaluno)
    REFERENCES ALUNO (idAluno);
 
ALTER TABLE ALUNO_CURSO ADD CONSTRAINT fk_curso_aluno
    FOREIGN KEY (fk_idcurso)
    REFERENCES CURSO (idcurso);


select * from aluno;
select * from curso;
select * from telefone;
select * from aluno_curso;

insert into aluno_curso(fk_idaluno, fk_idcurso) values (1, 3);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (1, 4);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (2, 2);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (3, 1);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (3, 2);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (3, 3);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (3, 4);
insert into aluno_curso(fk_idaluno, fk_idcurso) values (4, 1);

select * from telefone;
alter table telefone drop column tipo;
alter table telefone add tipo enum('com', 'res', 'cel');
update telefone set tipo = 'res' where idtelefone = 1;
update telefone set tipo = 'cel' where idtelefone = 2;
update telefone set tipo = 'com' where idtelefone = 3;
update telefone set tipo = 'cel' where idtelefone = 4;
update telefone set tipo = 'com' where idtelefone = 5;
update telefone set tipo = 'res' where idtelefone = 6;


insert into telefone(numero, fk_idaluno, tipo) values (null, null, null);

select * from aluno where cpf = '333.111.111-11';
update aluno set cpf = '333.222.111-11' where idaluno = 3;

alter table aluno add constraint uc_aluno_cpf unique(cpf);

insert into aluno(sexo, idade, email, data_inscricao_curso, valor_pago_curso, ativo_sn, nome, cpf) 
values ('F', 25, 'rosa@teste.com.br', '2026-11-07', 625, 1, 'Rosa', '444.111.111-12');

desc aluno;
desc endereco;

alter table aluno add constraint uc_aluno_email unique(email);

select * from aluno;
select * from endereco;
insert into endereco(logradouro, numero, complemento, bairro, cidade, estado, fk_idaluno)
values('Avenida Paulista', 500, null, 'Bela Vista', 'São Paulo', 'SP', 7);

delete from endereco where idendereco = 8;

alter table endereco add constraint uc_endereco_fkidaluno unique(fk_idaluno);


 /* count */
select * from aluno;
select valor_pago_curso as valor_pago, nome  from aluno;
select count(*) from aluno;
select count(*) from aluno where sexo = 'F';
select count(distinct nome) from aluno;

 /* max */
select max(valor_pago_curso) from aluno;
select max(valor_pago_curso) from aluno where idade > 40;
select max(valor_pago_curso) from aluno where idade < 40;

 /* min */
select min(valor_pago_curso) from aluno;
select min(valor_pago_curso) from aluno where ativo_sn != 0;

 /* avg */
select avg(valor_pago_curso) from aluno;
select avg(valor_pago_curso) from aluno where nome = 'José';

 /* sum */
select sum(valor_pago_curso) from aluno;
select sum(valor_pago_curso) from aluno where nome = 'José';

select count(*), max(valor_pago_curso),  min(valor_pago_curso), avg(valor_pago_curso), sum(valor_pago_curso) from aluno;
select count(*), max(valor_pago_curso),  min(valor_pago_curso), avg(valor_pago_curso), sum(valor_pago_curso) from aluno where ativo_sn = 1;
select 
	count(*) as quantidade, 
	max(valor_pago_curso) as maior_valor,  
	min(valor_pago_curso) as menor_valor, 
	avg(valor_pago_curso) as media, 
	sum(valor_pago_curso) as soma
from aluno where ativo_sn = 1;

/* ceil - arrendonda o valor para cima */
select 17.4 as valor;
select ceil(17.4) as valor;

/* floor - arrendonda o valor para baixo */
select 19.555 as valor;
select floor(19.555) as valor;

/* truncate - trunca a fração */
select 22.757 as valor;
select truncate(22.757) as valor;


