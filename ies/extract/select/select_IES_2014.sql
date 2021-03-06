use dataviva_raw;

-- Filtro e seleção da tabela Aluno

create table IES_2014_ALUNO_STEP1 
select CO_IES, CO_CATEGORIA_ADMINISTRATIVA, CO_ORGANIZACAO_ACADEMICA, CO_CURSO, 
CO_ALUNO, CO_GRAU_ACADEMICO, CO_MODALIDADE_ENSINO, IN_CONCLUINTE, IN_INGRESSO_TOTAL as IN_INGRESSO, 
DT_INGRESSO_CURSO, IN_SEXO_ALUNO, NU_IDADE_ALUNO, CO_COR_RACA_ALUNO, CO_UF_NASCIMENTO,
CO_MUNICIPIO_NASCIMENTO, CO_TURNO_ALUNO
from IES_2014_ALUNO
where IN_MATRICULA=1 and CO_NIVEL_ACADEMICO=1;

-- Seleção da tabela Curso
create table IES_2014_CURSO_STEP1 
select CO_MUNICIPIO_CURSO as CO_MUNICIPIO, CO_CURSO, CO_OCDE, CO_LOCAL_OFERTA as CO_LOCAL_OFERTA_IES
from IES_2014_CURSO;

-- Criando a tabela STEP2:
create table IES_2014_ALUNO_STEP2 select * from IES_2014_ALUNO_STEP1;

alter table IES_2014_ALUNO_STEP2 add (CO_MUNICIPIO varchar(8), CO_OCDE varchar(20), CO_LOCAL_OFERTA_IES varchar(30));

update IES_2014_ALUNO_STEP2 left join IES_2014_CURSO_STEP1 
on IES_2014_ALUNO_STEP2.CO_CURSO = IES_2014_CURSO_STEP1.CO_CURSO
set IES_2014_ALUNO_STEP2.CO_MUNICIPIO = IES_2014_CURSO_STEP1.CO_MUNICIPIO;

update IES_2014_ALUNO_STEP2 left join IES_2014_CURSO_STEP1 
on IES_2014_ALUNO_STEP2.CO_CURSO = IES_2014_CURSO_STEP1.CO_CURSO
set IES_2014_ALUNO_STEP2.CO_OCDE = IES_2014_CURSO_STEP1.CO_OCDE;

update IES_2014_ALUNO_STEP2 left join IES_2014_CURSO_STEP1 
on IES_2014_ALUNO_STEP2.CO_CURSO = IES_2014_CURSO_STEP1.CO_CURSO
set IES_2014_ALUNO_STEP2.CO_LOCAL_OFERTA_IES = IES_2014_CURSO_STEP1.CO_LOCAL_OFERTA_IES;


-- ---------------------------------------------------------------------------------
-- Recodificações - Banco ALUNO

# Categoria Administrativa

select CO_CATEGORIA_ADMINISTRATIVA, count(*) from IES_2014_ALUNO_STEP2 group by CO_CATEGORIA_ADMINISTRATIVA;


update IES_2014_ALUNO_STEP2 set CO_CATEGORIA_ADMINISTRATIVA = 
if(CO_CATEGORIA_ADMINISTRATIVA = '7', '6', CO_CATEGORIA_ADMINISTRATIVA)


# Grau Acadêmico

update IES_2014_ALUNO_STEP2 set CO_GRAU_ACADEMICO = 
if(CO_GRAU_ACADEMICO = '        ', '-1', CO_GRAU_ACADEMICO);


# Ano e mes de ingresso

alter table IES_2014_ALUNO_STEP2 add (ANO_INGRESSO varchar(4), MES_INGRESSO varchar(8)) ;

update IES_2014_ALUNO_STEP2 set MES_INGRESSO = substring(DT_INGRESSO_CURSO,3,3);
update IES_2014_ALUNO_STEP2 set MES_INGRESSO = if(MES_INGRESSO='JAN',1,if(MES_INGRESSO='JUL',7,0));

select MES_INGRESSO, count(*) from IES_2014_ALUNO_STEP2 group by MES_INGRESSO;




update IES_2014_ALUNO_STEP2 set ANO_INGRESSO = substring(DT_INGRESSO_CURSO,6,4);
select ANO_INGRESSO, count(*) from IES_2014_ALUNO_STEP2 group by ANO_INGRESSO;

-- Cor do Aluno

update IES_2014_ALUNO_STEP2 set CO_COR_RACA_ALUNO= if(CO_COR_RACA_ALUNO = '0' or CO_COR_RACA_ALUNO = '6', '-1', CO_COR_RACA_ALUNO);

-- UF nascimento

update IES_2014_ALUNO_STEP2 set CO_UF_NASCIMENTO = if(CO_UF_NASCIMENTO = '        ', '-1', CO_UF_NASCIMENTO);


-- Município nascimento
select CO_MUNICIPIO_NASCIMENTO, count(*) from IES_2014_ALUNO_STEP2 group by CO_MUNICIPIO_NASCIMENTO;

update IES_2014_ALUNO_STEP2 
set CO_MUNICIPIO_NASCIMENTO = if(CO_MUNICIPIO_NASCIMENTO = '        ', '-1', CO_MUNICIPIO_NASCIMENTO);


-- Turno do Aluno

select CO_TURNO_ALUNO, count(*) from IES_2014_ALUNO_STEP2 group by CO_TURNO_ALUNO;

update IES_2014_ALUNO_STEP2 set CO_TURNO_ALUNO = if(CO_TURNO_ALUNO = '', '-1', CO_TURNO_ALUNO);

-- Codigo do Municipio IES

select CO_MUNICIPIO, count(*) from IES_2014_ALUNO_STEP2 group by CO_MUNICIPIO;

update IES_2014_ALUNO_STEP2 set CO_MUNICIPIO = if(CO_MUNICIPIO = '        ', '-1', CO_MUNICIPIO);

-- Codigo OCDE

select CO_OCDE, count(*) from IES_2014_ALUNO_STEP1 group by CO_OCDE;
update IES_2014_ALUNO_STEP2 set CO_OCDE = if(CO_OCDE = '            ', '-1', CO_OCDE);

-- Codigo local de oferta

select CO_LOCAL_OFERTA_IES, count(*) from IES_2014_ALUNO_STEP2 group by CO_LOCAL_OFERTA_IES;

update IES_2014_ALUNO_STEP2 set CO_LOCAL_OFERTA_IES = if(CO_LOCAL_OFERTA_IES = '        ', '-1', CO_LOCAL_OFERTA_IES);


-- Organizacao Academica

select CO_ORGANIZACAO_ACADEMICA, count(*) from IES_2014_ALUNO_STEP2 group by CO_ORGANIZACAO_ACADEMICA;

update IES_2014_ALUNO_STEP2 set CO_ORGANIZACAO_ACADEMICA = if(CO_ORGANIZACAO_ACADEMICA = '5', '4', CO_ORGANIZACAO_ACADEMICA);


-- Criando a tabela final:
drop table if exists IES_2014_ALUNO_STEP3;
create table IES_2014_ALUNO_STEP3 select * from IES_2014_ALUNO_STEP2;


select CO_IES, count(*) from IES_2014_ALUNO_STEP3 group by CO_IES;
select CO_CATEGORIA_ADMINISTRATIVA, count(*) from IES_2014_ALUNO_STEP2 group by CO_CATEGORIA_ADMINISTRATIVA;
select CO_ORGANIZACAO_ACADEMICA, count(*) from IES_2014_ALUNO_STEP2 group by CO_ORGANIZACAO_ACADEMICA;
select CO_CURSO, count(*) from IES_2014_ALUNO_STEP3 group by CO_CURSO;
select CO_ALUNO, count(*) from IES_2014_ALUNO_STEP3 group by CO_ALUNO;
select CO_GRAU_ACADEMICO, count(*) from IES_2014_ALUNO_STEP3 group by CO_GRAU_ACADEMICO;
select CO_MODALIDADE_ENSINO, count(*) from IES_2014_ALUNO_STEP3 group by CO_MODALIDADE_ENSINO;
select IN_CONCLUINTE, count(*) from IES_2014_ALUNO_STEP3 group by IN_CONCLUINTE;
select IN_INGRESSO, count(*) from IES_2014_ALUNO_STEP3 group by IN_INGRESSO;
select IN_SEXO_ALUNO, count(*) from IES_2014_ALUNO_STEP3 group by IN_SEXO_ALUNO;
select NU_IDADE_ALUNO, count(*) from IES_2014_ALUNO_STEP3 group by NU_IDADE_ALUNO;
select CO_COR_RACA_ALUNO, count(*) from IES_2014_ALUNO_STEP3 group by CO_COR_RACA_ALUNO;
select CO_UF_NASCIMENTO, count(*) from IES_2014_ALUNO_STEP3 group by CO_UF_NASCIMENTO;
select CO_MUNICIPIO_NASCIMENTO, count(*) from IES_2014_ALUNO_STEP3 group by CO_MUNICIPIO_NASCIMENTO;
select CO_TURNO_ALUNO, count(*) from IES_2014_ALUNO_STEP3 group by CO_TURNO_ALUNO;
select CO_MUNICIPIO, count(*) from IES_2014_ALUNO_STEP3 group by CO_MUNICIPIO;
select CO_OCDE, count(*) from IES_2014_ALUNO_STEP3 group by CO_OCDE;
select CO_LOCAL_OFERTA_IES, count(*) from IES_2014_ALUNO_STEP3 group by CO_LOCAL_OFERTA_IES;
select ANO_INGRESSO, count(*) from IES_2014_ALUNO_STEP3 group by ANO_INGRESSO;
select MES_INGRESSO, count(*) from IES_2014_ALUNO_STEP3 group by MES_INGRESSO;


-- ---------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------
