CREATE TABLE TYPE
(
	type_name	  CHAR(18)  NOT NULL ,
	id_type		  NUMBER(2) PRIMARY KEY 
);

INSERT INTO TYPE VALUES
	('Zarplata', 10);
INSERT INTO TYPE VALUES
	('Loto', 11);
INSERT INTO TYPE VALUES
	('Buy', 20);
INSERT INTO TYPE VALUES
	('Pay', 21);

COMMIT;


CREATE TABLE PROPERTY_TYPE
(
	prType_name	  CHAR(18)  NOT NULL ,
	id_type		  NUMBER(2) REFERENCES TYPE(id_type) NOT NULL ,
	id_prType	  NUMBER(3) PRIMARY KEY 
);

INSERT INTO PROPERTY_TYPE VALUES
	('Oklad', 10, 100);
INSERT INTO PROPERTY_TYPE VALUES
	('Premiya', 10, 101);
INSERT INTO PROPERTY_TYPE VALUES
	('SuperLoto', 11, 110);
INSERT INTO PROPERTY_TYPE VALUES
	('Eeat', 20, 200);
INSERT INTO PROPERTY_TYPE VALUES
	('GameSteam', 20, 201);
INSERT INTO PROPERTY_TYPE VALUES
	('Credit', 21, 210);

COMMIT;


CREATE TABLE EXPENSE
(
	id_exp		  NUMBER(2) PRIMARY KEY ,
	id_type		  NUMBER(2) REFERENCES TYPE(id_type) NOT NULL ,
	id_prType	  NUMBER(3) REFERENCES PROPERTY_TYPE (id_prType) NOT NULL 
);

INSERT INTO EXPENSE VALUES
	(20, 20, 200);
INSERT INTO EXPENSE VALUES
	(21, 20, 201);
INSERT INTO EXPENSE VALUES
	(22, 21, 210);

COMMIT;


CREATE TABLE INCOME
(
	id_income	  NUMBER(2) PRIMARY KEY ,
	id_type		  NUMBER(2) REFERENCES TYPE(id_type) NOT NULL ,
	id_prType	  NUMBER(3) REFERENCES PROPERTY_TYPE (id_prType) NOT NULL 
);

INSERT INTO INCOME VALUES
	(10, 10, 100);
INSERT INTO INCOME VALUES
	(11, 10, 101);
INSERT INTO INCOME VALUES
	(12, 11, 110);

COMMIT;


CREATE TABLE MEMBER
(
	id_mem		  NUMBER(2)  PRIMARY KEY,
	name_mem      CHAR(18)   NOT NULL,
    birthdate     DATE
);

INSERT INTO MEMBER VALUES
	(10, 'Mum',to_date('21-09-1971','dd-mm-yyyy'));
INSERT INTO MEMBER VALUES
	(11, 'Dad',to_date('21-09-1973','dd-mm-yyyy'));
INSERT INTO MEMBER VALUES
	(12, 'Me',to_date('21-09-2004','dd-mm-yyyy'));

COMMIT;


CREATE TABLE OPERATION
(
	id_operation  NUMBER(4) PRIMARY KEY ,
	Inc_Exp       NUMBER(1) ,
	id_mem		  NUMBER(2) REFERENCES MEMBER(id_mem)    NOT NULL ,
	id_type		  NUMBER(2) REFERENCES TYPE(id_type)     NOT NULL ,
	id_prType	  NUMBER(3) REFERENCES PROPERTY_TYPE (id_prType) NOT NULL, 
	date_op		  DATE ,
	description	  CHAR(18)  NOT NULL ,
	currency	  CHAR(18)  DEFAULT 'BYN',
	summ		  NUMBER(5) NOT NULL,
	cash_USD      NUMBER(5) NOT NULL,
	cash_BYN      NUMBER(5) NOT NULL
);

INSERT INTO OPERATION VALUES
	(1000, 1, 10, 10, 100, to_date('21-09-2018','dd-mm-yyyy'), 'Mum Zarplata Oklad',   'BYN', 500, 0, 500);
INSERT INTO OPERATION VALUES
	(1001, 1, 11, 10, 101, to_date('22-10-2018','dd-mm-yyyy'), 'Dad Zarpl Prem', 'BYN', 100, 0, 600);
INSERT INTO OPERATION VALUES
	(1002, 1, 12, 11, 110, to_date('23-11-2018','dd-mm-yyyy'), 'Me Loto SuperLoto',    'USD', 10, 10, 600);
INSERT INTO OPERATION VALUES
	(1003, 0, 10, 20, 200, to_date('24-11-2018','dd-mm-yyyy'), 'Mum Buy Eeat',         'BYN', -50, 10, 550);
INSERT INTO OPERATION VALUES
	(1004, 0, 12, 20, 201, to_date('10-08-2017','dd-mm-yyyy'), 'Me Buy GameSteam',     'USD', -3,   7, 550);
INSERT INTO OPERATION VALUES
	(1005, 0, 11, 21, 210, to_date('11-07-2018','dd-mm-yyyy'), 'Dad Pay Credit',       'BYN', -250, 7, 300);

COMMIT;
