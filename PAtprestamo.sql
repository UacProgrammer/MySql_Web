-- Procedimientos almacenado para la tabla Prestamo

USE bdbiblioteca;

-- Listar prestamo
DROP PROCEDURE IF EXISTS splistarprestamo;

DELIMITER $$
CREATE PROCEDURE splistarprestamo()
BEGIN
	SELECT * FROM tprestamo;
END $$
DELIMITER ;

CALL splistarprestamo;

-- Agregar prestamo
DROP PROCEDURE IF EXISTS spagregarprestamo;

DELIMITER $$
CREATE PROCEDURE spagregarprestamo(
 IN vcodautor CHAR(5),
 IN vcodlibro CHAR(5),
 IN vfechaprestamo DATE
 )
 
BEGIN
	INSERT INTO tprestamo VALUES(vcodautor, vcodlibro, vfechaprestamo);
END $$
DELIMITER ;


CALL spagregarprestamo('A0002','L0002','2021/04/20','2021/04/21');
CALL spagregarprestamo('A0003','L0003','2021/04/21','2021/04/22');
CALL spagregarprestamo('A0004','L0004','2021/04/22','2021/04/23');
CALL splistarprestamo;

-- Eliminar prestamo
DROP PROCEDURE IF EXISTS speliminarprestamo;

DELIMITER $$
CREATE PROCEDURE speliminarprestamo(
	IN vcodautor CHAR(5)
)
BEGIN
	DELETE FROM tprestamo WHERE CodAutor = vcodautor;
END $$
DELIMITER ;

CALL speliminarprestamo('A0004');
CALL splistarprestamo;

-- Actualizar prestamo
DROP PROCEDURE IF EXISTS spactualizarprestamo;

DELIMITER $$
CREATE PROCEDURE spactualizarprestamo(
 IN vcodautor CHAR(5),
 IN vcodlibro CHAR(5),
 IN vfechaprestamo DATE
)
BEGIN
	UPDATE  tprestamo SET CodLibro=vcodlibro, FechaPrestamo=vfechaprestamo WHERE CodAutor=vcodautor;
END $$
DELIMITER ;

CALL spactualizarprestamo ('A0001','L0001','2020/04/19','2020/04/20');
CALL splistarprestamo;

-- Buscar prestamo
DROP PROCEDURE  IF EXISTS spbuscarprestamo;

DELIMITER $$
CREATE PROCEDURE spbuscarprestamo(
 IN vcodautor CHAR(5)
)

BEGIN
	SELECT * FROM tprestamo WHERE CodAutor =vcodautor;
END $$
DELIMITER ;

CALL spbuscarprestamo('A0001');
CALL splistarprestamo;

SELECT * FROM`bdbiblioteca`