CREATE DATABASE servicehotel;
USE servicehotel;

CREATE TABLE IF NOT EXISTS Cliente (
clienteID INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
rgCliente INT(11) NOT NULL,
enderecoCLiente VARCHAR(50) NOT NULL,
bairroCliente VARCHAR(50),
cidadeCliente VARCHAR(50),
estadoCliente VARCHAR(50),
CEPcliente INT(11),
nascimentoCLiente DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Chale (
chaleID INT PRIMARY KEY AUTO_INCREMENT,
localizacao VARCHAR(50) NOT NULL,
capacidade INT(11) NOT NULL,
valorAltaEstacao DECIMAL(11, 2),
valorBaixaEstacao DECIMAL(11, 2)
);

CREATE TABLE IF NOT EXISTS Item (
nomeItem INT PRIMARY KEY AUTO_INCREMENT,
descricaoItem VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Servico (
servicoID INT PRIMARY KEY AUTO_INCREMENT,
nomeServico VARCHAR(50),
valorServico DECIMAL(11, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Telefone (
telefoneID INT PRIMARY KEY AUTO_INCREMENT,
tipoTelefone VARCHAR(50) NOT NULL,
clienteID INT(11),
FOREIGN KEY (clienteID) REFERENCES cliente(ID)
);


-- RESOLVER ERRO E SUBIR CRIAR TABELA
CREATE TABLE IF NOT EXISTS Chale_item (
chaleID INT,
nomeItem VARCHAR(255),
primary key (chaleID, nomeITem),
foreign key (chaleID) references chale(chaleID),
foreign key (nomeItem) references item(nomeItem)
);

CREATE TABLE IF NOT EXISTS Hospedagem (
hospedagemID INT PRIMARY KEY AUTO_INCREMENT,
estado VARCHAR(50) NOT NULL,
dataInicio DATETIME DEFAULT CURRENT_TIMESTAMP,
dataFim DATETIME DEFAULT CURRENT_TIMESTAMP,
QtdPessoas INT(11) NOT NULL,
desconto DECIMAL(11, 2) NOT NULL,
valorFinal DECIMAL(11, 2),
FOREIGN KEY (chaleID) REFERENCES Chale(ID),
FOREIGN KEY (clienteID) REFERENCES cliente(ID)
);

-- CRIAR TABELA HOSPEDAGEM SERVICO

CREATE TABLE Hospedagem_servico (
codHospedagem INT,
codServico INT,
DataServico DATE NOT NULL,
PRIMARY KEY (codHospedagem, codServico),
FOREIGN KEY (codHospedagem) REFERENCES Hospedagem(codHospedagem),
FOREIGN KEY (codServico) REFERENCES Servico(codServico)
);
