create table concessionaria(
	nomeUnico varchar(50),
	endereco varchar(50),
    cidade varchar(50),
		
	primary key(nomeUnico)
);
ALTER TABLE concessionaria
ADD estado varchar(50);


create table funcionarios(

    cpf varchar(50),
    nome varchar(50),
    dataIngresso date,
    nomeConcessionaria varchar(50),
    cpfSurpervisor varchar(50),

    primary key(cpf),
    foreign key(cpfSurpervisor) references funcionarios(cpf)
);

create table cliente(
    cpf varchar(50),
    nome varchar(50),
    cidade varchar(50),
    estado varchar(50),

    primary key(cpf)
);
ALTER TABLE cliente
ADD dataNascimento date;

create table veiculo(
    chassi int,
    cor varchar(50),
    preco float,
    peso float,
    possuiVidroEletrico boolean,
    ano int,

    primary key(chassi)
);

create table carro(
    chassiCarro int,
    tipoDirecao varchar(50),
    design varchar(50),

    primary key(chassiCarro),
    foreign key(chassiCarro) references veiculo(chassi)

);

create table caminhonete(
    chassiCaminhonete int,
    tracao varchar(50),
    capacidade float,
    tipoPneu varchar(50),

    primary key(chassiCaminhonete),
    foreign key(chassiCaminhonete) references veiculo(chassi)
);

create table moto(
    chassiMoto int,
    aro int,

    primary key(chassiMoto),
    foreign key(chassiMoto) references veiculo(chassi)
);

ALTER TABLE moto
ADD tipo varchar(50);

create table leads(
    cpf varchar(50),
    renda float,

    primary key(cpf)
);

ALTER TABLE leads
ADD orcamento float;

create table autorizadas(
    cnpj varchar(50),
    cidade varchar(50), 
    nomeConcessionaria varchar(50),

    primary key(cnpj),
    foreign key(nomeConcessionaria) references concessionaria(nomeUnico)
);

ALTER TABLE autorizadas
ADD endereco varchar(50);

create table testeCarro(
    CPFLeads varchar(50),
    ChassiCarro int,

    foreign key(CPFLeads) references leads(cpf),

    foreign key(ChassiCarro) references carro(chassiCarro),

    primary key(CPFLeads, ChassiCarro)
);

create table testeCaminhonete(
    CPFLeads varchar(50),
    ChassiCaminhonete int,

    foreign key(CPFLeads) references leads(cpf),
    foreign key(chassiCaminhonete) references caminhonete(chassiCaminhonete),
    primary key(CPFLeads, ChassiCaminhonete)    
    
);

create table venda(
    CPFCliente varchar(50),
    nomeConcessionaria varchar(50),
    ChassiVeiculo int, 
    CPFVendedor varchar(50),
    valor float,

    foreign key(CPFCliente) references cliente(cpf),
    foreign key(nomeConcessionaria) references concessionaria(nomeUnico),
    foreign key(ChassiVeiculo) references veiculo(chassi),
    foreign key(CPFVendedor) references funcionarios(cpf),

    primary key(CPFCliente, nomeConcessionaria, ChassiVeiculo, CPFVendedor)
);

ALTER TABLE venda
ADD dataVenda date;

-- etapa 2

-- inserts

INSERT INTO concessionaria (nomeUnico, endereco, cidade, estado) VALUES ('Concessionaria 1', 'Rua 1', 'São Paulo', 'SP');
INSERT INTO concessionaria (nomeUnico, endereco, cidade, estado) VALUES ('Concessionaria 2', 'Rua 2', 'Rio de Janeiro', 'RJ');
INSERT INTO concessionaria (nomeUnico, endereco, cidade, estado) VALUES ('Concessionaria 3', 'Rua 3', 'Belo Horizonte', 'MG');
INSERT INTO concessionaria (nomeUnico, endereco, cidade, estado) VALUES ('Concessionaria 4', 'Rua 4', 'Porto Alegre', 'RS');
INSERT INTO concessionaria (nomeUnico, endereco, cidade, estado) VALUES ('Concessionaria 5', 'Rua 5', 'Recife', 'PE');
INSERT INTO concessionaria (nomeUnico, endereco, cidade, estado) VALUES ('Concessionaria 6', 'Rua 6', 'Salvador', 'BA');
INSERT INTO funcionarios (cpf, nome, dataIngresso, nomeConcessionaria) VALUES ('11122233344', 'Maria Silva', '2021-01-01', 'Concessionaria 1');
INSERT INTO funcionarios (cpf, nome, dataIngresso, nomeConcessionaria, cpfSurpervisor) VALUES ('22233344455', 'João Silva', '2022-01-01', 'Concessionaria 2', '11122233344');
INSERT INTO funcionarios (cpf, nome, dataIngresso, nomeConcessionaria, cpfSurpervisor) VALUES ('33344455566', 'Ana Paula', '2023-01-01', 'Concessionaria 3', '22233344455');
INSERT INTO funcionarios (cpf, nome, dataIngresso, nomeConcessionaria, cpfSurpervisor) VALUES ('44455566677', 'Carlos', '2024-01-01', 'Concessionaria 4', '33344455566');
INSERT INTO funcionarios (cpf, nome, dataIngresso, nomeConcessionaria, cpfSurpervisor) VALUES ('55667788990', 'Julia', '2025-01-01', 'Concessionaria 5', '44455566677');
INSERT INTO funcionarios (cpf, nome, dataIngresso, nomeConcessionaria, cpfSurpervisor) VALUES ('66778899900', 'Pedro', '2026-01-01', 'Concessionaria 6', '55667788990');
INSERT INTO cliente (cpf, nome, cidade, estado, dataNascimento) VALUES ('55667788990', 'José da Silva', 'Rio de Janeiro', 'RJ', '1990-01-01');
INSERT INTO cliente (cpf, nome, cidade, estado, dataNascimento) VALUES ('66778899900', 'Maria da Silva', 'Belo Horizonte', 'MG', '1991-01-01');
INSERT INTO cliente (cpf, nome, cidade, estado, dataNascimento) VALUES ('77889900111', 'Pedro Silva', 'São Paulo', 'SP', '1992-01-01');
INSERT INTO cliente (cpf, nome, cidade, estado, dataNascimento) VALUES ('88990011122', 'Ana Silva', 'Porto Alegre', 'RS', '1993-01-01');
INSERT INTO cliente (cpf, nome, cidade, estado, dataNascimento) VALUES ('99001122233', 'Carlos Silva', 'Recife', 'PE', '1994-01-01');
INSERT INTO cliente (cpf, nome, cidade, estado, dataNascimento) VALUES ('00112233344', 'Julia Silva', 'Salvador', 'BA', '1995-01-01');
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (56789, 'Preto', 30000, 2000, true, 2020);
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (67890, 'Branco', 35000, 2500, true, 2021);
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (78901, 'Vermelho', 40000, 3000, true, 2022);
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (89012, 'Azul', 45000, 3500, true, 2023);
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (90123, 'Verde', 50000, 4000, true, 2024);
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (01234, 'Amarelo', 55000, 4500, true, 2025);
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (54321, 'Azul', 45000, 3500, true, 2023);
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (65432, 'Verde', 50000, 4000, true, 2024);
INSERT INTO veiculo (chassi, cor, preco, peso, possuiVidroEletrico, ano) VALUES (76543, 'Amarelo', 55000, 4500, true, 2025);
INSERT INTO carro (chassiCarro, tipoDirecao, design) VALUES (56789, 'Eletrica', 'Sedan');
INSERT INTO carro (chassiCarro, tipoDirecao, design) VALUES (67890, 'Hidraulica', 'SUV');
INSERT INTO carro (chassiCarro, tipoDirecao, design) VALUES (78901, 'Eletrica', 'Hatch');
INSERT INTO caminhonete (chassiCaminhonete, tracao, capacidade, tipoPneu) VALUES (89012, '4x4', 5000, 'Pneu de terra');
INSERT INTO caminhonete (chassiCaminhonete, tracao, capacidade, tipoPneu) VALUES (90123, '4x4', 6000, 'Pneu de estrada');
INSERT INTO caminhonete (chassiCaminhonete, tracao, capacidade, tipoPneu) VALUES (01234, '4x4', 7000, 'Pneu de neve');
INSERT INTO moto (chassiMoto, aro, tipo) VALUES (54321, 19, 'Esportiva');
INSERT INTO moto (chassiMoto, aro, tipo) VALUES (65432, 21, 'Naked');
INSERT INTO moto (chassiMoto, aro, tipo) VALUES (76543, 23, 'Custom');
INSERT INTO leads (cpf, renda, orcamento) VALUES ('11122233344', 2000, 35000);
INSERT INTO leads (cpf, renda, orcamento) VALUES ('22233344455', 2500, 40000);
INSERT INTO leads (cpf, renda, orcamento) VALUES ('33344455566', 3000, 45000);
INSERT INTO autorizadas (cnpj, cidade, nomeConcessionaria, endereco) VALUES ('12345678901', 'São Paulo', 'Concessionaria 1', 'Rua 1');
INSERT INTO autorizadas (cnpj, cidade, nomeConcessionaria, endereco) VALUES ('23456789012', 'Rio de Janeiro', 'Concessionaria 2', 'Rua 2');
INSERT INTO autorizadas (cnpj, cidade, nomeConcessionaria, endereco) VALUES ('34567890123', 'Belo Horizonte', 'Concessionaria 3', 'Rua 3');
INSERT INTO autorizadas (cnpj, cidade, nomeConcessionaria, endereco) VALUES ('45678901234', 'Porto Alegre', 'Concessionaria 4', 'Rua 4');
INSERT INTO autorizadas (cnpj, cidade, nomeConcessionaria, endereco) VALUES ('56789012345', 'Recife', 'Concessionaria 5', 'Rua 5');
INSERT INTO autorizadas (cnpj, cidade, nomeConcessionaria, endereco) VALUES ('67890123456', 'Salvador', 'Concessionaria 6', 'Rua 6');
INSERT INTO testeCarro (CPFLeads, ChassiCarro) VALUES ('11122233344', 56789);
INSERT INTO testeCarro (CPFLeads, ChassiCarro) VALUES ('22233344455', 67890);
INSERT INTO testeCarro (CPFLeads, ChassiCarro) VALUES ('33344455566', 78901);
INSERT INTO testeCaminhonete (CPFLeads, ChassiCaminhonete) VALUES ('33344455566', 89012);
INSERT INTO testeCaminhonete (CPFLeads, ChassiCaminhonete) VALUES ('11122233344', 90123);
INSERT INTO testeCaminhonete (CPFLeads, ChassiCaminhonete) VALUES ('22233344455', 01234);
INSERT INTO venda (CPFCliente, nomeConcessionaria, ChassiVeiculo, CPFVendedor, valor) VALUES ('55667788990', 'Concessionaria 1', 56789, '11122233344', 30000);
INSERT INTO venda (CPFCliente, nomeConcessionaria, ChassiVeiculo, CPFVendedor, valor) VALUES ('66778899900', 'Concessionaria 2', 67890, '22233344455', 35000);
INSERT INTO venda (CPFCliente, nomeConcessionaria, ChassiVeiculo, CPFVendedor, valor) VALUES ('77889900111', 'Concessionaria 3', 78901, '33344455566', 40000);
INSERT INTO venda (CPFCliente, nomeConcessionaria, ChassiVeiculo, CPFVendedor, valor) VALUES ('88990011122', 'Concessionaria 4', 89012, '44455566677', 45000);
INSERT INTO venda (CPFCliente, nomeConcessionaria, ChassiVeiculo, CPFVendedor, valor) VALUES ('99001122233', 'Concessionaria 5', 90123, '55667788990', 50000);
INSERT INTO venda (CPFCliente, nomeConcessionaria, ChassiVeiculo, CPFVendedor, valor) VALUES ('00112233344', 'Concessionaria 6', 01234, '66778899900', 55000);

-- update

UPDATE concessionaria SET estado = 'SP' WHERE cidade = 'São Paulo';
UPDATE funcionarios SET dataIngresso = '2022-01-01' WHERE cpf = '12345678901';
UPDATE veiculo SET preco = 25000 WHERE chassi = 12345;

-- delete

DELETE FROM testeCarro WHERE CPFLeads = '11122233344';
DELETE FROM testeCaminhonete WHERE ChassiCaminhonete = '90123';
DELETE FROM autorizadas WHERE cidade = 'São Paulo';

--selects

SELECT nomeUnico FROM concessionaria JOIN autorizadas ON concessionaria.nomeUnico = autorizadas.nomeConcessionaria WHERE autorizadas.cidade = 'Belo Horizonte';
SELECT preco FROM veiculo RIGHT OUTER JOIN carro ON veiculo.chassi = carro.chassiCarro WHERE carro.design = 'Sedan';
SELECT nome, SUM(valor) FROM venda INNER JOIN cliente ON venda.CPFCliente = cliente.cpf GROUP BY nome;
SELECT nome FROM funcionarios UNION SELECT nome FROM cliente;
SELECT CPFLeads FROM testeCarro INTERSECT SELECT cpf FROM leads;
SELECT chassi FROM veiculo EXCEPT SELECT chassiCarro FROM testeCarro;
SELECT nome FROM funcionarios WHERE cpf IN (SELECT cpfSurpervisor FROM funcionarios);
SELECT nome FROM funcionarios WHERE EXISTS (SELECT * FROM venda WHERE venda.CPFVendedor = funcionarios.cpf);
SELECT nome FROM funcionarios WHERE NOT EXISTS (SELECT * FROM leads WHERE leads.cpf = funcionarios.cpf);
SELECT nome FROM funcionarios WHERE cpf = (SELECT cpfSurpervisor FROM funcionarios WHERE nome = 'João Silva');
SELECT nome FROM funcionarios WHERE cpf = (SELECT cpf FROM venda WHERE valor = (SELECT MAX(valor) FROM venda));
SELECT nome, cidade FROM concessionaria JOIN funcionarios ON concessionaria.nomeUnico = funcionarios.nomeConcessionaria WHERE cidade = (SELECT cidade FROM autorizadas WHERE nomeConcessionaria = concessionaria.nomeUnico);