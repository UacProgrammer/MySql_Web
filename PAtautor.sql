-- Procedimientos almacenado para la tabla Autor

USE bdbiblioteca;

-- Listar Autor
DROP PROCEDURE IF EXISTS splistarautor;

DELIMITER $$
CREATE PROCEDURE splistarautor()
BEGIN
	SELECT * FROM tautor;
END $$
DELIMITER ;

CALL splistarautor();

-- Agregar autor
DROP PROCEDURE IF EXISTS spagregarautor;

DELIMITER $$
CREATE PROCEDURE spagregarautor(
  IN vcodautor CHAR(5),
  IN vapellidos VARCHAR(50),
  IN vnombres VARCHAR(50),
  IN vnacionalidad VARCHAR(50)
  )
BEGIN
	INSERT INTO tautor(CodAutor, Apellidos, Nombres, Nacionalidad) VALUES(vcodautor, vapellidos, vnombres, vnacionalidad);
END $$
DELIMITER ;

CALL spagregarautor('A0003','Arguedas','Jose Maria','Peruano');
CALL spagregarautor('A0004','Ramon Ribeyro','Julio','Peruano');
CALL spagregarautor('A0005','Valdelomar','Abraham','Peruano','Literario');
CALL splistarautor();

-- PA eliminar autor
DROP PROCEDURE IF EXISTS speliminarautor;

DELIMITER $$
CREATE PROCEDURE speliminarautor(
	IN vcodautor CHAR(5)
)
BEGIN
	DELETE FROM tautor WHERE CodAutor = vcodautor;
END $$
DELIMITER ;

CALL speliminarautor('A0004');
CALL splistarautor;

-- Actualizar autor
DROP PROCEDURE IF EXISTS spactualizarautor;

DELIMITER $$
CREATE PROCEDURE spactualizarautor(
 IN vcodautor CHAR(5),
  IN vapellidos VARCHAR(50),
  IN vnombres VARCHAR(50),
  IN vnacionalidad VARCHAR(50)
)
BEGIN
	UPDATE  tautor SET Apellidos=vapellidos, Nombres=vnombres, Nacionalidad=vnacionalidad WHERE CodAutor=vcodautor;
END $$
DELIMITER ;

CALL spactualizarautor('A0001','Alegria','Ciro','Mexicano','Periodista');
CALL splistarautor;

-- Buscar libro
DROP PROCEDURE  IF EXISTS spbuscarautor;

DELIMITER $$
CREATE PROCEDURE spbuscarautor(
 IN vcodautor CHAR(5)
)

BEGIN
	SELECT * FROM tautor WHERE CodAutor =vcodautor;
END $$
DELIMITER ;

CALL spbuscarautor('A0001');
CALL splistarautor;