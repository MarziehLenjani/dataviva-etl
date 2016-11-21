use dataviva_raw;

create table SC_2011_ESCOLA_BLOCO( dados varchar(2000) not null);

load data local infile 'Y:/Censo Escolar/2011/DADOS/TS_ESCOLA.txt'
into table SC_2011_ESCOLA_BLOCO
character set 'latin1'
fields terminated by '\t'
lines terminated by '\n';

drop table if exists SC_2011_ESCOLA;
create table SC_2011_ESCOLA select 
substring(dados,1,5) as ANO_CENSO,
substring(dados,6,9) as PK_COD_ENTIDADE,
substring(dados,15,5) as COD_ORGAO_REGIONAL_INEP,
substring(dados,20,15) as DESC_SITUACAO_FUNCIONAMENTO,
substring(dados,35,1) as DESC_SITUACAO_CENSO2011,
substring(dados,36,20) as DT_ANO_LETIVO_INICIO,
substring(dados,56,20) as DT_ANO_LETIVO_TERMINO,
substring(dados,76,3) as FK_COD_ESTADO,
substring(dados,79,2) as SIGLA,
substring(dados,81,8) as FK_COD_MUNICIPIO,
substring(dados,89,8) as FK_COD_DISTRITO,
substring(dados,97,1) as ID_DEPENDENCIA_ADM,
substring(dados,98,1) as ID_LOCALIZACAO,
substring(dados,99,1) as DESC_CATEGORIA_ESCOLA_PRIVADA,
substring(dados,100,1) as ID_CONVENIADA_PP,
substring(dados,101,2) as ID_TIPO_CONVENIO_PODER_PUBLICO,
substring(dados,103,1) as ID_MANT_ESCOLA_PRIVADA_EMP,
substring(dados,104,1) as ID_MANT_ESCOLA_PRIVADA_ONG,
substring(dados,105,1) as ID_MANT_ESCOLA_PRIVADA_SIND,
substring(dados,106,1) as ID_MANT_ESCOLA_PRIVADA_S_FINS,
substring(dados,107,1) as ID_DOCUMENTO_REGULAMENTACAO,
substring(dados,108,1) as ID_LOCAL_FUNC_PREDIO_ESCOLAR,
substring(dados,109,1) as ID_LOCAL_FUNC_SALAS_EMPRESA,
substring(dados,110,1) as ID_LOCAL_FUNC_PRISIONAL,
substring(dados,111,1) as ID_LOCAL_FUNC_TEMPLO_IGREJA,
substring(dados,112,1) as ID_LOCAL_FUNC_CASA_PROFESSOR,
substring(dados,113,1) as ID_LOCAL_FUNC_GALPAO,
substring(dados,114,1) as ID_LOCAL_FUNC_OUTROS,
substring(dados,115,1) as ID_LOCAL_FUNC_SALAS_OUTRA_ESC,
substring(dados,116,1) as ID_ESCOLA_COMP_PREDIO,
substring(dados,117,1) as ID_AGUA_FILTRADA,
substring(dados,118,1) as ID_AGUA_REDE_PUBLICA,
substring(dados,119,1) as ID_AGUA_POCO_ARTESIANO,
substring(dados,120,1) as ID_AGUA_CACIMBA,
substring(dados,121,1) as ID_AGUA_FONTE_RIO,
substring(dados,122,1) as ID_AGUA_INEXISTENTE,
substring(dados,123,1) as ID_ENERGIA_REDE_PUBLICA,
substring(dados,124,1) as ID_ENERGIA_GERADOR,
substring(dados,125,1) as ID_ENERGIA_OUTROS,
substring(dados,126,1) as ID_ENERGIA_INEXISTENTE,
substring(dados,127,1) as ID_ESGOTO_REDE_PUBLICA,
substring(dados,128,1) as ID_ESGOTO_FOSSA,
substring(dados,129,1) as ID_ESGOTO_INEXISTENTE,
substring(dados,130,1) as ID_LIXO_COLETA_PERIODICA,
substring(dados,131,1) as ID_LIXO_QUEIMA,
substring(dados,132,1) as ID_LIXO_JOGA_OUTRA_AREA,
substring(dados,133,1) as ID_LIXO_RECICLA,
substring(dados,134,1) as ID_LIXO_ENTERRA,
substring(dados,135,1) as ID_LIXO_OUTROS,
substring(dados,136,1) as ID_SALA_DIRETORIA,
substring(dados,137,1) as ID_SALA_PROFESSOR,
substring(dados,138,1) as ID_LABORATORIO_INFORMATICA,
substring(dados,139,1) as ID_LABORATORIO_CIENCIAS,
substring(dados,140,1) as ID_SALA_ATENDIMENTO_ESPECIAL,
substring(dados,141,1) as ID_QUADRA_ESPORTES_COBERTA,
substring(dados,142,1) as ID_QUADRA_ESPORTES_DESCOBERTA,
substring(dados,143,1) as ID_COZINHA,
substring(dados,144,1) as ID_BIBLIOTECA,
substring(dados,145,1) as ID_SALA_LEITURA,
substring(dados,146,1) as ID_PARQUE_INFANTIL,
substring(dados,147,1) as ID_BERCARIO,
substring(dados,148,1) as ID_SANITARIO_FORA_PREDIO,
substring(dados,149,1) as ID_SANITARIO_DENTRO_PREDIO,
substring(dados,150,1) as ID_SANITARIO_EI,
substring(dados,151,1) as ID_SANITARIO_PNE,
substring(dados,152,1) as ID_DEPENDENCIAS_PNE,
substring(dados,153,1) as ID_DEPENDENCIAS_OUTRAS,
substring(dados,154,5) as NUM_SALAS_EXISTENTES,
substring(dados,159,5) as NUM_SALAS_UTILIZADAS,
substring(dados,164,1) as ID_EQUIP_TV,
substring(dados,165,1) as ID_EQUIP_VIDEOCASSETE,
substring(dados,166,1) as ID_EQUIP_DVD,
substring(dados,167,1) as ID_EQUIP_PARABOLICA,
substring(dados,168,1) as ID_EQUIP_COPIADORA,
substring(dados,169,1) as ID_EQUIP_RETRO,
substring(dados,170,1) as ID_EQUIP_IMPRESSORA,
substring(dados,171,1) as ID_COMPUTADORES,
substring(dados,172,5) as NUM_COMPUTADORES,
substring(dados,177,5) as NUM_COMP_ADMINISTRATIVOS,
substring(dados,182,5) as NUM_COMP_ALUNOS,
substring(dados,187,1) as ID_INTERNET,
substring(dados,188,2) as ID_BANDA_LARGA,
substring(dados,190,5) as NUM_FUNCIONARIOS,
substring(dados,195,1) as ID_ALIMENTACAO,
substring(dados,196,2) as ID_AEE,
substring(dados,198,2) as ID_MOD_ATIV_COMPLEMENTAR,
substring(dados,200,1) as ID_MOD_ENS_REGULAR,
substring(dados,201,1) as ID_REG_INFANTIL_CRECHE,
substring(dados,202,1) as ID_REG_INFANTIL_PREESCOLA,
substring(dados,203,1) as ID_REG_FUND_8_ANOS,
substring(dados,204,1) as ID_REG_FUND_9_ANOS,
substring(dados,205,1) as ID_REG_MEDIO_MEDIO,
substring(dados,206,1) as ID_REG_MEDIO_INTEGRADO,
substring(dados,207,1) as ID_REG_MEDIO_NORMAL,
substring(dados,208,1) as ID_REG_MEDIO_PROF,
substring(dados,209,1) as ID_MOD_ENS_ESP,
substring(dados,210,1) as ID_ESP_INFANTIL_CRECHE,
substring(dados,211,1) as ID_ESP_INFANTIL_PREESCOLA,
substring(dados,212,1) as ID_ESP_FUND_8_ANOS,
substring(dados,213,1) as ID_ESP_FUND_9_ANOS,
substring(dados,214,1) as ID_ESP_MEDIO_MEDIO,
substring(dados,215,1) as ID_ESP_MEDIO_INTEGRADO,
substring(dados,216,1) as ID_ESP_MEDIO_NORMAL,
substring(dados,217,1) as ID_ESP_MEDIO_PROFISSIONAL,
substring(dados,218,1) as ID_ESP_EJA_FUNDAMENTAL,
substring(dados,219,1) as ID_ESP_EJA_MEDIO,
substring(dados,220,1) as ID_MOD_EJA,
substring(dados,221,1) as ID_EJA_FUNDAMENTAL,
substring(dados,222,1) as ID_EJA_MEDIO,
substring(dados,223,1) as ID_FUND_CICLOS,
substring(dados,224,1) as ID_LOCALIZACAO_DIFERENCIADA,
substring(dados,225,1) as ID_MATERIAL_ESP_NAO_UTILIZA,
substring(dados,226,1) as ID_MATERIAL_ESP_QUILOMBOLA,
substring(dados,227,1) as ID_MATERIAL_ESP_INDIGENA,
substring(dados,228,1) as ID_EDUCACAO_INDIGENA,
substring(dados,229,1) as ID_LINGUA_INDIGENA,
substring(dados,230,5) as FK_COD_LINGUA_INDIGENA,
substring(dados,235,1) as ID_LINGUA_PORTUGUESA
from SC_2011_ESCOLA_BLOCO;

select * from SC_2011_ESCOLA;

drop table SC_2011_ESCOLA_BLOCO;