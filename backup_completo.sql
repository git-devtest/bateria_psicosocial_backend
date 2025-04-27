-- MySQL dump 10.13  Distrib 8.4.4, for Linux (x86_64)
--
-- Host: localhost    Database: bateria_psicosocial
-- ------------------------------------------------------
-- Server version	8.4.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `bateria_psicosocial`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bateria_psicosocial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bateria_psicosocial`;

--
-- Table structure for table `empresas`
--

DROP TABLE IF EXISTS `empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `nit` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `direccion` text,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nit` (`nit`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresas`
--

LOCK TABLES `empresas` WRITE;
/*!40000 ALTER TABLE `empresas` DISABLE KEYS */;
INSERT INTO `empresas` VALUES (1,'AdminSistema','000000000-0','soporte@sistema.com','0000000000','N/A','2025-03-30 19:42:12'),(2,'Empresa A','900123456-7','contacto@empresaa.com','3001234567','Calle 123 #45-67, Ciudad','2025-03-30 19:43:00'),(3,'Empresa B','900765432-1','info@empresab.com','3017654321','Carrera 89 #12-34, Ciudad','2025-03-30 19:43:00');
/*!40000 ALTER TABLE `empresas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_empresas_insert` AFTER INSERT ON `empresas` FOR EACH ROW BEGIN
    INSERT INTO logs (usuario_id, tabla_afectada, accion, sentencia_sql)
    VALUES (@usuario_actual, 'empresas', 'INSERT', 
            CONCAT('INSERT INTO empresas (id, nombre, nit, email, telefono, direccion, fecha_registro) VALUES (',
                   NEW.id, ', "', NEW.nombre, '", "', NEW.nit, '", "', NEW.email, '", "', NEW.telefono, '", "', NEW.direccion, '", "', NEW.fecha_registro, '");'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_empresas_update` AFTER UPDATE ON `empresas` FOR EACH ROW BEGIN
    INSERT INTO logs (usuario_id, tabla_afectada, accion, sentencia_sql)
    VALUES (@usuario_actual, 'empresas', 'UPDATE', 
            CONCAT('UPDATE empresas SET nombre="', NEW.nombre, 
                   '", nit="', NEW.nit, 
                   '", email="', NEW.email, 
                   '", telefono="', NEW.telefono, 
                   '", direccion="', NEW.direccion, 
                   '", fecha_registro="', NEW.fecha_registro, 
                   '" WHERE id=', OLD.id, ';'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_empresas_delete` AFTER DELETE ON `empresas` FOR EACH ROW BEGIN
    INSERT INTO logs (usuario_id, tabla_afectada, accion, sentencia_sql)
    VALUES (@usuario_actual, 'empresas', 'DELETE', 
            CONCAT('DELETE FROM empresas WHERE id=', OLD.id, ';'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_civil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'Soltera(o)'),(2,'Casada(o)'),(3,'Unión Libre'),(4,'Separada(o)'),(5,'Divorciada(o)'),(6,'Viuda(o)'),(7,'Sacerdote/Monja');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estrato_serv_publicos_vivienda`
--

DROP TABLE IF EXISTS `estrato_serv_publicos_vivienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estrato_serv_publicos_vivienda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estrato` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estrato_serv_publicos_vivienda`
--

LOCK TABLES `estrato_serv_publicos_vivienda` WRITE;
/*!40000 ALTER TABLE `estrato_serv_publicos_vivienda` DISABLE KEYS */;
INSERT INTO `estrato_serv_publicos_vivienda` VALUES (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'Finca'),(8,'No Se');
/*!40000 ALTER TABLE `estrato_serv_publicos_vivienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estres_opciones_respuesta`
--

DROP TABLE IF EXISTS `estres_opciones_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estres_opciones_respuesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etiqueta` varchar(30) NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estres_opciones_respuesta`
--

LOCK TABLES `estres_opciones_respuesta` WRITE;
/*!40000 ALTER TABLE `estres_opciones_respuesta` DISABLE KEYS */;
INSERT INTO `estres_opciones_respuesta` VALUES (1,'Nunca',1),(2,'A veces',2),(3,'Casi siempre',3),(4,'Siempre',4);
/*!40000 ALTER TABLE `estres_opciones_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estres_preguntas`
--

DROP TABLE IF EXISTS `estres_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estres_preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estres_preguntas`
--

LOCK TABLES `estres_preguntas` WRITE;
/*!40000 ALTER TABLE `estres_preguntas` DISABLE KEYS */;
INSERT INTO `estres_preguntas` VALUES (1,'Dolores en el cuello y espalda o tensión muscular.'),(2,'Problemas gastrointestinales, úlcera péptica, acidez, problemas digestivos o del colon.'),(3,'Problemas respiratorios.'),(4,'Dolor de cabeza.'),(5,'Trastornos del sueño como somnolencia durante el día o desvelo en la noche.'),(6,'Palpitaciones en el pecho o problemas cardíacos.'),(7,'Cambios fuertes del apetito.'),(8,'Problemas relacionados con la función de los órganos genitales (impotencia, frigidez).'),(9,'Dificultad en las relaciones familiares.'),(10,'Dificultad para permanecer quieto o dificultad para iniciar actividades.'),(11,'Dificultad en las relaciones con otras personas.'),(12,'Sensación de aislamiento y desinterés.'),(13,'Sentimiento de sobrecarga de trabajo.'),(14,'Dificultad para concentrarse, olvidos frecuentes.'),(15,'Aumento en el número de accidentes de trabajo.'),(16,'Sentimiento de frustración, de no haber hecho lo que se quería en la vida.'),(17,'Cansancio, tedio o desgano.'),(18,'Disminución del rendimiento en el trabajo o poca creatividad.'),(19,'Deseo de no asistir al trabajo.'),(20,'Bajo compromiso o poco interés con lo que se hace.'),(21,'Dificultad para tomar decisiones.'),(22,'Temor de cambiar de empleo.'),(23,'Sentimiento de soledad y miedo.'),(24,'Sentimiento de irritabilidad, actitudes y pensamientos negativos.'),(25,'Sentimiento de angustia, preocupación o tristeza.'),(26,'Consumo de drogas para aliviar la tensión o los nervios.'),(27,'Sentimientos de que “no vale nada”, o “no sirve para nada”.'),(28,'Consumo de bebidas alcohólicas o café o cigarrillo.'),(29,'Sentimiento de que está perdiendo la razón.'),(30,'Comportamientos rígidos, obstinación o terquedad.'),(31,'Sensación de no poder manejar los problemas de la vida.');
/*!40000 ALTER TABLE `estres_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estres_respuestas`
--

DROP TABLE IF EXISTS `estres_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estres_respuestas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_formulario` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `id_opcion_respuesta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_formulario` (`id_formulario`),
  KEY `id_pregunta` (`id_pregunta`),
  KEY `id_opcion_respuesta` (`id_opcion_respuesta`),
  CONSTRAINT `estres_respuestas_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `form_datos_generales` (`id`),
  CONSTRAINT `estres_respuestas_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `estres_preguntas` (`id`),
  CONSTRAINT `estres_respuestas_ibfk_3` FOREIGN KEY (`id_opcion_respuesta`) REFERENCES `estres_opciones_respuesta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estres_respuestas`
--

LOCK TABLES `estres_respuestas` WRITE;
/*!40000 ALTER TABLE `estres_respuestas` DISABLE KEYS */;
INSERT INTO `estres_respuestas` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,1,4,4),(5,1,5,1),(6,1,6,1),(7,1,7,2),(8,1,8,3),(9,1,9,3),(10,1,10,1),(11,1,11,4),(12,1,12,2),(13,1,13,2),(14,1,14,1),(15,1,15,3),(16,1,16,2),(17,1,17,1),(18,1,18,4),(19,1,19,3),(20,1,20,1),(21,1,21,2),(22,1,22,3),(23,1,23,4),(24,1,24,1),(25,1,25,1),(26,1,26,1),(27,1,27,2),(28,1,28,3),(29,1,29,4),(30,1,30,3),(31,1,31,3);
/*!40000 ALTER TABLE `estres_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extralaboral_opciones_respuesta`
--

DROP TABLE IF EXISTS `extralaboral_opciones_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extralaboral_opciones_respuesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etiqueta` varchar(30) NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extralaboral_opciones_respuesta`
--

LOCK TABLES `extralaboral_opciones_respuesta` WRITE;
/*!40000 ALTER TABLE `extralaboral_opciones_respuesta` DISABLE KEYS */;
INSERT INTO `extralaboral_opciones_respuesta` VALUES (1,'Siempre',1),(2,'Casi siempre',2),(3,'Algunas veces',3),(4,'Casi nunca',4),(5,'Nunca',5);
/*!40000 ALTER TABLE `extralaboral_opciones_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extralaboral_preguntas`
--

DROP TABLE IF EXISTS `extralaboral_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extralaboral_preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extralaboral_preguntas`
--

LOCK TABLES `extralaboral_preguntas` WRITE;
/*!40000 ALTER TABLE `extralaboral_preguntas` DISABLE KEYS */;
INSERT INTO `extralaboral_preguntas` VALUES (1,'Es fácil trasportarme entre mi casa y el trabajo'),(2,'Tengo que tomar varios medios de transporte para llegar a mi lugar de trabajo'),(3,'Paso mucho tiempo viajando de ida y regreso al trabajo'),(4,'Me trasporto cómodamente entre mi casa y el trabajo'),(5,'La zona donde vivo es segura'),(6,'En la zona donde vivo se presentan hurtos y mucha delincuencia'),(7,'Desde donde vivo me es fácil llegar al centro médico donde me atienden'),(8,'Cerca a mi vivienda las vías están en buenas condiciones'),(9,'Cerca a mi vivienda encuentro fácilmente transporte'),(10,'Las condiciones de mi vivienda son buenas'),(11,'En mi vivienda hay servicios de agua y luz'),(12,'Las condiciones de mi vivienda me permiten descansar cuando lo requiero'),(13,'Las condiciones de mi vivienda me permiten sentirme cómodo'),(14,'Me queda tiempo para actividades de recreación'),(15,'Fuera del trabajo tengo tiempo suficiente para descansar'),(16,'Tengo tiempo para atender mis asuntos personales y del hogar'),(17,'Tengo tiempo para compartir con mi familia o amigos'),(18,'Tengo buena comunicación con las personas cercanas'),(19,'Las relaciones con mis amigos son buenas'),(20,'Converso con personas cercanas sobre diferentes temas'),(21,'Mis amigos están dispuestos a escucharme cuando tengo problemas'),(22,'Cuento con el apoyo de mi familia cuando tengo problemas'),(23,'Puedo hablar con personas cercanas sobre las cosas que me pasan'),(24,'Mis problemas personales o familiares afectan mi trabajo'),(25,'La relación con mi familia cercana es cordial'),(26,'Mis problemas personales o familiares me quitan la energía que necesito para trabajar'),(27,'Los problemas con mis familiares los resolvemos de manera amistosa'),(28,'Mis problemas personales o familiares afectan mis relaciones en el trabajo'),(29,'El dinero que ganamos en el hogar alcanza para cubrir los gastos básicos'),(30,'Tengo otros compromisos económicos que afectan mucho el presupuesto familiar'),(31,'En mi hogar tenemos deudas difíciles de pagar');
/*!40000 ALTER TABLE `extralaboral_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extralaboral_respuestas`
--

DROP TABLE IF EXISTS `extralaboral_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extralaboral_respuestas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_formulario` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `id_opcion_respuesta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_formulario` (`id_formulario`),
  KEY `id_pregunta` (`id_pregunta`),
  KEY `id_opcion_respuesta` (`id_opcion_respuesta`),
  CONSTRAINT `extralaboral_respuestas_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `form_datos_generales` (`id`),
  CONSTRAINT `extralaboral_respuestas_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `extralaboral_preguntas` (`id`),
  CONSTRAINT `extralaboral_respuestas_ibfk_3` FOREIGN KEY (`id_opcion_respuesta`) REFERENCES `extralaboral_opciones_respuesta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extralaboral_respuestas`
--

LOCK TABLES `extralaboral_respuestas` WRITE;
/*!40000 ALTER TABLE `extralaboral_respuestas` DISABLE KEYS */;
INSERT INTO `extralaboral_respuestas` VALUES (1,1,1,1),(2,1,2,2),(3,1,3,3),(4,1,4,4),(5,1,5,5),(6,1,6,1),(7,1,7,5),(8,1,8,3),(9,1,9,3),(10,1,10,1),(11,1,11,4),(12,1,12,3),(13,1,13,2),(14,1,14,5),(15,1,15,3),(16,1,16,2),(17,1,17,1),(18,1,18,5),(19,1,19,3),(20,1,20,1),(21,1,21,2),(22,1,22,3),(23,1,23,4),(24,1,24,5),(25,1,25,1),(26,1,26,5),(27,1,27,2),(28,1,28,3),(29,1,29,4),(30,1,30,5),(31,1,31,3);
/*!40000 ALTER TABLE `extralaboral_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_datos_generales`
--

DROP TABLE IF EXISTS `form_datos_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_datos_generales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_aplicacion` date NOT NULL,
  `identificacion_respondiente` varchar(12) NOT NULL,
  `nombre_completo` varchar(60) NOT NULL,
  `sexo` int NOT NULL,
  `año_nacimiento` varchar(4) NOT NULL,
  `estado_civil` int NOT NULL,
  `ultimo_nivel_estudios` int NOT NULL,
  `ocupacion_profesion` varchar(60) NOT NULL,
  `lugar_residencia_actual_ciudad_mpio` varchar(60) NOT NULL,
  `lugar_residencia_actual_depto` varchar(60) NOT NULL,
  `estrato_serv_publicos_vivienda` int NOT NULL,
  `tipo_vivienda` int NOT NULL,
  `num_personas_dependientes_respondiente` int NOT NULL,
  `lugar_trabajo_actual_ciudad_mpio` varchar(60) NOT NULL,
  `lugar_trabajo_actual_depto` varchar(60) NOT NULL,
  `cuantos_anios_trabaja_empresa_menos_un_año` int NOT NULL,
  `cuantos_anios_trabaja_empresa_mas_un_año` int NOT NULL,
  `nombre_cargo_empresa` varchar(60) NOT NULL,
  `tipo_cargo` int NOT NULL,
  `cuantos_anios_desempenia_cargo_empresa_menos_un_año` int NOT NULL,
  `cuantos_anios_desempenia_cargo_empresa_mas_un_año` int NOT NULL,
  `nombre_depto_area_seccion_empresa` varchar(60) NOT NULL,
  `tipo_contrato` int NOT NULL,
  `horas_diarias_trabajo_cargo` int NOT NULL,
  `tipo_salario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sexo` (`sexo`),
  KEY `fk_estado_civil` (`estado_civil`),
  KEY `fk_nivel_estudios` (`ultimo_nivel_estudios`),
  KEY `fk_estrato` (`estrato_serv_publicos_vivienda`),
  KEY `fk_tipo_vivienda` (`tipo_vivienda`),
  KEY `fk_tipo_cargo` (`tipo_cargo`),
  KEY `fk_tipo_contrato` (`tipo_contrato`),
  KEY `fk_tipo_salario` (`tipo_salario`),
  CONSTRAINT `fk_estado_civil` FOREIGN KEY (`estado_civil`) REFERENCES `estado_civil` (`id`),
  CONSTRAINT `fk_estrato` FOREIGN KEY (`estrato_serv_publicos_vivienda`) REFERENCES `estrato_serv_publicos_vivienda` (`id`),
  CONSTRAINT `fk_nivel_estudios` FOREIGN KEY (`ultimo_nivel_estudios`) REFERENCES `ultimo_nivel_estudios` (`id`),
  CONSTRAINT `fk_sexo` FOREIGN KEY (`sexo`) REFERENCES `sexo` (`id`),
  CONSTRAINT `fk_tipo_cargo` FOREIGN KEY (`tipo_cargo`) REFERENCES `tipo_cargo` (`id`),
  CONSTRAINT `fk_tipo_contrato` FOREIGN KEY (`tipo_contrato`) REFERENCES `tipo_contrato` (`id`),
  CONSTRAINT `fk_tipo_salario` FOREIGN KEY (`tipo_salario`) REFERENCES `tipo_salario` (`id`),
  CONSTRAINT `fk_tipo_vivienda` FOREIGN KEY (`tipo_vivienda`) REFERENCES `tipo_vivienda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_datos_generales`
--

LOCK TABLES `form_datos_generales` WRITE;
/*!40000 ALTER TABLE `form_datos_generales` DISABLE KEYS */;
INSERT INTO `form_datos_generales` VALUES (1,'2025-04-17','16842961','Jhon Harold Hincapie Marulanda',2,'1981',1,8,'Empleado Asalariado','Jamundí','Valle del Cauca',1,1,2,'Jamundí','Valle del Cauca',0,0,'LIDER TI',2,0,0,'SISTEMAS',3,8,1);
/*!40000 ALTER TABLE `form_datos_generales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intralaboral_a_opciones_respuesta`
--

DROP TABLE IF EXISTS `intralaboral_a_opciones_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intralaboral_a_opciones_respuesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etiqueta` varchar(30) NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intralaboral_a_opciones_respuesta`
--

LOCK TABLES `intralaboral_a_opciones_respuesta` WRITE;
/*!40000 ALTER TABLE `intralaboral_a_opciones_respuesta` DISABLE KEYS */;
INSERT INTO `intralaboral_a_opciones_respuesta` VALUES (1,'Siempre',1),(2,'Casi siempre',2),(3,'Algunas veces',3),(4,'Casi nunca',4),(5,'Nunca',5);
/*!40000 ALTER TABLE `intralaboral_a_opciones_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intralaboral_a_preguntas`
--

DROP TABLE IF EXISTS `intralaboral_a_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intralaboral_a_preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intralaboral_a_preguntas`
--

LOCK TABLES `intralaboral_a_preguntas` WRITE;
/*!40000 ALTER TABLE `intralaboral_a_preguntas` DISABLE KEYS */;
INSERT INTO `intralaboral_a_preguntas` VALUES (1,'El ruido en el lugar donde trabajo es molesto'),(2,'En el lugar donde trabajo hace mucho frío'),(3,'En el lugar donde trabajo hace mucho calor'),(4,'El aire en el lugar donde trabajo es fresco y agradable'),(5,'La luz del sitio donde trabajo es agradable'),(6,'El espacio donde trabajo es cómodo'),(7,'En mi trabajo me preocupa estar expuesto a sustancias químicas que afecten mi salud'),(8,'Mi trabajo me exige hacer mucho esfuerzo físico'),(9,'Los equipos o herramientas con los que trabajo son cómodos'),(10,'En mi trabajo me preocupa estar expuesto a microbios, animales o plantas que afecten mi salud'),(11,'Me preocupa accidentarme en mi trabajo'),(12,'El lugar donde trabajo es limpio y ordenado'),(13,'Por la cantidad de trabajo que tengo debo quedarme tiempo adicional'),(14,'Me alcanza el tiempo de trabajo para tener al día mis deberes'),(15,'Por la cantidad de trabajo que tengo debo trabajar sin parar'),(16,'Mi trabajo me exige hacer mucho esfuerzo mental'),(17,'Mi trabajo me exige estar muy concentrado'),(18,'Mi trabajo me exige memorizar mucha información'),(19,'En mi trabajo tengo que tomar decisiones difíciles muy rápido'),(20,'Mi trabajo me exige atender a muchos asuntos al mismo tiempo'),(21,'Mi trabajo requiere que me fije en pequeños detalles'),(22,'En mi trabajo respondo por cosas de mucho valor'),(23,'En mi trabajo respondo por dinero de la empresa'),(24,'Como parte de mis funciones debo responder por la seguridad de otros'),(25,'Respondo ante mi jefe por los resultados de toda mi área de trabajo'),(26,'Mi trabajo me exige cuidar la salud de otras personas'),(27,'En el trabajo me dan órdenes contradictorias'),(28,'En mi trabajo me piden hacer cosas innecesarias'),(29,'En mi trabajo se presentan situaciones en las que debo pasar por alto normas o procedimientos'),(30,'En mi trabajo tengo que hacer cosas que se podrían hacer de una forma más práctica'),(31,'Trabajo en horario de noche'),(32,'En mi trabajo es posible tomar pausas para descansar'),(33,'Mi trabajo me exige laborar en días de descanso, festivos o fines de semana'),(34,'En mi trabajo puedo tomar fines de semana o días de descanso al mes'),(35,'Cuando estoy en casa sigo pensando en el trabajo'),(36,'Discuto con mi familia o amigos por causa de mi trabajo'),(37,'Debo atender asuntos de trabajo cuando estoy en casa'),(38,'Por mi trabajo el tiempo que paso con mi familia y amigos es muy poco'),(39,'Mi trabajo me permite desarrollar mis habilidades'),(40,'Mi trabajo me permite aplicar mis conocimientos'),(41,'Mi trabajo me permite aprender nuevas cosas'),(42,'Me asignan el trabajo teniendo en cuenta mis capacidades'),(43,'Puedo tomar pausas cuando las necesito'),(44,'Puedo decidir cuánto trabajo hago en el día'),(45,'Puedo decidir la velocidad a la que trabajo'),(46,'Puedo cambiar el orden de las actividades en mi trabajo'),(47,'Puedo parar un momento mi trabajo para atender algún asunto personal'),(48,'Los cambios en mi trabajo han sido beneficiosos'),(49,'Me explican claramente los cambios que ocurren en mi trabajo'),(50,'Puedo dar sugerencias sobre los cambios que ocurren en mi trabajo'),(51,'Cuando se presentan cambios en mi trabajo se tienen en cuenta mis ideas y sugerencias'),(52,'Los cambios que se presentan en mi trabajo dificultan mi labor'),(53,'Me informan con claridad cuáles son mis funciones'),(54,'Me informan cuáles son las decisiones que puedo tomar en mi trabajo'),(55,'Me explican claramente los resultados que debo lograr en mi trabajo'),(56,'Me explican claramente el efecto de mi trabajo en la empresa'),(57,'Me explican claramente los objetivos de mi trabajo'),(58,'Me informan claramente quien me puede orientar para hacer mi trabajo'),(59,'Me informan claramente con quien puedo resolver los asuntos de trabajo'),(60,'La empresa me permite asistir a capacitaciones relacionadas con mi trabajo'),(61,'Recibo capacitación útil para hacer mi trabajo'),(62,'Recibo capacitación que me ayuda a hacer mejor mi trabajo'),(63,'Mi jefe me da instrucciones claras'),(64,'Mi jefe ayuda a organizar mejor el trabajo'),(65,'Mi jefe tiene en cuenta mis puntos de vista y opiniones'),(66,'Mi jefe me anima para hacer mejor mi trabajo'),(67,'Mi jefe distribuye las tareas de forma que me facilita el trabajo'),(68,'Mi jefe me comunica a tiempo la información relacionada con el trabajo'),(69,'La orientación que me da mi jefe me ayuda a hacer mejor el trabajo'),(70,'Mi jefe me ayuda a progresar en el trabajo'),(71,'Mi jefe me ayuda a sentirme bien en el trabajo'),(72,'Mi jefe ayuda a solucionar los problemas que se presentan en el trabajo'),(73,'Siento que puedo confiar en mi jefe'),(74,'Mi jefe me escucha cuando tengo problemas de trabajo'),(75,'Mi jefe me brinda su apoyo cuando lo necesito'),(76,'Me agrada el ambiente de mi grupo de trabajo'),(77,'En mi grupo de trabajo me tratan de forma respetuosa'),(78,'Siento que puedo confiar en mis compañeros de trabajo'),(79,'Me siento a gusto con mis compañeros de trabajo'),(80,'En mi grupo de trabajo algunas personas me maltratan'),(81,'Entre compañeros solucionamos los problemas de forma respetuosa'),(82,'Hay integración en mi grupo de trabajo'),(83,'Mi grupo de trabajo es muy unido'),(84,'Las personas en mi trabajo me hacen sentir parte del grupo'),(85,'Cuando tenemos que realizar trabajo de grupo los compañeros colaboran'),(86,'Es fácil poner de acuerdo al grupo para hacer el trabajo'),(87,'Mis compañeros de trabajo me ayudan cuando tengo dificultades'),(88,'En mi trabajo las personas nos apoyamos unos a otros'),(89,'Algunos compañeros de trabajo me escuchan cuando tengo problemas'),(90,'Me informan sobre lo que hago bien en mi trabajo'),(91,'Me informan sobre lo que debo mejorar en mi trabajo'),(92,'La información que recibo sobre mi rendimiento en el trabajo es clara'),(93,'La forma como evalúan mi trabajo en la empresa me ayuda a mejorar'),(94,'Me informan a tiempo sobre lo que debo mejorar en el trabajo'),(95,'En la empresa confían en mi trabajo'),(96,'En la empresa me pagan a tiempo mi salario'),(97,'El pago que recibo es el que me ofreció la empresa'),(98,'El pago que recibo es el que merezco por el trabajo que realizo'),(99,'En mi trabajo tengo posibilidades de progresar'),(100,'Las personas que hacen bien el trabajo pueden progresar en la empresa'),(101,'La empresa se preocupa por el bienestar de los trabajadores'),(102,'Mi trabajo en la empresa es estable'),(103,'El trabajo que hago me hace sentir bien'),(104,'Siento orgullo de trabajar en esta empresa'),(105,'Hablo bien de la empresa con otras personas'),(106,'Atiendo clientes o usuarios muy enojados'),(107,'Atiendo clientes o usuarios muy preocupados'),(108,'Atiendo clientes o usuarios muy tristes'),(109,'Mi trabajo me exige atender personas muy enfermas'),(110,'Mi trabajo me exige atender personas muy necesitadas de ayuda'),(111,'Atiendo clientes o usuarios que me maltratan'),(112,'Para hacer mi trabajo debo demostrar sentimientos distintos a los míos'),(113,'Mi trabajo me exige atender situaciones de violencia'),(114,'Mi trabajo me exige atender situaciones muy tristes o dolorosas'),(115,'Tengo colaboradores que comunican tarde los asuntos de trabajo'),(116,'Tengo colaboradores que tienen comportamientos irrespetuosos'),(117,'Tengo colaboradores que dificultan la organización del trabajo'),(118,'Tengo colaboradores que guardan silencio cuando les piden opiniones'),(119,'Tengo colaboradores que dificultan el logro de los resultados del trabajo'),(120,'Tengo colaboradores que expresan de forma irrespetuosa sus desacuerdos'),(121,'Tengo colaboradores que cooperan poco cuando se necesita'),(122,'Tengo colaboradores que me preocupan por su desempeño'),(123,'Tengo colaboradores que ignoran las sugerencias para mejorar su trabajo');
/*!40000 ALTER TABLE `intralaboral_a_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intralaboral_a_respuestas`
--

DROP TABLE IF EXISTS `intralaboral_a_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intralaboral_a_respuestas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_formulario` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `id_opcion_respuesta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_formulario` (`id_formulario`),
  KEY `id_pregunta` (`id_pregunta`),
  KEY `id_opcion_respuesta` (`id_opcion_respuesta`),
  CONSTRAINT `intralaboral_a_respuestas_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `form_datos_generales` (`id`),
  CONSTRAINT `intralaboral_a_respuestas_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `intralaboral_a_preguntas` (`id`),
  CONSTRAINT `intralaboral_a_respuestas_ibfk_3` FOREIGN KEY (`id_opcion_respuesta`) REFERENCES `intralaboral_a_opciones_respuesta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intralaboral_a_respuestas`
--

LOCK TABLES `intralaboral_a_respuestas` WRITE;
/*!40000 ALTER TABLE `intralaboral_a_respuestas` DISABLE KEYS */;
INSERT INTO `intralaboral_a_respuestas` VALUES (1,1,1,3),(2,1,2,3),(3,1,3,3),(4,1,4,4),(5,1,5,4),(6,1,6,5),(7,1,7,1),(8,1,8,5),(9,1,9,4),(10,1,10,2),(11,1,11,5),(12,1,12,2),(13,1,13,3),(14,1,14,1),(15,1,15,2),(16,1,16,2),(17,1,17,2),(18,1,18,5),(19,1,19,3),(20,1,20,2),(21,1,21,4),(22,1,22,1),(23,1,23,5),(24,1,24,5),(25,1,25,2),(26,1,26,2),(27,1,27,2),(28,1,28,2),(29,1,29,2),(30,1,30,3),(31,1,31,1),(32,1,32,3),(33,1,33,3),(34,1,34,3),(35,1,35,4),(36,1,36,5),(37,1,37,2),(38,1,38,4),(39,1,39,3),(40,1,40,3),(41,1,41,5),(42,1,42,5),(43,1,43,4),(44,1,44,2),(45,1,45,2),(46,1,46,1),(47,1,47,5),(48,1,48,4),(49,1,49,5),(50,1,50,2),(51,1,51,1),(52,1,52,5),(53,1,53,5),(54,1,54,1),(55,1,55,1),(56,1,56,5),(57,1,57,2),(58,1,58,1),(59,1,59,1),(60,1,60,2),(61,1,61,4),(62,1,62,5),(63,1,63,4),(64,1,64,5),(65,1,65,2),(66,1,66,5),(67,1,67,3),(68,1,68,3),(69,1,69,2),(70,1,70,3),(71,1,71,4),(72,1,72,5),(73,1,73,2),(74,1,74,1),(75,1,75,2),(76,1,76,2),(77,1,77,5),(78,1,78,3),(79,1,79,1),(80,1,80,2),(81,1,81,1),(82,1,82,1),(83,1,83,4),(84,1,84,4),(85,1,85,3),(86,1,86,3),(87,1,87,1),(88,1,88,5),(89,1,89,5),(90,1,90,3),(91,1,91,3),(92,1,92,5),(93,1,93,4),(94,1,94,4),(95,1,95,4),(96,1,96,5),(97,1,97,4),(98,1,98,4),(99,1,99,3),(100,1,100,2),(101,1,101,2),(102,1,102,3),(103,1,103,5),(104,1,104,5),(105,1,105,1),(106,1,106,5),(107,1,107,5),(108,1,108,1),(109,1,109,3),(110,1,110,4),(111,1,111,1),(112,1,112,4),(113,1,113,5),(114,1,114,5),(115,1,115,5),(116,1,116,2),(117,1,117,3),(118,1,118,5),(119,1,119,2),(120,1,120,3),(121,1,121,1),(122,1,122,4),(123,1,123,1);
/*!40000 ALTER TABLE `intralaboral_a_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intralaboral_b_opciones_respuesta`
--

DROP TABLE IF EXISTS `intralaboral_b_opciones_respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intralaboral_b_opciones_respuesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `etiqueta` varchar(30) NOT NULL,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intralaboral_b_opciones_respuesta`
--

LOCK TABLES `intralaboral_b_opciones_respuesta` WRITE;
/*!40000 ALTER TABLE `intralaboral_b_opciones_respuesta` DISABLE KEYS */;
INSERT INTO `intralaboral_b_opciones_respuesta` VALUES (1,'Siempre',1),(2,'Casi siempre',2),(3,'Algunas veces',3),(4,'Casi nunca',4),(5,'Nunca',5);
/*!40000 ALTER TABLE `intralaboral_b_opciones_respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intralaboral_b_preguntas`
--

DROP TABLE IF EXISTS `intralaboral_b_preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intralaboral_b_preguntas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intralaboral_b_preguntas`
--

LOCK TABLES `intralaboral_b_preguntas` WRITE;
/*!40000 ALTER TABLE `intralaboral_b_preguntas` DISABLE KEYS */;
INSERT INTO `intralaboral_b_preguntas` VALUES (1,'El ruido en el lugar donde trabajo es molesto'),(2,'En el lugar donde trabajo hace mucho frío'),(3,'En el lugar donde trabajo hace mucho calor'),(4,'El aire en el lugar donde trabajo es fresco y agradable'),(5,'La luz del sitio donde trabajo es agradable'),(6,'El espacio donde trabajo es cómodo'),(7,'En mi trabajo me preocupa estar expuesto a sustancias químicas que afecten mi salud'),(8,'Mi trabajo me exige hacer mucho esfuerzo físico'),(9,'Los equipos o herramientas con los que trabajo son cómodos'),(10,'En mi trabajo me preocupa estar expuesto a microbios, animales o plantas que afecten mi salud'),(11,'Me preocupa accidentarme en mi trabajo'),(12,'El lugar donde trabajo es limpio y ordenado'),(13,'Por la cantidad de trabajo que tengo debo quedarme tiempo adicional'),(14,'Me alcanza el tiempo de trabajo para tener al día mis deberes'),(15,'Por la cantidad de trabajo que tengo debo trabajar sin parar'),(16,'Mi trabajo me exige hacer mucho esfuerzo mental'),(17,'Mi trabajo me exige estar muy concentrado'),(18,'Mi trabajo me exige memorizar mucha información'),(19,'En mi trabajo tengo que hacer cálculos matemáticos'),(20,'Mi trabajo requiere que me fije en pequeños detalles'),(21,'Trabajo en horario de noche'),(22,'En mi trabajo es posible tomar pausas para descansar'),(23,'Mi trabajo me exige laborar en días de descanso, festivos o fines de semana'),(24,'En mi trabajo puedo tomar fines de semana o días de descanso al mes'),(25,'Cuando estoy en casa sigo pensando en el trabajo'),(26,'Discuto con mi familia o amigos por causa de mi trabajo'),(27,'Debo atender asuntos de trabajo cuando estoy en casa'),(28,'Por mi trabajo el tiempo que paso con mi familia y amigos es muy poco'),(29,'En mi trabajo puedo hacer cosas nuevas'),(30,'Mi trabajo me permite desarrollar mis habilidades'),(31,'Mi trabajo me permite aplicar mis conocimientos'),(32,'Mi trabajo me permite aprender nuevas cosas'),(33,'Puedo tomar pausas cuando las necesito'),(34,'Puedo decidir cuánto trabajo hago en el día'),(35,'Puedo decidir la velocidad a la que trabajo'),(36,'Puedo cambiar el orden de las actividades en mi trabajo'),(37,'Puedo parar un momento mi trabajo para atender algún asunto personal'),(38,'Me explican claramente los cambios que ocurren en mi trabajo'),(39,'Puedo dar sugerencias sobre los cambios que ocurren en mi trabajo'),(40,'Cuando se presentan cambios en mi trabajo se tienen en cuenta mis ideas y sugerencias'),(41,'Me informan con claridad cuáles son mis funciones'),(42,'Me informan cuáles son las decisiones que puedo tomar en mi trabajo'),(43,'Me explican claramente los resultados que debo lograr en mi trabajo'),(44,'Me explican claramente los objetivos de mi trabajo'),(45,'Me informan claramente con quien puedo resolver los asuntos de trabajo'),(46,'La empresa me permite asistir a capacitaciones relacionadas con mi trabajo'),(47,'Recibo capacitación útil para hacer mi trabajo'),(48,'Recibo capacitación que me ayuda a hacer mejor mi trabajo'),(49,'Mi jefe ayuda a organizar mejor el trabajo'),(50,'Mi jefe tiene en cuenta mis puntos de vista y opiniones'),(51,'Mi jefe me anima para hacer mejor mi trabajo'),(52,'Mi jefe distribuye las tareas de forma que me facilita el trabajo'),(53,'Mi jefe me comunica a tiempo la información relacionada con el trabajo'),(54,'La orientación que me da mi jefe me ayuda a hacer mejor el trabajo'),(55,'Mi jefe me ayuda a progresar en el trabajo'),(56,'Mi jefe me ayuda a sentirme bien en el trabajo'),(57,'Mi jefe ayuda a solucionar los problemas que se presentan en el trabajo'),(58,'Mi jefe me trata con respeto'),(59,'Siento que puedo confiar en mi jefe'),(60,'Mi jefe me escucha cuando tengo problemas de trabajo'),(61,'Mi jefe me brinda su apoyo cuando lo necesito'),(62,'Me agrada el ambiente de mi grupo de trabajo'),(63,'En mi grupo de trabajo me tratan de forma respetuosa'),(64,'Siento que puedo confiar en mis compañeros de trabajo'),(65,'Me siento a gusto con mis compañeros de trabajo'),(66,'En mi grupo de trabajo algunas personas me maltratan'),(67,'Entre compañeros solucionamos los problemas de forma respetuosa'),(68,'Mi grupo de trabajo es muy unido'),(69,'Cuando tenemos que realizar trabajo de grupo los compañeros colaboran'),(70,'Es fácil poner de acuerdo al grupo para hacer el trabajo'),(71,'Mis compañeros de trabajo me ayudan cuando tengo dificultades'),(72,'En mi trabajo las personas nos apoyamos unos a otros'),(73,'Algunos compañeros de trabajo me escuchan cuando tengo problemas'),(74,'Me informan sobre lo que hago bien en mi trabajo'),(75,'Me informan sobre lo que debo mejorar en mi trabajo'),(76,'La información que recibo sobre mi rendimiento en el trabajo es clara'),(77,'La forma como evalúan mi trabajo en la empresa me ayuda a mejorar'),(78,'Me informan a tiempo sobre lo que debo mejorar en el trabajo'),(79,'En la empresa me pagan a tiempo mi salario'),(80,'El pago que recibo es el que me ofreció la empresa'),(81,'El pago que recibo es el que merezco por el trabajo que realizo'),(82,'En mi trabajo tengo posibilidades de progresar'),(83,'Las personas que hacen bien el trabajo pueden progresar en la empresa'),(84,'La empresa se preocupa por el bienestar de los trabajadores'),(85,'Mi trabajo en la empresa es estable'),(86,'El trabajo que hago me hace sentir bien'),(87,'Siento orgullo de trabajar en esta empresa'),(88,'Hablo bien de la empresa con otras personas'),(89,'Atiendo clientes o usuarios muy enojados'),(90,'Atiendo clientes o usuarios muy preocupados'),(91,'Atiendo clientes o usuarios muy tristes'),(92,'Mi trabajo me exige atender personas muy enfermas'),(93,'Mi trabajo me exige atender personas muy necesitadas de ayuda'),(94,'Atiendo clientes o usuarios que me maltratan'),(95,'Mi trabajo me exige atender situaciones de violencia'),(96,'Mi trabajo me exige atender situaciones muy tristes o dolorosas'),(97,'Puedo expresar tristeza o enojo frente a las personas que atiendo');
/*!40000 ALTER TABLE `intralaboral_b_preguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intralaboral_b_respuestas`
--

DROP TABLE IF EXISTS `intralaboral_b_respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intralaboral_b_respuestas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_formulario` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `id_opcion_respuesta` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_formulario` (`id_formulario`),
  KEY `id_pregunta` (`id_pregunta`),
  KEY `id_opcion_respuesta` (`id_opcion_respuesta`),
  CONSTRAINT `intralaboral_b_respuestas_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `form_datos_generales` (`id`),
  CONSTRAINT `intralaboral_b_respuestas_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `intralaboral_b_preguntas` (`id`),
  CONSTRAINT `intralaboral_b_respuestas_ibfk_3` FOREIGN KEY (`id_opcion_respuesta`) REFERENCES `intralaboral_b_opciones_respuesta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intralaboral_b_respuestas`
--

LOCK TABLES `intralaboral_b_respuestas` WRITE;
/*!40000 ALTER TABLE `intralaboral_b_respuestas` DISABLE KEYS */;
INSERT INTO `intralaboral_b_respuestas` VALUES (1,1,1,1),(2,1,2,3),(3,1,3,2),(4,1,4,2),(5,1,5,2),(6,1,6,2),(7,1,7,4),(8,1,8,4),(9,1,9,5),(10,1,10,3),(11,1,11,1),(12,1,12,4),(13,1,13,1),(14,1,14,4),(15,1,15,3),(16,1,16,4),(17,1,17,5),(18,1,18,1),(19,1,19,3),(20,1,20,3),(21,1,21,5),(22,1,22,4),(23,1,23,5),(24,1,24,3),(25,1,25,4),(26,1,26,1),(27,1,27,5),(28,1,28,2),(29,1,29,3),(30,1,30,4),(31,1,31,2),(32,1,32,1),(33,1,33,1),(34,1,34,4),(35,1,35,3),(36,1,36,5),(37,1,37,4),(38,1,38,4),(39,1,39,5),(40,1,40,1),(41,1,41,3),(42,1,42,5),(43,1,43,4),(44,1,44,4),(45,1,45,4),(46,1,46,5),(47,1,47,3),(48,1,48,3),(49,1,49,1),(50,1,50,3),(51,1,51,4),(52,1,52,3),(53,1,53,1),(54,1,54,1),(55,1,55,1),(56,1,56,3),(57,1,57,2),(58,1,58,2),(59,1,59,3),(60,1,60,1),(61,1,61,2),(62,1,62,5),(63,1,63,1),(64,1,64,1),(65,1,65,4),(66,1,66,5),(67,1,67,4),(68,1,68,4),(69,1,69,4),(70,1,70,2),(71,1,71,3),(72,1,72,4),(73,1,73,5),(74,1,74,5),(75,1,75,2),(76,1,76,3),(77,1,77,2),(78,1,78,5),(79,1,79,4),(80,1,80,5),(81,1,81,2),(82,1,82,4),(83,1,83,5),(84,1,84,5),(85,1,85,1),(86,1,86,3),(87,1,87,1),(88,1,88,5),(89,1,89,1),(90,1,90,5),(91,1,91,1),(92,1,92,1),(93,1,93,2),(94,1,94,5),(95,1,95,2),(96,1,96,4),(97,1,97,4);
/*!40000 ALTER TABLE `intralaboral_b_respuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int DEFAULT NULL,
  `tabla_afectada` varchar(255) NOT NULL,
  `accion` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `sentencia_sql` text NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  UNIQUE KEY `nombre_2` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(3,'Digitador'),(2,'Profesional');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `id` int NOT NULL,
  `genero` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Femenino'),(2,'Masculino');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_cargo`
--

DROP TABLE IF EXISTS `tipo_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_cargo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cargo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_cargo`
--

LOCK TABLES `tipo_cargo` WRITE;
/*!40000 ALTER TABLE `tipo_cargo` DISABLE KEYS */;
INSERT INTO `tipo_cargo` VALUES (1,'Jefatura - tiene personal a cargo'),(2,'Profesional, analista, técnico, tecnólogo'),(3,'Auxiliar, asistente administrativo, asistente técnico'),(4,'Operario, operador, ayudante, servicios generales');
/*!40000 ALTER TABLE `tipo_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_contrato` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contrato` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contrato`
--

LOCK TABLES `tipo_contrato` WRITE;
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
INSERT INTO `tipo_contrato` VALUES (1,'Temporal de menos de 1 año'),(2,'Temporal de 1 año o más'),(3,'Término indefinido'),(4,'Cooperado (cooperativa)'),(5,'Prestación de servicios'),(6,'No sé');
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_salario`
--

DROP TABLE IF EXISTS `tipo_salario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_salario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salario` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_salario`
--

LOCK TABLES `tipo_salario` WRITE;
/*!40000 ALTER TABLE `tipo_salario` DISABLE KEYS */;
INSERT INTO `tipo_salario` VALUES (1,'Fijo (diario, semanal, quincenal o mensual)'),(2,'Una parte fija y otra variable'),(3,'Todo variable (a destajo, por producción, por comisión)');
/*!40000 ALTER TABLE `tipo_salario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vivienda`
--

DROP TABLE IF EXISTS `tipo_vivienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_vivienda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vivienda`
--

LOCK TABLES `tipo_vivienda` WRITE;
/*!40000 ALTER TABLE `tipo_vivienda` DISABLE KEYS */;
INSERT INTO `tipo_vivienda` VALUES (1,'Propia'),(2,'Arriendo'),(3,'Familiar');
/*!40000 ALTER TABLE `tipo_vivienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ultimo_nivel_estudios`
--

DROP TABLE IF EXISTS `ultimo_nivel_estudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ultimo_nivel_estudios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estudio` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ultimo_nivel_estudios`
--

LOCK TABLES `ultimo_nivel_estudios` WRITE;
/*!40000 ALTER TABLE `ultimo_nivel_estudios` DISABLE KEYS */;
INSERT INTO `ultimo_nivel_estudios` VALUES (1,'Ninguno'),(2,'Primaria Incompleta'),(3,'Primaria Completa'),(4,'Bachillerato Incompleto'),(5,'Bachillerato Completo'),(6,'Técnico/Tecnólogo Incompleto'),(7,'Técnico/Tecnólogo Completo'),(8,'Profesional Incompleto'),(9,'Profesional Completo'),(10,'Carrera Militar/Policía'),(11,'Post-Grado Incompleto'),(12,'Post-Grado Completo');
/*!40000 ALTER TABLE `ultimo_nivel_estudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol_id` int DEFAULT NULL,
  `empresa_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `rol_id` (`rol_id`),
  KEY `empresa_id` (`empresa_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'AdminGeneral','admin@sistema.com','$2b$10$OQAGa4Iwowa3THApNQKQ..Mjd5nkJjrks3MUa2m3XkMrNu7uT0PxC',1,1),(2,'Jeimy Rodriguez','jeirodlan@mail.com','$2b$10$wAzaTdTu3sXM75riyLCMW.KjQiBTuv1nZbIuOUiWJRypraPxcs7sO',2,2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_usuarios_insert` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
    DECLARE usuario_id INT;
    -- Obtener el ID del usuario autenticado desde la variable de sesión
    SET usuario_id = @usuario_actual;
    -- Insertar el registro en la tabla logs con el usuario que realizó la acción
    INSERT INTO logs (usuario_id, tabla_afectada, accion, sentencia_sql)
    VALUES (usuario_id, 'usuarios', 'INSERT',
            CONCAT('INSERT INTO usuarios (id, nombre, email, contrasena, rol_id, empresa_id) VALUES (',
                   NEW.id, ', ''', NEW.nombre, ''', ''', NEW.email, ''', ''', NEW.contrasena, ''', ', NEW.rol_id, ', ', NEW.empresa_id, ');'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_usuarios_update` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
    DECLARE usuario_id INT;
    
    -- Obtener el ID del usuario autenticado desde la variable de sesión
    SET usuario_id = @usuario_actual;

    -- Insertar registro en la tabla logs
    INSERT INTO logs (usuario_id, tabla_afectada, accion, sentencia_sql)
    VALUES (usuario_id, 'usuarios', 'UPDATE', 
            CONCAT('UPDATE usuarios SET nombre = ''', NEW.nombre, ''', email = ''', NEW.email, ''', contrasena = ''', NEW.contrasena, ''', rol_id = ', NEW.rol_id, ', empresa_id = ', NEW.empresa_id, ' WHERE id = ', OLD.id, ';'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_auditoria_usuarios_delete` AFTER DELETE ON `usuarios` FOR EACH ROW BEGIN
    DECLARE usuario_id INT;
    
    -- Obtener el ID del usuario autenticado desde la variable de sesión
    SET usuario_id = @usuario_actual;

    -- Insertar registro en la tabla logs
    INSERT INTO logs (usuario_id, tabla_afectada, accion, sentencia_sql)
    VALUES (usuario_id, 'usuarios', 'DELETE', 
            CONCAT('DELETE FROM usuarios WHERE id = ', OLD.id, ';'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_estres_estadistica`
--

DROP TABLE IF EXISTS `vista_estres_estadistica`;
/*!50001 DROP VIEW IF EXISTS `vista_estres_estadistica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estres_estadistica` AS SELECT 
 1 AS `id_pregunta`,
 1 AS `pregunta`,
 1 AS `id_opcion`,
 1 AS `opcion_respuesta`,
 1 AS `frecuencia`,
 1 AS `porcentaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estres_resumen`
--

DROP TABLE IF EXISTS `vista_estres_resumen`;
/*!50001 DROP VIEW IF EXISTS `vista_estres_resumen`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estres_resumen` AS SELECT 
 1 AS `encuesta_id`,
 1 AS `fecha_aplicacion`,
 1 AS `id_empleado`,
 1 AS `pregunta`,
 1 AS `respuesta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_extralaboral_estadistica`
--

DROP TABLE IF EXISTS `vista_extralaboral_estadistica`;
/*!50001 DROP VIEW IF EXISTS `vista_extralaboral_estadistica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_extralaboral_estadistica` AS SELECT 
 1 AS `id_pregunta`,
 1 AS `pregunta`,
 1 AS `id_opcion`,
 1 AS `opcion_respuesta`,
 1 AS `frecuencia`,
 1 AS `porcentaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_extralaboral_resumen`
--

DROP TABLE IF EXISTS `vista_extralaboral_resumen`;
/*!50001 DROP VIEW IF EXISTS `vista_extralaboral_resumen`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_extralaboral_resumen` AS SELECT 
 1 AS `encuesta_id`,
 1 AS `fecha_aplicacion`,
 1 AS `id_empleado`,
 1 AS `pregunta`,
 1 AS `respuesta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_intralaboral_a_estadistica`
--

DROP TABLE IF EXISTS `vista_intralaboral_a_estadistica`;
/*!50001 DROP VIEW IF EXISTS `vista_intralaboral_a_estadistica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_intralaboral_a_estadistica` AS SELECT 
 1 AS `id_pregunta`,
 1 AS `pregunta`,
 1 AS `id_opcion`,
 1 AS `opcion_respuesta`,
 1 AS `frecuencia`,
 1 AS `porcentaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_intralaboral_a_resumen`
--

DROP TABLE IF EXISTS `vista_intralaboral_a_resumen`;
/*!50001 DROP VIEW IF EXISTS `vista_intralaboral_a_resumen`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_intralaboral_a_resumen` AS SELECT 
 1 AS `encuesta_id`,
 1 AS `fecha_aplicacion`,
 1 AS `id_empleado`,
 1 AS `pregunta`,
 1 AS `respuesta`,
 1 AS `valor_respuesta`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_intralaboral_b_estadistica`
--

DROP TABLE IF EXISTS `vista_intralaboral_b_estadistica`;
/*!50001 DROP VIEW IF EXISTS `vista_intralaboral_b_estadistica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_intralaboral_b_estadistica` AS SELECT 
 1 AS `id_pregunta`,
 1 AS `pregunta`,
 1 AS `id_opcion`,
 1 AS `opcion_respuesta`,
 1 AS `frecuencia`,
 1 AS `porcentaje`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_intralaboral_b_resumen`
--

DROP TABLE IF EXISTS `vista_intralaboral_b_resumen`;
/*!50001 DROP VIEW IF EXISTS `vista_intralaboral_b_resumen`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_intralaboral_b_resumen` AS SELECT 
 1 AS `encuesta_id`,
 1 AS `fecha_aplicacion`,
 1 AS `id_empleado`,
 1 AS `pregunta`,
 1 AS `respuesta`,
 1 AS `valor_respuesta`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'bateria_psicosocial'
--

--
-- Current Database: `bateria_psicosocial`
--

USE `bateria_psicosocial`;

--
-- Final view structure for view `vista_estres_estadistica`
--

/*!50001 DROP VIEW IF EXISTS `vista_estres_estadistica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estres_estadistica` AS select `ep`.`id` AS `id_pregunta`,`ep`.`descripcion` AS `pregunta`,`eor`.`id` AS `id_opcion`,`eor`.`etiqueta` AS `opcion_respuesta`,count(`er`.`id_opcion_respuesta`) AS `frecuencia`,round(((count(`er`.`id_opcion_respuesta`) * 100.0) / (select count(0) from `estres_respuestas` where (`estres_respuestas`.`id_pregunta` = `ep`.`id`))),2) AS `porcentaje` from ((`estres_preguntas` `ep` join `estres_opciones_respuesta` `eor`) left join `estres_respuestas` `er` on(((`ep`.`id` = `er`.`id_pregunta`) and (`eor`.`id` = `er`.`id_opcion_respuesta`)))) group by `ep`.`id`,`ep`.`descripcion`,`eor`.`id`,`eor`.`etiqueta` order by `ep`.`id`,`eor`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estres_resumen`
--

/*!50001 DROP VIEW IF EXISTS `vista_estres_resumen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estres_resumen` AS select `fdg`.`id` AS `encuesta_id`,`fdg`.`fecha_aplicacion` AS `fecha_aplicacion`,`fdg`.`identificacion_respondiente` AS `id_empleado`,`ep`.`descripcion` AS `pregunta`,`eor`.`etiqueta` AS `respuesta` from (((`estres_respuestas` `er` join `form_datos_generales` `fdg` on((`er`.`id_formulario` = `fdg`.`id`))) join `estres_preguntas` `ep` on((`er`.`id_pregunta` = `ep`.`id`))) join `estres_opciones_respuesta` `eor` on((`er`.`id_opcion_respuesta` = `eor`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_extralaboral_estadistica`
--

/*!50001 DROP VIEW IF EXISTS `vista_extralaboral_estadistica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_extralaboral_estadistica` AS select `elp`.`id` AS `id_pregunta`,`elp`.`descripcion` AS `pregunta`,`elor`.`id` AS `id_opcion`,`elor`.`etiqueta` AS `opcion_respuesta`,count(`elr`.`id_opcion_respuesta`) AS `frecuencia`,round(((count(`elr`.`id_opcion_respuesta`) * 100.0) / (select count(0) from `estres_respuestas` where (`estres_respuestas`.`id_pregunta` = `elp`.`id`))),2) AS `porcentaje` from ((`extralaboral_preguntas` `elp` join `extralaboral_opciones_respuesta` `elor`) left join `extralaboral_respuestas` `elr` on(((`elp`.`id` = `elr`.`id_pregunta`) and (`elor`.`id` = `elr`.`id_opcion_respuesta`)))) group by `elp`.`id`,`elp`.`descripcion`,`elor`.`id`,`elor`.`etiqueta` order by `elp`.`id`,`elor`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_extralaboral_resumen`
--

/*!50001 DROP VIEW IF EXISTS `vista_extralaboral_resumen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_extralaboral_resumen` AS select `fdg`.`id` AS `encuesta_id`,`fdg`.`fecha_aplicacion` AS `fecha_aplicacion`,`fdg`.`identificacion_respondiente` AS `id_empleado`,`elp`.`descripcion` AS `pregunta`,`eor`.`etiqueta` AS `respuesta` from (((`extralaboral_respuestas` `elr` join `form_datos_generales` `fdg` on((`elr`.`id_formulario` = `fdg`.`id`))) join `extralaboral_preguntas` `elp` on((`elr`.`id_pregunta` = `elp`.`id`))) join `extralaboral_opciones_respuesta` `eor` on((`elr`.`id_opcion_respuesta` = `eor`.`id`))) where (`fdg`.`id` = 1) order by `elp`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_intralaboral_a_estadistica`
--

/*!50001 DROP VIEW IF EXISTS `vista_intralaboral_a_estadistica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_intralaboral_a_estadistica` AS select `ilap`.`id` AS `id_pregunta`,`ilap`.`descripcion` AS `pregunta`,`ilaor`.`id` AS `id_opcion`,`ilaor`.`etiqueta` AS `opcion_respuesta`,count(`ilar`.`id_opcion_respuesta`) AS `frecuencia`,round(((count(`ilar`.`id_opcion_respuesta`) * 100.0) / (select count(0) from `intralaboral_a_respuestas` where (`intralaboral_a_respuestas`.`id_pregunta` = `ilap`.`id`))),2) AS `porcentaje` from ((`intralaboral_a_preguntas` `ilap` join `intralaboral_a_opciones_respuesta` `ilaor`) left join `intralaboral_a_respuestas` `ilar` on(((`ilap`.`id` = `ilar`.`id_pregunta`) and (`ilaor`.`id` = `ilar`.`id_opcion_respuesta`)))) group by `ilap`.`id`,`ilap`.`descripcion`,`ilaor`.`id`,`ilaor`.`etiqueta` order by `ilap`.`id`,`ilaor`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_intralaboral_a_resumen`
--

/*!50001 DROP VIEW IF EXISTS `vista_intralaboral_a_resumen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_intralaboral_a_resumen` AS select `fdg`.`id` AS `encuesta_id`,`fdg`.`fecha_aplicacion` AS `fecha_aplicacion`,`fdg`.`identificacion_respondiente` AS `id_empleado`,`ip`.`descripcion` AS `pregunta`,`ior`.`etiqueta` AS `respuesta`,`ior`.`valor` AS `valor_respuesta` from (((`intralaboral_a_respuestas` `ir` join `form_datos_generales` `fdg` on((`ir`.`id_formulario` = `fdg`.`id`))) join `intralaboral_a_preguntas` `ip` on((`ir`.`id_pregunta` = `ip`.`id`))) join `intralaboral_a_opciones_respuesta` `ior` on((`ir`.`id_opcion_respuesta` = `ior`.`id`))) order by `fdg`.`id`,`ip`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_intralaboral_b_estadistica`
--

/*!50001 DROP VIEW IF EXISTS `vista_intralaboral_b_estadistica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_intralaboral_b_estadistica` AS select `ilbp`.`id` AS `id_pregunta`,`ilbp`.`descripcion` AS `pregunta`,`ilbor`.`id` AS `id_opcion`,`ilbor`.`etiqueta` AS `opcion_respuesta`,count(`ilbr`.`id_opcion_respuesta`) AS `frecuencia`,round(((count(`ilbr`.`id_opcion_respuesta`) * 100.0) / (select count(0) from `intralaboral_b_respuestas` where (`intralaboral_b_respuestas`.`id_pregunta` = `ilbp`.`id`))),2) AS `porcentaje` from ((`intralaboral_b_preguntas` `ilbp` join `intralaboral_b_opciones_respuesta` `ilbor`) left join `intralaboral_b_respuestas` `ilbr` on(((`ilbp`.`id` = `ilbr`.`id_pregunta`) and (`ilbor`.`id` = `ilbr`.`id_opcion_respuesta`)))) group by `ilbp`.`id`,`ilbp`.`descripcion`,`ilbor`.`id`,`ilbor`.`etiqueta` order by `ilbp`.`id`,`ilbor`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_intralaboral_b_resumen`
--

/*!50001 DROP VIEW IF EXISTS `vista_intralaboral_b_resumen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_intralaboral_b_resumen` AS select `fdg`.`id` AS `encuesta_id`,`fdg`.`fecha_aplicacion` AS `fecha_aplicacion`,`fdg`.`identificacion_respondiente` AS `id_empleado`,`ip`.`descripcion` AS `pregunta`,`ior`.`etiqueta` AS `respuesta`,`ior`.`valor` AS `valor_respuesta` from (((`intralaboral_b_respuestas` `ir` join `form_datos_generales` `fdg` on((`ir`.`id_formulario` = `fdg`.`id`))) join `intralaboral_b_preguntas` `ip` on((`ir`.`id_pregunta` = `ip`.`id`))) join `intralaboral_b_opciones_respuesta` `ior` on((`ir`.`id_opcion_respuesta` = `ior`.`id`))) order by `fdg`.`id`,`ip`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-17 23:18:56
