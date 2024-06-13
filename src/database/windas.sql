    DROP DATABASE windas;
    CREATE DATABASE windas;
    USE windas;


    CREATE TABLE hotel (
    idHotel INT AUTO_INCREMENT,
    nomeHotel VARCHAR(100) NOT NULL,
    emailHotel VARCHAR(100) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    PRIMARY KEY (idHotel),
    UNIQUE (nomeHotel),
    UNIQUE (emailHotel)
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

    create table infoClima (
        idClima int auto_increment,
        temperatura decimal(3,1),
        umidade int,
        fkQuarto int,
        
        constraint pk_clima primary key(idClima),
        constraint fk_clima_quarto foreign key(fkQuarto) references quarto(idQuarto)
    );

    alter table infoClima add column cidade varchar(45);

    INSERT INTO hotel (nomeHotel,emailHotel, senha)
    VALUES 
        ('Ibis São Paulo', 'ibissp@gmail.com','123@IbiS'),
        ('Gran Villagio Hotel','granvillagio@gmail.com','GranV56!789'),
        ('Hotel Plaza','hotelplaza@hotmail.com', '3456Plaz%0');


    INSERT INTO funcionario (fk_gerente, nomeFuncionario, emailFuncionario, senha, fk_hotel)
    VALUES (null,'Fernanda Menezes','fernandamenezes@gmail.com','1258#f&r', 1),
        (1,'Bruno Antunes','brunoantunes@gmail.com','8596%AnT',1),
        (1,'Maria Santos','mariasantos@gmail.com','$4253Sn',1),
        (null,'Pedro Oliveira','pedrooliveira@gmail.com','*12$Pd', 2),
        (4,'Ana Lima','analima@gmail.com','&9@34AL',2),
        (null,'Ricardo Silva','ricardosilva@gmail.com','@3Ric#',3),
        (6,'Camila Pereira','camilapereira@gmail.com','CaMi$%',3),
        (6,'Carlos Vieira','carlosvieira@gmail.com','^76&CV',3);
        
        

    INSERT INTO quarto (numero, andar, ocupacao, fk_hotel)
    VALUES 
        (125, '6º andar', 'Desocupado', 1),
        (126, '6º andar', 'Ocupado', 2),
        (127, '6º andar', 'Desocupado', 3);

    INSERT INTO sistema_sensor (tipo, fk_quarto)
    VALUES 
        ('DHT11 e TCRT5000', 1),
        ('DHT11 e TCRT5000', 2),
    ('DHT11 e TCRT5000', 3);
    
    


    /*INSERT INTO leitura ( dht11_temperatura, dht11_umidade, proximidade, dataHora, fk_sistema_sensor)
    VALUES */



    SELECT * FROM hotel;

    SELECT * FROM funcionario;

    SELECT * FROM quarto;

    SELECT * FROM sistema_sensor;

    SELECT * FROM leitura;

    SELECT * FROM infoClima;

    select hotel.nomeHotel,
        funcionario.*
    from hotel inner join funcionario on funcionario.fk_hotel = hotel.idHotel; 

    select
            h.idHotel,
            h.nomeHotel as 'Nome Hotel',
            gerente.idFuncionario as 'id Gerente',
            gerente.nomeFuncionario as 'Gerente', 
            funcio.idFuncionario as 'id Funcionario', 
            funcio.nomeFuncionario as 'Funcionario' 
    from funcionario as gerente
    inner join funcionario as funcio on funcio.fk_gerente = gerente.idFuncionario
    inner join hotel as h on funcio.fk_hotel = h.idHotel;


    select hotel.nomeHotel,
        quarto.*,
        leitura.*
    from hotel inner join quarto on quarto.fk_hotel = hotel.idHotel
    inner join sistema_sensor on sistema_sensor.fk_quarto = quarto.idQuarto
    inner join leitura on leitura.fk_sistema_sensor = sistema_sensor.idSistema_sensor;
    
    SELECT * FROM quarto;
    select * from sistema_sensor;
        
        INSERT INTO quarto (numero, andar, ocupacao, fk_hotel)
    VALUES 
        (125, '6º andar', 'Desocupado', 1),
        (126, '6º andar', 'Desocupado', 1),
        (127, '6º andar', 'Desocupado', 1),
        (128, '6º andar', 'Desocupado', 1),
        (129, '6º andar', 'Desocupado', 1),
        (130, '6º andar', 'Desocupado', 1),
        (131, '6º andar', 'Desocupado', 1),
        (132, '6º andar', 'Desocupado', 1),
        (133, '6º andar', 'Desocupado', 1),
        (134, '6º andar', 'Desocupado', 1);
        
        
        SELECT 
            l.dht11_temperatura AS temperatura, 
            l.dht11_umidade AS umidade,
            l.proximidade AS janela,
            l.dataHora AS momento,
            DATE_FORMAT(l.dataHora, '%H:%i:%s') AS momento_grafico
                FROM leitura l
                JOIN sistema_sensor ss ON l.fk_sistema_sensor = ss.idSistema_sensor
                JOIN quarto q ON ss.fk_quarto = q.idQuarto
                WHERE q.idQuarto = ss.fk_quarto;
                

    select * from sistema_sensor;
                
    INSERT INTO leitura (dht11_temperatura, dht11_umidade, proximidade, dataHora, fk_sistema_sensor)
    VALUES 
        (14.50, 55.00, '0', '2024-05-18 12:00:00', 3),
        (14.50, 60.00, '0', '2024-05-18 12:05:00', 3),
        (14.50, 58.50, '1', '2024-05-18 12:10:00', 3),
        (14.50, 57.00, '0', '2024-05-18 12:15:00', 3),
        (23.10, 56.00, '1', '2024-05-18 12:20:00', 3),
        (21.80, 59.00, '0', '2024-05-18 12:25:00', 3),
        (22.60, 55.50, '0', '2024-05-18 12:30:00', 3),
        (23.30, 60.50, '1', '2024-05-18 12:35:00', 3),
        (21.90, 58.75, '0', '2024-05-18 12:40:00', 3),
        (14.50, 57.25, '1', '2024-05-18 12:45:00', 3);
        
        INSERT INTO leitura (dht11_temperatura, dht11_umidade, proximidade, dataHora, fk_sistema_sensor)
    VALUES 
        (30.50, 55.00, '0', '2024-05-18 12:00:00', 1),
        (19.50, 55.00, '0', '2024-05-18 12:00:00', 2),
        (15.50, 55.00, '0', '2024-05-18 12:00:00', 3),
        (23.50, 55.00, '0', '2024-05-18 12:00:00', 1),
        (25.50, 55.00, '0', '2024-05-18 12:00:00', 2),
        (22.50, 55.00, '0', '2024-05-18 12:00:00', 3),
        (28.50, 55.00, '0', '2024-05-18 12:00:00', 1);
        
        

