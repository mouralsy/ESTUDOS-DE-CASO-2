CREATE DATABASE Revisao;
USE Revisao;

CREATE TABLE endereco (
endereco_id int primary key auto_increment,
rua varchar(100) not null,
numero varchar (10) not null,
complemento varchar (100) not null,
bairro varchar (45) not null,
cidade varchar (45) not null,
estado varchar (45) not null,
cep varchar (45) not null
);

CREATE TABLE jogos (
jogos_id int primary key auto_increment,
titulo varchar (45) not null,
plataforma enum ('PlayStation', 'Xbox', 'Nintendo Switch', 'PC') not null,
genero varchar (45) not null,
ano_lancamento year not null,
preco_diaria decimal (5,2) not null
);

CREATE TABLE clientes (
cliente_id int primary key auto_increment,
nome varchar (45) not null,
telefone varchar (15) not null,
email  varchar (45) not null,
data_nasc date not null,
endereco_id int not null,
foreign key  (endereco_id) references enderecos(endereco_id)
);

CREATE TABLE LOCACOES (
locacao_id int primary key auto_increment,
cliente_id int not null,
jogo_id int not null,
data_locacao date not null,
date_devolucao date,
multa_atraso decimal(7,2),
status_loc enum ('Em andamento', 'Concluída', 'Atrasada') not null,
foreign key (cliente_id) references clientes(cliente_id),
foreign key (jogo_id) references jogos (jogo_id)
);

CREATE TABLE pagamentos (
pagamento_id int primary key auto_increment,
locaca_id int not null,
valor_pago decimal(7,2) not null,
data_pagamento date not null,
metodo_pagamento enum('Cartão de Crédito', 'Cartão de Débito', 'Dinheiro', 'Pix') not null,
foreign key (locacao_id) references locacoes(locacao_id) 
);
