DROP DATABASE IF EXISTS base_exo1;

CREATE DATABASE base_exo1;

USE base_exo1;


CREATE TABLE Client(
    cli_num int NOT NULL AUTO_INCREMENT,
    cli_nom varchar(50) NOT NULL,
    cli_adresse varchar(50) NOT NULL,
    cli_tel varchar(30) NOT NULL,
    PRIMARY KEY (cli_num)
);

CREATE TABLE Produit(
    pro_num int NOT NULL AUTO_INCREMENT,
    pro_libelle varchar(50) NOT NULL,
    pro_description varchar(50) NOT NULL,
    PRIMARY KEY (pro_num)
);

CREATE TABLE Commande(
    com_num int NOT NULL AUTO_INCREMENT,
    client_id int NOT NULL,
    com_date datetime NOT NULL,
    Com_obs varchar(50),
    PRIMARY KEY (com_num),
    CONSTRAINT fk3_numero_client FOREIGN KEY (client_id) REFERENCES Client(cli_num)
);

CREATE TABLE est_compose(
    commande_id int NOT NULL,
    produit_id int NOT NULL,
    est_qte int NOT NULL,
    PRIMARY KEY (commande_id, produit_id),
    CONSTRAINT FK1_numero_commande FOREIGN KEY (commande_id) REFERENCES commande(com_num),
    CONSTRAINT FK2_numero_produit FOREIGN KEY (produit_id) REFERENCES produit(pro_num)
);

CREATE INDEX index_client ON Client(cli_nom)