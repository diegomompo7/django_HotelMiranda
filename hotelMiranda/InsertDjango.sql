-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: HotelMiranda
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

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
-- Table structure for table `amenities`
--

--
-- Table structure for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `polls_user` VALUES 
(1,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/774.jpg','Jennifer Zayas Alva','Room Service','jennifer_zayas@yahoo.com','997265920','2023-01-05','Room Service','INACTIVE','Password1!'),
(2,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1020.jpg','Matilde Espino Barrientos','Manager','matilde.espino78@gmail.com','904621125','2023-11-09','Manager','INACTIVE','Password2!'),
(3,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/596.jpg','Roser Vallejo Perea','Room Service','roser.vallejo57@hotmail.com','939087794','2023-10-30','Room Service','INACTIVE','Password3!'),
(4,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/900.jpg','Pablo Llamas Montenegro','Manager','pablo_llamas56@yahoo.com','949454169','2023-06-30','Manager','ACTIVE','Password4!'),
(5,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/269.jpg','Maica Leiva Sarabia','Manager','maica47@hotmail.com','942817737','2023-12-20','Manager','ACTIVE','Password5!'),
(6,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/354.jpg','Jennifer Alejandro Madrid','Room Service','jennifer.alejandro@hotmail.com','920154527','2023-01-24','Room Service','INACTIVE','Password6!'),
(7,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/311.jpg','Sra. Ana Jurado Saavedra','Manager','sra.ana82@yahoo.com','921802439','2023-07-05','Manager','ACTIVE','Password7!'),
(8,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/895.jpg','Roser Balderas Aguirre','Receptionist','roser58@yahoo.com','978540971','2023-04-22','Receptionist','INACTIVE','Password8!'),
(9,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/27.jpg','Maica Olivas Galindo','Manager','maica55@gmail.com','935625157','2023-10-05','Manager','INACTIVE','Password9!'),
(10,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/757.jpg','Jennifer Contreras Sanabria','Receptionist','jennifer78@hotmail.com','945708842','2023-04-05','Receptionist','ACTIVE','Password10!'),
(11,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1003.jpg','Maica Vega Galván','Manager','maica93@yahoo.com','973868478','2023-07-19','Manager','INACTIVE','Password11!'),
(12,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/832.jpg','Salvador Madera Canales','Manager','salvador.madera71@yahoo.com','974577481','2023-09-19','Manager','ACTIVE','Password12!'),
(13,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/352.jpg','Pablo Almanza Valdivia','Room Service','pablo_almanza@hotmail.com','965019878','2023-05-15','Room Service','ACTIVE','Password13!'),
(14,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/432.jpg','Jorge Navarrete Robles','Receptionist','jorge_navarrete@hotmail.com','927955680','2023-12-30','Receptionist','INACTIVE','Password14!'),
(15,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/977.jpg','Lorena Medrano Delatorre','Receptionist','lorena.medrano0@gmail.com','974383743','2023-12-09','Receptionist','ACTIVE','Password15!');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;


--
-- Table structure for table `contacts`
--

/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `polls_contact` VALUES 
(1,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/774.jpg','Ana','González','ana@example.com','987654321','2023-01-05','Consulta sobre reserva','Mensaje de prueba', 4, false),
(2,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1020.jpg','Luis','Martínez','luis@example.com','987654322','2023-02-15','Solicitud de información','Mensaje de prueba', 5, false),
(3,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/596.jpg','María','Sánchez','maria@example.com','987654323','2023-03-20','Queja sobre servicio','Mensaje de prueba', 3, false),
(4,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/900.jpg','Carlos','Gómez','carlos@example.com','987654324','2023-04-10','Consulta sobre eventos','Mensaje de prueba', 5, false),
(5,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/269.jpg','Laura','Fernández','laura@example.com','987654325','2023-05-03','Solicitud de reserva','Mensaje de prueba', 4, false),
(6,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/354.jpg','Pedro','Rodríguez','pedro@example.com','987654326','2023-06-17','Queja sobre instalaciones','Mensaje de prueba', 2, false),
(7,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/311.jpg','Carmen','López','carmen@example.com','987654327','2023-07-22','Solicitud de información turística','Mensaje de prueba', 5, false),
(8,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/895.jpg','Juan','Díaz','juan@example.com','987654328','2023-08-30','Queja sobre restaurante','Mensaje de prueba', 3, false),
(9,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/27.jpg','Elena','Pérez','elena@example.com','987654329','2023-09-14','Consulta sobre servicios adicionales','Mensaje de prueba', 4, false),
(10,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/757.jpg','Manuel','García','manuel@example.com','987654330','2023-10-05','Solicitud de reserva','Mensaje de prueba', 5, false),
(11,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1003.jpg','Isabel','Martínez','isabel@example.com','987654331','2023-11-12','Queja sobre limpieza','Mensaje de prueba', 2, false),
(12,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/832.jpg','David','Sánchez','david@example.com','987654332','2023-12-25','Consulta sobre tarifas','Mensaje de prueba', 4, false),
(13,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/352.jpg','Laura','Gómez','laura2@example.com','987654333','2024-01-10','Solicitud de información','Mensaje de prueba', 5, false),
(14,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/432.jpg','Miguel','Martínez','miguel@example.com','987654334','2024-02-18','Queja sobre ruido','Mensaje de prueba', 3, false),
(15,'https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/977.jpg','Eva','Rodríguez','eva@example.com','987654335','2024-03-20','Solicitud de reserva','Mensaje de prueba', 4, false);

/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

--
-- Table structure for table `rooms`
--

/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `polls_room` (`photos`, `roomType`, `roomNumber`, `description`, `offer`, `priceNight`, `discount`, `cancellation`, `status`)
VALUES
('["photo1.jpg", "photo2.jpg", "photo3.jpg"]', 'Single Bed', '101', 'Habitación individual con cama individual', 'Yes', 85.50, 15, 'Política de cancelación flexible', 'Available'),
('["photo4.jpg", "photo5.jpg"]', 'Double Bed', '201', 'Habitación con cama matrimonial', 'Yes', 120, 20, 'Política de cancelación moderada', 'Available'),
('["photo6.jpg", "photo7.jpg", "photo8.jpg"]', 'Double Superior', '301', 'Habitación doble con vistas panorámicas', 'No', 150.75, 0, 'Política de cancelación estricta', 'Available'),
('["photo9.jpg", "photo10.jpg"]', 'Suite', '401', 'Suite de lujo con jacuzzi privado', 'Yes', 200, 30, 'Política de cancelación flexible', 'Available'),
('["photo11.jpg", "photo12.jpg", "photo13.jpg", "photo14.jpg"]', 'Single Bed', '102', 'Habitación individual con vistas al mar', 'Yes', 95, 10, 'Política de cancelación moderada', 'Available'),
('["photo15.jpg", "photo16.jpg", "photo17.jpg"]', 'Double Bed', '202', 'Habitación con cama matrimonial y balcón', 'No', 130.25, 0, 'Política de cancelación flexible', 'Available'),
('["photo18.jpg", "photo19.jpg"]', 'Double Superior', '302', 'Habitación doble con terraza privada', 'Yes', 175, 25, 'Política de cancelación moderada', 'Available'),
('["photo20.jpg", "photo21.jpg", "photo22.jpg"]', 'Suite', '402', 'Suite de lujo con vistas a la montaña', 'Yes', 180.50, 20, 'Política de cancelación flexible', 'Available'),
('["photo23.jpg", "photo24.jpg"]', 'Single Bed', '103', 'Habitación individual con escritorio de trabajo', 'No', 70.75, 0, 'Política de cancelación estricta', 'Available'),
('["photo25.jpg", "photo26.jpg", "photo27.jpg"]', 'Double Bed', '203', 'Habitación con cama matrimonial y vista al jardín', 'Yes', 110, 15, 'Política de cancelación flexible', 'Available'),
('["photo28.jpg", "photo29.jpg"]', 'Double Superior', '303', 'Habitación doble con zona de estar', 'Yes', 160.25, 10, 'Política de cancelación moderada', 'Available'),
('["photo30.jpg", "photo31.jpg", "photo32.jpg"]', 'Suite', '403', 'Suite de lujo con terraza privada y piscina', 'No', 195, 0, 'Política de cancelación flexible', 'Available'),
('["photo33.jpg", "photo34.jpg"]', 'Single Bed', '104', 'Habitación individual con vista a la ciudad', 'Yes', 80, 5, 'Política de cancelación moderada', 'Available'),
('["photo35.jpg", "photo36.jpg", "photo37.jpg"]', 'Double Bed', '204', 'Habitación con cama matrimonial y bañera de hidromasaje', 'No', 140.75, 0, 'Política de cancelación flexible', 'Available'),
('["photo38.jpg", "photo39.jpg"]', 'Double Superior', '304', 'Habitación doble con acceso directo a la piscina', 'Yes', 185, 20, 'Política de cancelación moderada', 'Available');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;


/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*INSERT INTO `polls_booking` VALUES (1,'Manuel Oquendo Gutiérrez','2024-01-11','2024-06-30','16:07:24','2024-07-24','04:27:15',16,'Sit spiculum odio tamdiu tollo. Allatus tamen coniecto theatrum cicuta cometes.','Check In'),(2,'Sra. María de los Ángeles Saucedo Viera','2023-12-03','2024-11-03','05:42:05','2024-11-04','09:30:16',15,'Utpote ascit dolor apostolus caveo architecto somniculosus corrumpo. Nulla maiores abstergo angustus spectaculum.','Check In'),(3,'Lorena Salinas Téllez','2023-08-17','2024-03-17','06:09:45','2024-03-24','03:45:21',7,'Patrocinor verbum quam valens cui reiciendis considero. Iure cena solio vinco depono cohaero cado necessitatibus adsum.','Check In'),(4,'Lorena Magaña Reséndez','2024-05-08','2024-08-09','14:43:47','2024-08-15','00:04:36',5,'Dolores denuo volubilis cauda barba vomer culpa tutis casus. Clam pel certus.','Check In'),(5,'Pedro Olivas Ríos','2024-06-25','2024-10-15','16:48:43','2024-11-11','18:48:56',19,'Absorbeo dignissimos paens crur crastinus a. Administratio volaticus doloremque demergo cuppedia bonus laudantium administratio.','Check In'),(6,'Sr. Iván Paredes Montero','2024-01-14','2024-08-07','17:09:23','2024-09-04','17:02:57',11,'Addo vinco omnis derideo odio bardus vesco eligendi tui. Chirographum substantia xiphias nulla infit alioqui suspendo tempora.','Check In'),(7,'Marta Delatorre Matos','2024-05-23','2024-08-01','03:09:05','2024-08-16','08:26:21',10,'Ater deficio eius utique via. Aqua angustus voro.','Check In'),(8,'Laura Bravo Castro','2023-12-27','2024-11-21','15:12:18','2024-12-19','14:52:17',13,'Vespillo vester causa quia. Caste benigne adeptio cras derideo nam claudeo delinquo.','Check In'),(9,'Juan Ramón Solorzano Collazo','2024-03-03','2024-05-24','13:36:34','2024-05-26','14:17:03',9,'Curto verto peior derelinquo statua culpo. Alius sapiente consequatur subiungo adsuesco ventosus villa.','Check In'),(10,'Sta. Matilde Treviño Trujillo','2023-04-30','2024-03-10','16:28:28','2024-03-24','03:30:16',18,'Ullus paulatim atque vinco. Defendo comburo comedo vomer veritatis cursim calamitas paulatim.','Check In'),(11,'Juan Ramón Ochoa Sanabria','2024-02-12','2024-03-12','07:01:26','2024-03-31','03:23:43',8,'Absorbeo molestias terebro fugit tamquam adeo. Averto stultus sublime cohaero adhaero suggero.','Check In'),(12,'Matilde Gallardo Terrazas','2024-12-14','2024-12-19','00:13:15','2024-12-19','12:43:27',17,'Vicissitudo beatae caveo aequitas demergo defessus. Cum commodi crepusculum atqui.','Check In'),(13,'Matilde Cortéz Quiróz','2023-12-18','2024-09-15','02:37:07','2024-09-24','21:05:21',12,'Voluptatum vilicus color. Decor cursus balbus aetas tamquam vae.','Check In'),(14,'Lorena','2023-07-01','2024-02-01','11:30:00','2024-02-12','22:11:21',6,'Arbitro a annus suasoria conqueror conturbo utrum corrigo depopulo debeo. Trucido aegre tristis suscipit sit thorax desidero.','In Progress'),(22,'diego','2024-01-31','2024-02-02','00:00:00','2024-02-07','00:00:00',8,'','Check In');*/
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-01 17:13:50
