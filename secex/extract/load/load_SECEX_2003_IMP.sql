load data local infile 'H:/secex/Dados/Importacao/IMP_2003_MUN.csv'
into table SECEX_2003_IMP
character set 'latin1'
fields terminated by ';'
enclosed by '"'
lines terminated by '\n';
