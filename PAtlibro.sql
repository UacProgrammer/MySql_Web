-- Pa para la tabla libro

USE bdbiblioteca;
-- Listar libro
DROP PROCEDURE IF EXISTS splistarlibro;

DELIMITER $$
CREATE PROCEDURE splistarlibro()
BEGIN
	SELECT * FROM tlibro;
END $$
DELIMITER ;

CALL splistarlibro;

-- Agregar libro
DROP PROCEDURE IF EXISTS spagregarlibro;

DELIMITER $$
CREATE PROCEDURE spagregarlibro(
 IN vcodlibro CHAR(5),
 IN vtitulo VARCHAR(50),
 IN veditorial VARCHAR(50))
 BEGIN
	INSERT INTO tlibro VALUES (vcodlibro, vtitulo, veditorial);
END $$
DELIMITER ;

CALL spagregarlibro ('L0003','La sirenita','Mexico',1977);
CALL spagregarlibro ('L0004','PETER PAN','La libertad',1957);
CALL spagregarlibro ('L0005','El rey leon','Japon',2001);
CALL splistarlibro;

-- Eliminar libro
DROP PROCEDURE IF EXISTS speliminarlibro;

DELIMITER $$
CREATE PROCEDURE speliminarlibro(
	IN vcodlibro CHAR(5)
)
BEGIN
	DELETE FROM tlibro WHERE CodLibro = vcodlibro;
END $$
DELIMITER ;

CALL speliminarlibro('L0005');
CALL splistarlibro;

-- Actualizar libro
DROP PROCEDURE IF EXISTS spactualizarlibro;

DELIMITER $$
CREATE PROCEDURE spactualizarlibro(
 IN vcodlibro CHAR(5),
 IN vtitulo VARCHAR(50),
 IN veditorial VARCHAR(50)
)
BEGIN
	UPDATE  tlibro SET Titulo=vtitulo, Editorial=veditorial WHERE CodLibro=vcodlibro;
END $$
DELIMITER ;

CALL spactualizarlibro('L0001','Perros Hambrientos','Reino Unido',1999);
CALL splistarlibro;

-- Buscar libro
DROP PROCEDURE  IF EXIST spbuscarlibro;

DELIMITER $$
CREATE PROCEDURE spbuscarlibro(
 IN vcodlibro CHAR(5)
)

BEGIN
	SELECT * FROM tlibro WHERE CodLibro =vcodlibro;
END $$
DELIMITER ;

CALL spbuscarlibro('L0001');
CALL splistarlibro;