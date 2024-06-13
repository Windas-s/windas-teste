DROP DATABASE windas;
CREATE DATABASE windas;
USE windas;


CREATE TABLE hotel (
  idHotel INT AUTO_INCREMENT,
  nomeHotel VARCHAR(100) NOT NULL,
  PRIMARY KEY (idHotel),
  UNIQUE (nomeHotel)
);

CREATE TABLE funcionario (
idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
fk_gerente INT,
nomeFuncionario VARCHAR(50) NOT NULL, 
emailFuncionario VARCHAR(100) NOT NULL,
senha VARCHAR(20) NOT NULL,
fk_hotel INT,
CONSTRAINT fk_gerente FOREIGN KEY (fk_gerente) REFERENCES funcionario(idFuncionario), 
CONSTRAINT fk_hotel FOREIGN KEY (fk_hotel) REFERENCES hotel(idHotel)
);


CREATE TABLE quarto (
    idQuarto INT NOT NULL AUTO_INCREMENT,
    numero INT NOT NULL,
    andar VARCHAR(10) NOT NULL,
    ocupacao VARCHAR(30) CHECK (ocupacao IN('Ocupado','Desocupado')),
    fk_hotel INT NOT NULL,
    PRIMARY KEY (idQuarto),
    CONSTRAINT fk_quarto_hotel FOREIGN KEY (fk_hotel) REFERENCES hotel(idHotel)
);

CREATE TABLE sistema_sensor (
  idSistema_sensor INT NOT NULL AUTO_INCREMENT,
  tipo VARCHAR(50) CHECK (tipo IN('DHT11 e TCRT5000')),
  fk_quarto INT NOT NULL,
  PRIMARY KEY (idSistema_sensor),
  CONSTRAINT fk_quarto FOREIGN KEY (fk_quarto) REFERENCES quarto(idQuarto)
);

CREATE TABLE leitura (
  idLeitura INT NOT NULL AUTO_INCREMENT,
  dht11_temperatura DECIMAL(4,2) NOT NULL,
  dht11_umidade DECIMAL(4,2) NOT NULL,
  proximidade CHAR(1) NOT NULL,
  dataHora timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  fk_sistema_sensor INT NOT NULL,
  PRIMARY KEY (idLeitura),
  CONSTRAINT fk_sistema_sensor FOREIGN KEY (fk_sistema_sensor) REFERENCES sistema_sensor(idSistema_sensor)
);

CREATE TABLE infoclima(
		idclima int primary key auto_increment,
        temperatura decimal(3,1),
        umidade int,
		cidade varchar(70)
);

INSERT INTO hotel (nomeHotel)
VALUES 
    ('Hotel Lux Centro'),
    ('Hotel Lux Paulista'),
    ('Hotel Lux Moema'),
    ('Hotel Lux Jardins'),
    ('Hotel Lux Vila Olímpia');


INSERT INTO quarto (numero, andar, ocupacao, fk_hotel)
VALUES 
    (1, '1º andar', 'Desocupado', 1),
    (2, '1º andar', 'Ocupado', 1),
    (3, '1º andar', 'Desocupado', 1),
    (4, '1º andar', 'Desocupado', 1),
    (5, '1º andar', 'Desocupado', 1),
    (6, '1º andar', 'Desocupado', 1),
    (7, '1º andar', 'Desocupado', 1),
    (8, '1º andar', 'Desocupado', 1),
    (9, '1º andar', 'Desocupado', 1),
    (10, '1º andar', 'Desocupado', 1),
    (11, '2º andar', 'Desocupado', 1),
    (12, '2º andar', 'Ocupado', 1),
    (13, '2º andar', 'Desocupado', 1),
    (14, '2º andar', 'Desocupado', 1),
    (15, '2º andar', 'Desocupado', 1),
    (16, '2º andar', 'Desocupado', 1),
    (17, '2º andar', 'Desocupado', 1),
    (18, '2º andar', 'Desocupado', 1),
    (19, '2º andar', 'Desocupado', 1),
    (20, '2º andar', 'Desocupado', 1),
    (21, '3º andar', 'Desocupado', 1),
    (22, '3º andar', 'Ocupado', 1),
    (23, '3º andar', 'Desocupado', 1),
    (24, '3º andar', 'Desocupado', 1),
    (25, '3º andar', 'Desocupado', 1),
    (26, '3º andar', 'Desocupado', 1),
    (27, '3º andar', 'Desocupado', 1),
    (28, '3º andar', 'Desocupado', 1),
    (29, '3º andar', 'Desocupado', 1),
    (30, '3º andar', 'Desocupado', 1),
    (31, '4º andar', 'Desocupado', 1),
    (32, '4º andar', 'Ocupado', 1),
    (33, '4º andar', 'Desocupado', 1),
    (34, '4º andar', 'Desocupado', 1),
    (35, '4º andar', 'Desocupado', 1),
    (36, '4º andar', 'Desocupado', 1),
    (37, '4º andar', 'Desocupado', 1),
    (38, '4º andar', 'Desocupado', 1),
    (39, '4º andar', 'Desocupado', 1),
    (40, '4º andar', 'Desocupado', 1),
    (41, '5º andar', 'Desocupado', 1),
    (42, '5º andar', 'Ocupado', 1),
    (43, '5º andar', 'Desocupado', 1),
    (44, '5º andar', 'Desocupado', 1),
    (45, '5º andar', 'Desocupado', 1),
    (46, '5º andar', 'Desocupado', 1),
    (47, '5º andar', 'Desocupado', 1),
    (48, '5º andar', 'Desocupado', 1),
    (49, '5º andar', 'Desocupado', 1),
    (50, '5º andar', 'Desocupado', 1);

select * from quarto;
select * from sistema_sensor;

INSERT INTO sistema_sensor (tipo, fk_quarto)
VALUES 
    ('DHT11 e TCRT5000', 1),
    ('DHT11 e TCRT5000', 2),
    ('DHT11 e TCRT5000', 3),
    ('DHT11 e TCRT5000', 4),
    ('DHT11 e TCRT5000', 5),
    ('DHT11 e TCRT5000', 6),
    ('DHT11 e TCRT5000', 7),
    ('DHT11 e TCRT5000', 8),
    ('DHT11 e TCRT5000', 9),
    ('DHT11 e TCRT5000', 10),
    ('DHT11 e TCRT5000', 11),
    ('DHT11 e TCRT5000', 12),
    ('DHT11 e TCRT5000', 13),
    ('DHT11 e TCRT5000', 14),
    ('DHT11 e TCRT5000', 15),
    ('DHT11 e TCRT5000', 16),
    ('DHT11 e TCRT5000', 17),
    ('DHT11 e TCRT5000', 18),
    ('DHT11 e TCRT5000', 19),
    ('DHT11 e TCRT5000', 20),
    ('DHT11 e TCRT5000', 21),
    ('DHT11 e TCRT5000', 22),
    ('DHT11 e TCRT5000', 23),
    ('DHT11 e TCRT5000', 24),
    ('DHT11 e TCRT5000', 25),
    ('DHT11 e TCRT5000', 26),
    ('DHT11 e TCRT5000', 27),
    ('DHT11 e TCRT5000', 28),
    ('DHT11 e TCRT5000', 29),
    ('DHT11 e TCRT5000', 30),
    ('DHT11 e TCRT5000', 31),
    ('DHT11 e TCRT5000', 32),
    ('DHT11 e TCRT5000', 33),
    ('DHT11 e TCRT5000', 34),
    ('DHT11 e TCRT5000', 35),
    ('DHT11 e TCRT5000', 36),
    ('DHT11 e TCRT5000', 37),
    ('DHT11 e TCRT5000', 38),
    ('DHT11 e TCRT5000', 39),
    ('DHT11 e TCRT5000', 40),
    ('DHT11 e TCRT5000', 41),
    ('DHT11 e TCRT5000', 42),
    ('DHT11 e TCRT5000', 43),
    ('DHT11 e TCRT5000', 44),
    ('DHT11 e TCRT5000', 45),
    ('DHT11 e TCRT5000', 46),
    ('DHT11 e TCRT5000', 47),
    ('DHT11 e TCRT5000', 48),
    ('DHT11 e TCRT5000', 49),
    ('DHT11 e TCRT5000', 50);

   
INSERT INTO leitura (dht11_temperatura, dht11_umidade, proximidade, fk_sistema_sensor)
VALUES 
    (30, 60.50, '0', 1),
    (31, 61.00, '0', 2),
    (29, 62.50, '0', 3),
    (28, 63.00, '0', 4),
    (27, 64.00, '0', 5),
    (26, 65.00, '0', 6),
    (25, 66.00, '0', 7),
    (24, 67.00, '0', 8),
    (23, 68.00, '0', 9),
    (22, 69.00, '0', 10),

    (21, 70.00, '0', 11),
    (20, 71.00, '0', 12),
    (19, 72.00, '0', 13),
    (18, 73.00, '0', 14),
    (17, 74.00, '0', 15),
    (16, 75.00, '0', 16),
    (15, 76.00, '0', 17),
    (14, 77.00, '0', 18),
    (13, 78.00, '0', 19),
    (12, 79.00, '0', 20),

    (11, 80.00, '0', 21),
    (10, 81.00, '0', 22),
    (9, 82.00, '0', 23),
    (8, 83.00, '0', 24),
    (7, 84.00, '0', 25),
    (6, 85.00, '0', 26),
    (5, 86.00, '0', 27),
    (4, 87.00, '0', 28),
    (3, 88.00, '0', 29),
    (2, 89.00, '0', 30),

    (31, 60.50, '0', 31),
    (32, 61.00, '0', 32),
    (33, 62.50, '0', 33),
    (34, 63.00, '0', 34),
    (35, 64.00, '0', 35),
    (36, 65.00, '0', 36),
    (37, 66.00, '0', 37),
    (38, 67.00, '0', 38),
    (39, 68.00, '0', 39),
    (40, 69.00, '0', 40),

    (41, 70.00, '0', 41),
    (42, 71.00, '0', 42),
    (43, 72.00, '0', 43),
    (44, 73.00, '0', 44),
    (45, 74.00, '0', 45),
    (46, 75.00, '0', 46),
    (47, 76.00, '0', 47),
    (48, 77.00, '0', 48),
    (49, 78.00, '0', 49),
    (50, 79.00, '0', 50);
    
    
    select * from leitura where idLeitura > 1000;
    select * from funcionario;


   
   


