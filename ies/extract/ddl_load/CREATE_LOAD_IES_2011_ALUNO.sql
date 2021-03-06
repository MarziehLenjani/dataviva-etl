use dataviva_raw;

drop table if exists IES_2011_ALUNO_BLOCO;
create table IES_2011_ALUNO_BLOCO( dados varchar(2000) not null);

load data local infile 'H:/HEDU/Dados/2011/DADOS/ALUNO.txt'
into table IES_2011_ALUNO_BLOCO
character set 'latin1'
fields terminated by '\t'
lines terminated by '\n';

drop table if exists IES_2011_ALUNO;
create table IES_2011_ALUNO select 
substring(dados,1,8) as CO_IES,
substring(dados,9,8) as CO_CATEGORIA_ADMINISTRATIVA,
substring(dados,17,100) as DS_CATEGORIA_ADMINISTRATIVA,
substring(dados,117,8) as CO_ORGANIZACAO_ACADEMICA,
substring(dados,125,100) as DS_ORGANIZACAO_ACADEMICA,
substring(dados,225,8) as CO_CURSO,
substring(dados,233,200) as NO_CURSO,
substring(dados,433,8) as CO_GRAU_ACADEMICO,
substring(dados,441,12) as DS_GRAU_ACADEMICO,
substring(dados,453,8) as CO_MODALIDADE_ENSINO,
substring(dados,461,11) as DS_MODALIDADE_ENSINO,
substring(dados,472,8) as CO_NIVEL_ACADEMICO,
substring(dados,480,33) as DS_NIVEL_ACADEMICO,
substring(dados,513,16) as CO_ALUNO_CURSO,
substring(dados,529,13) as CO_ALUNO,
substring(dados,542,8) as CO_COR_RACA_ALUNO,
substring(dados,550,24) as DS_COR_RACA_ALUNO,
substring(dados,574,8) as IN_SEXO_ALUNO,
substring(dados,582,9) as DS_SEXO_ALUNO,
substring(dados,591,4) as NU_ANO_ALUNO_NASC,
substring(dados,595,2) as NU_DIA_ALUNO_NASC,
substring(dados,597,2) as NU_MES_ALUNO_NASC,
substring(dados,599,8) as NU_IDADE_ALUNO,
substring(dados,607,8) as CO_NACIONALIDADE_ALUNO,
substring(dados,615,8) as CO_PAIS_ORIGEM_ALUNO,
substring(dados,623,8) as CO_UF_NASCIMENTO,
substring(dados,631,13) as CO_MUNICIPIO_NASCIMENTO,
substring(dados,644,8) as CO_ALUNO_SITUACAO,
substring(dados,652,8) as IN_ALUNO_DEFICIENCIA,
substring(dados,660,8) as IN_DEF_AUDITIVA,
substring(dados,668,8) as IN_DEF_FISICA,
substring(dados,676,8) as IN_DEF_INTELECTUAL,
substring(dados,684,8) as IN_DEF_MULTIPLA,
substring(dados,692,8) as IN_DEF_SURDEZ,
substring(dados,700,8) as IN_DEF_SURDOCEGUEIRA,
substring(dados,708,8) as IN_DEF_BAIXA_VISAO,
substring(dados,716,8) as IN_DEF_CEGUEIRA,
substring(dados,724,8) as IN_DEF_SUPERDOTACAO,
substring(dados,732,8) as IN_TGD_AUTISMO_INFANTIL,
substring(dados,740,8) as IN_TGD_SINDROME_ASPERGER,
substring(dados,748,8) as IN_TGD_SINDROME_RETT,
substring(dados,756,8) as IN_TGD_TRANSTOR_DESINTEGRATIVO,
substring(dados,764,38) as DT_INGRESSO_CURSO,
substring(dados,802,8) as IN_ATIVIDADE_COMPLEMENTAR,
substring(dados,810,8) as IN_RESERVA_VAGAS,
substring(dados,818,8) as IN_FINANC_ESTUDANTIL,
substring(dados,826,8) as CO_CURSO_POLO,
substring(dados,834,8) as CO_TURNO_ALUNO,
substring(dados,842,8) as IN_ING_VESTIBULAR,
substring(dados,850,8) as IN_ING_ENEM,
substring(dados,858,8) as IN_ING_OUTRA_FORMA_SELECAO,
substring(dados,866,8) as IN_ING_CONVENIO_PEC_G,
substring(dados,874,8) as IN_ING_OUTRA_FORMA,
substring(dados,882,8) as IN_RESERVA_ETNICO,
substring(dados,890,8) as IN_RESERVA_DEFICIENCIA,
substring(dados,898,8) as IN_RESERVA_ENSINO_PUBLICO,
substring(dados,906,8) as IN_RES_RENDA_FAMILIAR,
substring(dados,914,8) as IN_RESERVA_OUTROS,
substring(dados,922,8) as IN_FIN_REEMB_FIES,
substring(dados,930,8) as IN_FIN_REEMB_ESTADUAL,
substring(dados,938,8) as IN_FIN_REEMB_MUNICIPAL,
substring(dados,946,8) as IN_FIN_REEMB_PROG_IES,
substring(dados,954,8) as IN_FIN_REEMB_ENT_EXTERNA,
substring(dados,962,8) as IN_FIN_REEMB_OUTRA,
substring(dados,970,8) as IN_FIN_NAOREEMB_PROUNI_INTEGR,
substring(dados,978,8) as IN_FIN_NAOREEMB_PROUNI_PARCIAL,
substring(dados,986,8) as IN_FIN_NAOREEMB_ESTADUAL,
substring(dados,994,8) as IN_FIN_NAOREEMB_MUNICIPAL,
substring(dados,1002,8) as IN_FIN_NAOREEMB_PROG_IES,
substring(dados,1010,8) as IN_FIN_NAOREEMB_ENT_EXTERNA,
substring(dados,1018,8) as IN_FIN_NAOREEMB_OUTRA,
substring(dados,1026,8) as IN_APOIO_SOCIAL,
substring(dados,1034,8) as IN_APOIO_ALIMENTACAO,
substring(dados,1042,8) as IN_APOIO_BOLSA_PERMANENCIA,
substring(dados,1050,8) as IN_APOIO_BOLSA_TRABALHO,
substring(dados,1058,8) as IN_APOIO_MATERIAL_DIDATICO,
substring(dados,1066,8) as IN_APOIO_MORADIA,
substring(dados,1074,8) as IN_APOIO_TRANSPORTE,
substring(dados,1082,8) as IN_COMPL_ESTAGIO,
substring(dados,1090,8) as IN_COMPL_EXTENSAO,
substring(dados,1098,8) as IN_COMPL_MONITORIA,
substring(dados,1106,8) as IN_COMPL_PESQUISA,
substring(dados,1114,8) as IN_BOLSA_ESTAGIO,
substring(dados,1122,8) as IN_BOLSA_EXTENSAO,
substring(dados,1130,8) as IN_BOLSA_MONITORIA,
substring(dados,1138,8) as IN_BOLSA_PESQUISA,
substring(dados,1146,8) as TP_PROCEDE_EDUC_PUBLICA,
substring(dados,1154,8) as IN_MATRICULA,
substring(dados,1162,8) as IN_CONCLUINTE,
substring(dados,1170,8) as IN_INGRESSO_TOTAL,
substring(dados,1178,8) as IN_INGRESSO_PROCESSO_SELETIVO,
substring(dados,1186,8) as IN_INGRESSO_OUTRAS_FORMAS,
substring(dados,1194,4) as ANO_INGRESSO
from IES_2011_ALUNO_BLOCO;


select * from IES_2011_ALUNO_BLOCO;
select * from IES_2011_ALUNO;


