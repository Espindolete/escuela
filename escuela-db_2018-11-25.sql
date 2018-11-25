-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 25-11-2018 a las 17:55:49
-- Versión del servidor: 5.6.35
-- Versión de PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `id` int(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `curso_fk` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`id`, `nombre`, `curso_fk`) VALUES
(5, 'marcos peña', 17),
(18, 'asdasdasd', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno_has_notas`
--

CREATE TABLE `alumno_has_notas` (
  `id` int(11) NOT NULL,
  `idalumno` int(11) NOT NULL,
  `idnota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursohasmaterias`
--

CREATE TABLE `cursohasmaterias` (
  `idRel` int(11) NOT NULL,
  `curso_fk` int(11) NOT NULL,
  `materia_fk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursohasmaterias`
--

INSERT INTO `cursohasmaterias` (`idRel`, `curso_fk`, `materia_fk`) VALUES
(1, 17, 20),
(2, 18, 21),
(3, 18, 22);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(3) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `preceptor_fk` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `preceptor_fk`) VALUES
(17, 'martin redrado\'', 4),
(18, 'maarketees', 3),
(19, 'hostia', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `nombre`) VALUES
(18, 'Dejar en blanco'),
(20, 'menemologia'),
(21, 'astrologia'),
(22, 'hostiar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_has_profe`
--

CREATE TABLE `materia_has_profe` (
  `id` int(11) NOT NULL,
  `materia_fk` int(3) NOT NULL,
  `profe_fk` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materia_has_profe`
--

INSERT INTO `materia_has_profe` (`id`, `materia_fk`, `profe_fk`) VALUES
(1, 20, 1),
(2, 21, 2),
(3, 22, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id` int(3) NOT NULL,
  `materia_fk` int(3) NOT NULL,
  `curso_fk` int(3) NOT NULL,
  `trimestre` int(1) NOT NULL,
  `valor` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `materia_fk`, `curso_fk`, `trimestre`, `valor`) VALUES
(5, 20, 18, 1, 5),
(6, 20, 17, 1, 9),
(7, 21, 17, 1, 1),
(8, 21, 17, 3, 4),
(9, 21, 17, 3, 3),
(10, 21, 18, 2, 4),
(11, 21, 18, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preceptores`
--

CREATE TABLE `preceptores` (
  `id` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `user` varchar(15) NOT NULL,
  `pass` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preceptores`
--

INSERT INTO `preceptores` (`id`, `nombre`, `user`, `pass`) VALUES
(3, 'miriam', 'ejemplo', '1337'),
(4, 'romina menem', 'ro', 'mina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `id` int(3) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `user` varchar(15) NOT NULL,
  `pass` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`id`, `nombre`, `user`, `pass`) VALUES
(1, 'Dejar en blanco', '98989', '61616'),
(2, 'yo', 'juan', '123'),
(3, 'carlos menem', 'menem', 'master'),
(4, 'mauricio macri', 'skere', 'matic'),
(5, 'rodolfo mayorano', 'mayo', 'rano');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curso_fk` (`curso_fk`);

--
-- Indices de la tabla `alumno_has_notas`
--
ALTER TABLE `alumno_has_notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idalumno` (`idalumno`),
  ADD KEY `idnota` (`idnota`);

--
-- Indices de la tabla `cursohasmaterias`
--
ALTER TABLE `cursohasmaterias`
  ADD PRIMARY KEY (`idRel`),
  ADD KEY `IdCurso` (`curso_fk`),
  ADD KEY `IdMateria` (`materia_fk`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `preceptor_fk` (`preceptor_fk`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materia_has_profe`
--
ALTER TABLE `materia_has_profe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profe_fk` (`profe_fk`),
  ADD KEY `materia_fk` (`materia_fk`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_fk` (`materia_fk`),
  ADD KEY `curso_fk` (`curso_fk`);

--
-- Indices de la tabla `preceptores`
--
ALTER TABLE `preceptores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `alumno_has_notas`
--
ALTER TABLE `alumno_has_notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cursohasmaterias`
--
ALTER TABLE `cursohasmaterias`
  MODIFY `idRel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `materia_has_profe`
--
ALTER TABLE `materia_has_profe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `preceptores`
--
ALTER TABLE `preceptores`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `alumnos_ibfk_1` FOREIGN KEY (`curso_fk`) REFERENCES `cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumno_has_notas`
--
ALTER TABLE `alumno_has_notas`
  ADD CONSTRAINT `alumno_has_notas_ibfk_1` FOREIGN KEY (`idnota`) REFERENCES `notas` (`id`),
  ADD CONSTRAINT `alumno_has_notas_ibfk_2` FOREIGN KEY (`idalumno`) REFERENCES `alumnos` (`id`);

--
-- Filtros para la tabla `cursohasmaterias`
--
ALTER TABLE `cursohasmaterias`
  ADD CONSTRAINT `cursohasmaterias_ibfk_1` FOREIGN KEY (`curso_fk`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `cursohasmaterias_ibfk_2` FOREIGN KEY (`materia_fk`) REFERENCES `materias` (`id`);

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_3` FOREIGN KEY (`preceptor_fk`) REFERENCES `preceptores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `materia_has_profe`
--
ALTER TABLE `materia_has_profe`
  ADD CONSTRAINT `materia_has_profe_ibfk_1` FOREIGN KEY (`materia_fk`) REFERENCES `materias` (`id`),
  ADD CONSTRAINT `materia_has_profe_ibfk_2` FOREIGN KEY (`profe_fk`) REFERENCES `profesores` (`id`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`materia_fk`) REFERENCES `materias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_3` FOREIGN KEY (`curso_fk`) REFERENCES `cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
