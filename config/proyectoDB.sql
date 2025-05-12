-- Active: 1746430582465@@127.0.0.1@3306@campeonato
-- Active: 1746430582465@@127.0.0.1@3306@phpmyadmin
CREATE DATABASE campeonato;

CREATE TABLE juez (
    dni VARCHAR(9) NOT NULL,
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    rango ENUM('Juez-Árbitro','Juez Central'),
    PRIMARY KEY (dni)
);
CREATE TABLE division (
    cod_division INT NOT NULL AUTO_INCREMENT,
    cinturon ENUM('Amarillo', 'Naranja', 'Verde', 'Azul', 'Marrón'),
    categoria ENUM('Benjamín', 'Alevín', 'Cadete', 'Infantil', 'Juvenil'),
    modalidad ENUM('Individual', 'Equipo'),
    PRIMARY KEY (cod_division)
);
CREATE TABLE prueba (
    cod_prueba INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(15),
    PRIMARY KEY (cod_prueba)
);
CREATE TABLE participante (
    cod_participante INT NOT NULL AUTO_INCREMENT,
    dorsal INT,
    club VARCHAR(50),
    cod_division INT,
    PRIMARY KEY (cod_participante),
    FOREIGN KEY (cod_division) REFERENCES division(cod_division)
);
CREATE TABLE deportista (
    num_federativo INT NOT NULL,
    nombre VARCHAR(30),
    apellido1 VARCHAR(30),
    apellido2 VARCHAR(30),
    PRIMARY KEY (num_federativo)
);
CREATE TABLE individual AS
    SELECT cod_participante, dorsal, club
    FROM participante;
CREATE TABLE equipo AS
    SELECT cod_participante, dorsal, club
    FROM participante;
ALTER TABLE individual
ADD num_federativo INT;
ALTER TABLE individual
ADD FOREIGN KEY (num_federativo) REFERENCES deportista(num_federativo);
CREATE TABLE componente_equipo (
    cod_participante INT NOT NULL,
    num_federativo INT NOT NULL,
    CONSTRAINT PK_componente PRIMARY KEY (cod_participante, num_federativo),
    FOREIGN KEY (cod_participante) REFERENCES participante(cod_participante),
    FOREIGN KEY (num_federativo) REFERENCES deportista(num_federativo)
);
CREATE TABLE participacion (
    cod_prueba INT NOT NULL,
    cod_participante INT NOT NULL,
    CONSTRAINT PK_participacion PRIMARY KEY (cod_prueba, cod_participante),
    FOREIGN KEY (cod_prueba) REFERENCES prueba(cod_prueba),
    FOREIGN KEY (cod_participante) REFERENCES participante(cod_participante)
);
CREATE TABLE puntuacion (
    dni VARCHAR(9) NOT NULL,
    cod_prueba INT NOT NULL,
    cod_participante INT NOT NULL,
    puntuacion FLOAT(4,2),
    CONSTRAINT PK_puntuacion PRIMARY KEY (dni, cod_prueba, cod_participante),
    FOREIGN KEY (dni) REFERENCES juez(dni),
    FOREIGN KEY (cod_prueba) REFERENCES prueba(cod_prueba),
    FOREIGN KEY (cod_participante) REFERENCES participante(cod_participante)
);
INSERT INTO juez
VALUES
    ('70279491R', 'Jesús', 'Suárez', 'Aguilar', 'Juez-Árbitro'),
    ('25681110T','Ricardo','Delgado','Torres','Juez-Árbitro'),
    ('00547136N','Daniel','Sánchez','Sánchez','Juez-Árbitro'),
    ('86772903K','Enrique','Mendoza','Ruiz','Juez Central'),
    ('10580806R','Rocío','Romero','Delgado','Juez-Árbitro'),
    ('48305185X','Carmen','Serrano','García','Juez-Árbitro'),
    ('71122199N','Paula','Bravo','González','Juez-Árbitro'),
    ('84492013H','Isabel','Sánchez','Martinez','Juez Central'),
    ('29723756M','Manuel','Pérez','Bravo','Juez-Árbitro'),
    ('12879821M','Diego','Serrano','Suárez','Juez-Árbitro'),
    ('60946265Z','Nuria','Vidal','Mendoza','Juez-Árbitro'),
    ('08113112T','Óscar','Moya','Torres','Juez-Árbitro'),
    ('91658786Z','Álvaro','Mendoza','Márquez','Juez-Árbitro'),
    ('14277425Z','Daniel','Morales','Serrano','Juez-Árbitro'),
    ('93197165S','Adrián','Bravo','Márquez','Juez Central');
INSERT INTO prueba (nombre)
VALUES
    ('Combinación'),
    ('Combate'),
    ('Tao');
INSERT INTO division (cinturon, categoria, modalidad)
VALUES
    ('Amarillo','Benjamín','Equipo'),
    ('Amarillo','Alevín','Equipo'),
    ('Amarillo','Infantil','Equipo'),
    ('Naranja','Benjamín','Equipo'),
    ('Naranja','Alevín','Equipo'),
    ('Naranja','Infantil','Equipo'),
    ('Verde','Benjamín','Equipo'),
    ('Verde','Alevín','Equipo'),
    ('Verde','Infantil','Equipo'),
    ('Verde','Cadete','Individual'),
    ('Verde','Cadete','Equipo'),
    ('Azul','Alevín','Equipo'),
    ('Azul','Infantil','Equipo'),
    ('Azul','Cadete','Individual'),
    ('Azul','Cadete','Equipo'),
    ('Azul','Juvenil','Individual'),
    ('Azul','Juvenil','Equipo'),
    ('Marrón','Infantil','Individual'),
    ('Marrón','Infantil','Equipo'),
    ('Marrón','Cadete','Individual'),
    ('Marrón','Cadete','Equipo'),
    ('Marrón','Juvenil','Individual'),
    ('Marrón','Juvenil','Equipo');
INSERT INTO deportista
VALUES
    (100001,'Aurora','Ramos','Navarro'),
    (100002,'Manuel','Cordero','Márquez'),
    (100003,'Lucía','Cordero','Márquez'),
    (100004,'','',''),
    (100005,'','',''),
    (100006,'','',''),
    (100007,'','',''),
    (100008,'','',''),
    (100009,'','',''),
    (100010,'','',''),
    (100011,'','',''),
    (100012,'','',''),
    (100013,'','',''),
    (100014,'','',''),
    (100015,'','',''),
    (100016,'','',''),
    (100017,'','',''),
    (100018,'','',''),
    (100019,'','',''),
    (100020,'','',''),
    (100021,'','',''),
    (100022,'','',''),
    (100023,'','',''),
    (100024,'','',''),
    (100025,'','','')