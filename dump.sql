-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: naukri_sphere_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_title` varchar(200) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `resume_path` varchar(500) DEFAULT NULL,
  `applied_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,'Frontend Developer','null','Rajesh Kumar','rajeshkumarn2006@gmail.com','1234567891','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\Resume.pdf','2025-12-01 05:12:26'),(2,'Software Engineer','TechSphere Pvt Ltd','MANISH CHAUHAN','manishchauhanmca@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\Resume.pdf','2025-12-01 05:29:33'),(3,'Software Engineer','TechSphere Pvt Ltd','HUKAMSINGH','hukamsinghnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\SURENDRA_RESUME (1).pdf','2025-12-01 05:32:20'),(4,'Data Analyst','Insight Analytics','Yogendra Kumar','yogendrakumarnbh@gmail.com','7668611195','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\Surendra_Resume_edited.pdf','2025-12-01 17:25:25'),(5,'Java Developer','NBH_SOFTECH PVT.LTD','Rajesh Kumar','rajeshkumarn2006@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\Resume.pdf','2025-12-01 17:37:15'),(6,'Java Developer','NBH_SOFTECH PVT.LTD','Rajesh Kumar','rajeshkumarn2006@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\HUKAMSINGH_CV.pdf','2025-12-01 17:39:06'),(7,'MERN Stack','NBH_SOFTECH PVT.LTD','Ranjan Kumar','ranjankumar@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\HUKAMSINGH_CV.pdf','2025-12-02 05:28:07'),(8,'Frontend Developer','WebCraft Solutions','manish rajput','manishrajput123@gmail.com','8512836490','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\Bhulekh.pdf','2025-12-02 05:32:25'),(9,'MERN Stack','NBH_SOFTECH PVT.LTD','RahulMavi','rahul2025@gmail.com','1234567891','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\HK-RES1 (1).pdf','2025-12-03 06:14:56'),(10,'Java Developer','Empenofore Technologies','Rajesh Kumar','hukamsinghnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-1.pdf','2025-12-05 19:07:26'),(11,'Academic Counsellor : Noida','PW ','DEVESH KUMAR','deveshkumarnbh@gmail.com','1234567891','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-3.pdf','2025-12-05 20:24:46'),(12,'Academic Counsellor : Noida','PW ','DEVESH KUMAR','deveshkumarnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-3.pdf','2025-12-05 20:28:21'),(13,'Java Developer','Best Infosystems Ltd.','HUKAMSINGH','hukamsinghnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-1.pdf','2025-12-05 20:35:51'),(14,'Java Developer','TestGrid.io','Rajesh Kumar','hukamsinghnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-1.pdf','2025-12-05 20:56:17'),(15,'Java Developer','Persistent Systems','HukamSingh','hukamsinghnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\HUKAMSINGH_CV.pdf','2025-12-08 08:48:02'),(16,'Java Developer','Cronberry','Mohit Kumar','mohitkumar@gmail.com','09627381982','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-3.pdf','2025-12-08 11:35:44'),(17,'Software Engineer','TechSphere Pvt Ltd','Surendra Singh','surendra2015mci@gmail.com','09627381982','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-3.pdf','2025-12-09 04:22:19'),(18,'Software Engineer','TechSphere Pvt Ltd','Surendra Singh','surendra2015mci@gmail.com','09627381982','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-3.pdf','2025-12-09 04:22:52'),(19,'Software Engineer','TechSphere Pvt Ltd','Surendra Singh','surendra2015mci@gmail.com','09627381982','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-3.pdf','2025-12-09 04:24:26'),(20,'Java Developer','Empenofore Technologies','Surendra Singh','surendra2015mci@gmail.com','09627381982','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-1.pdf','2025-12-09 04:25:38'),(21,'Academic Counsellor : Noida','PW ','HUKAM SINGH','hukamsinbhnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-4.pdf','2025-12-10 05:50:51'),(22,'Java Developer','Empenofore Technologies','Surendra Singh','surendra2015mci@gmail.com','09627381982','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-4.pdf','2025-12-17 05:49:15'),(23,'Java Developer','Tata Consultancy Services','Hukam Singh','hukamsinghnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-4.pdf','2025-12-17 05:57:38'),(24,'Java Developer','Tata Consultancy Services','HUKAM SINGH','hukamsinbhnbh@gmail.com','7983156395','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\resume-4.pdf','2025-12-20 16:56:12'),(25,'Java Developer','Persistent Systems','Surendra Singh','surendra2015mci@gmail.com','09627381982','C:\\Users\\hukam\\eclipse-workspace\\naukari-sphere-portal-app\\src\\main\\webapp\\uploads\\Surendra_Resume_25 (1).pdf','2026-01-03 08:27:49');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `address` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'TechNova Solutions','contact@technova.com','+1-555-123-4567','https://www.technova.com','123 Innovation Drive, San Francisco, CA'),(2,'GlobalTrade Corp','info@globaltrade.com','+1-555-987-6543','https://www.globaltrade.com','89 Market Street, New York, NY'),(3,'Google ','surendra2015mci@gmail.com','1234567891','https://www.google.com/','Sector 63 Noida'),(4,'NBH_SOFTECH PVT>LTD','nbhsoftechpvtltd@gmail.com','91+798316295','https://www.google.com/','Greater Noida'),(5,'Naukri.com','naukri.com.in','+917983156395','https://www.naukri.com/mnjuser/homepage','Sector 63 Noida'),(6,'Naurki','naukrisphere@gmail.com','64971249864','https://www.naukri.com/mnjuser/homepage','Sector 63 Noida'),(7,'NIET','0241mca110@niet.co.in','64971249864','nietcollege.co.in','Greater Noida'),(8,'NBHSOFTECH PVT.LTD','nbhsoftech@gmail.com','09627381982','nbhsoftech.com','VILL NAGLA BHEEM POST MOHANI MAMOORGANJ DISTRICT KASGANJ');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message` text,
  `date_submitted` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'Rajesh Kumar','rajeshkumarn2006@gmail.com','64971249864','This website is awesome and friendly user interface and user to fast your website ','2025-12-01 18:55:15');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_alerts`
--

DROP TABLE IF EXISTS `job_alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_alerts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `subscribed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_alerts`
--

LOCK TABLES `job_alerts` WRITE;
/*!40000 ALTER TABLE `job_alerts` DISABLE KEYS */;
INSERT INTO `job_alerts` VALUES (27,'hukamsinghnbh@gmail.com','2025-12-29 03:29:46'),(28,'surendra2015mci@gmail.com','2026-01-17 07:47:07');
/*!40000 ALTER TABLE `job_alerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Software Engineer','TechSphere Pvt Ltd','Bangalore','12 LPA','Full-Time'),(2,'Frontend Developer','WebCraft Solutions','Hyderabad','8 LPA','Full-Time'),(4,'UI/UX Designer','Creative Minds Studio','Mumbai','6 LPA','Part-Time'),(5,'Data Analyst','Insight Analytics','Delhi','9 LPA','Full-Time'),(6,'Digital Marketing Executive','BrandBoost Media','Noida','5 LPA','Internship'),(8,'HR Executive','PeopleFirst HR','Gurgaon','4.5 LPA','Full-Time'),(9,'Cloud Engineer','SkyNet Cloud Ltd','Bangalore','14 LPA','Full-Time'),(10,'IT Support Specialist','TechAssist Services','Kolkata','4 LPA','Contract'),(11,'Java Developer','NBH_SOFTECH PVT.LTD','Greater Noida','15000','Full-Time'),(12,'MERN Stack','NBH_SOFTECH PVT.LTD','Greater Noida','20000','Full-Time'),(13,'Java FullStack Developer','Infosys PVT.LTD','Noida ','20000','Internship'),(14,'Java FullStack ','NBH_SOFTECH_PVT.LTD','NOIDA','25000','Internship'),(15,'Java Intern','Infosys PVT.LTD','Noida ','12000','Internship'),(16,'C++ Developer','NBH_SOFTECH PVT.LTD','Kasganj','20000','Full-Time');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,'HUKAMSINGH','hukamsinghnbh@gmail.com','hukam2004','7983156395'),(2,'MANISH CHAUHAN','manishchauhanniet@gmail.com','manish2004','8457561554'),(3,'DEVESH KUMAR','deveshkumarnbh@gmail.com','devesh2009','9675886411'),(4,'Rajesh Kumar','rajeshkumarnbh@gmail.com','rajesh2004','7965232556'),(7,'Rajesh Kumar','rajeshkumarn2006@gmail.com','rajesh879188','87912222522'),(8,'Jeetendra ','jeetendramca@gmail.com','12345678','8457561554'),(9,'MANISH CHAUHAN','manishchauhanmca@gmail.com','12345678','7985489754'),(10,'Mohit Rajput','mohitrajput@gmail.com','12345678','8795488798'),(11,'Surendra Singh','surendra2015mci@gmail.com','123456789','09627381982'),(12,'Pragya','p@gmail.com','12345','456788656'),(14,'HukamSingh','hukamsingh@gmail.com','12345678','7983156395'),(15,'Lokesh Kumar','lokeshkumar@gmail.com','12345678','7983156395'),(16,'Surendra Singh','surendra.singh2232@outlook.com','12345678','09627381982');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumes`
--

DROP TABLE IF EXISTS `resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `objective` text,
  `skills` text,
  `projects` text,
  `experience` text,
  `education` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumes`
--

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
INSERT INTO `resumes` VALUES (1,'Hukam Singh ','hukamsinghnbh@gmail.com','7983156395','Greater Noida','Seeking a challenging position where I can apply my skills and contribute to organizational growth. Committed to continuous learning and delivering high-quality results.','C Programming, C++, Java, Java Servlet, JSP, HTML, CSS, JDBC, MYSQL, SQL','The Job Portal is a web-based platform designed to connect job seekers with employers in a streamlined and efficient manner. The system allows candidates to create profiles, upload resumes, search and apply for jobs, and track application status','Im Java Developer And Ex-6 Month','BCA, MCA '),(2,'Jeetendra Ahirwar','jeetendramca@gmail.com','8103103510','Noida','I want to be i dont know','Nothing','CHut Chatayi','20 year','BCA , MCA'),(3,'Hukam Singh ','hukamsinghnbh@gmail.com','7983156395','Greater Noida','Thik hai, ab main end-to-end complete setup de raha hoon – JSP + Servlet + MySQL + OpenPDF, non-Maven project ke liye.','java,servlet,mysql,sql,jdbc','Naukrisphere','Thik hai, ab main end-to-end complete setup de raha hoon – JSP + Servlet + MySQL + OpenPDF, non-Maven project ke liye.','BCA , MCA'),(4,'HUKAM SINGH','hukamsinghnbh@gmail.com','7983156395','NOIDA','Motivated and detail-oriented Java Developer seeking an entry-level position to utilize academic knowledge in Java, OOPs, and web technologies while continuously enhancing my professional skills.','C Language, C++, Core Java, Multithreading, Exception Handling, Collection Framework, Java Servlet, JDBC, MYSQL, SQL, HTML, CSS','Job Portal System is a web-based application designed to connect job seekers and employers. Job seekers can register, create profiles, search and apply for jobs, while employers can post job openings and manage applications.\r\nThe system includes secure login, role-based access, and database-backed job listings.','Work Description:\r\n\r\nHands-on experience in Core Java, OOP concepts, Collections, Multithreading\r\n\r\nBuilt web applications using Servlet, JSP and MVC architecture\r\n\r\nWorked with databases like MySQL using JDBC / Hibernate ORM\r\n\r\nCreated REST-based services and implemented CRUD operations\r\n\r\nUsed tools: Eclipse/IntelliJ, Tomcat Server, Git & GitHub version control\r\n\r\nDeveloped UI screens with HTML, CSS, Bootstrap, and JavaScript\r\n\r\nKnowledge of Spring Boot, dependency injection, Spring MVC\r\n\r\nExperience Highlights:\r\n\r\nDesigned and optimized database tables for faster query performance\r\n\r\nImplemented login, session management & form validations\r\n\r\nParticipated in testing, debugging and improving code quality\r\n\r\nWorked in a team environment using Agile development approach\r\n\r\n⭐ Java Developer Work & Experience Description (1–2 Years)\r\n\r\nWork Description:\r\n\r\nDeveloped scalable backend applications using Java, Spring Boot & Microservices\r\n\r\nImplemented secure REST APIs with JSON & Spring Security\r\n\r\nApplied JDBC, Hibernate/JPA for data persistence and query optimization\r\n\r\nDeployed applications on cloud environments like AWS / Azure\r\n\r\nUsed Maven/Gradle for build management and JUnit for testing\r\n\r\nExperience Highlights:\r\n\r\nImproved application performance by optimizing SQL queries\r\n\r\nIntegrated third-party APIs and implemented error handling & logging\r\n\r\nUsed Agile/Scrum methodologies and collaborated using Jira\r\n\r\nWorked with Git branching workflows for version management','10th, 12th, BCA, MCA');
/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'HUKAMSINGH','hukamsinghnbh@gmail.com','12345678','7983156395','MCA','Kasganj','resume-4.pdf','2025-12-28 20:59:37'),(2,'Devesh Kumar','deveshkumarnbh@gmail.com','12345678','7983156395','B.Tech','Greater Noida','Surendra_Resume.docx','2026-01-15 16:49:55'),(3,'Surendra Kumar','surendra2015mci@gmail.com','12345678','7983156395','MCA','Kasganj','Surendra_Resume_25 (1).pdf','2026-01-17 07:46:43'),(4,'Lokesh Kumar','lokeshkumar@gmail.com','123456789','7983156395','B.Tech','Greater Noida','Resume_HukamSingh.pdf','2026-01-17 14:18:38');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-17 19:54:50
