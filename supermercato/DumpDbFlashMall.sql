-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: alimentari
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrello`
--

DROP TABLE IF EXISTS `carrello`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrello` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isAquistato` tinyint(1) DEFAULT NULL,
  `idUtente` int DEFAULT NULL,
  `idProdotto` int DEFAULT NULL,
  `quantita` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idProdotto` (`idProdotto`),
  KEY `idUtente` (`idUtente`),
  CONSTRAINT `carrello_ibfk_1` FOREIGN KEY (`idProdotto`) REFERENCES `prodotti` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `carrello_ibfk_2` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrello`
--

LOCK TABLES `carrello` WRITE;
/*!40000 ALTER TABLE `carrello` DISABLE KEYS */;
INSERT INTO `carrello` VALUES (1,1,1,NULL,NULL),(2,0,1,NULL,NULL),(3,1,1,NULL,NULL),(4,1,1,NULL,NULL),(5,1,2,NULL,NULL),(8,1,2,NULL,NULL),(26,0,NULL,NULL,NULL),(27,0,NULL,NULL,NULL),(28,0,NULL,NULL,NULL),(58,1,2,NULL,1),(59,1,2,NULL,1),(61,1,2,NULL,1),(66,1,2,NULL,2),(69,1,2,NULL,1),(71,1,2,NULL,2),(72,1,2,NULL,1),(73,1,2,NULL,1),(74,1,2,NULL,1),(75,1,2,NULL,1),(76,0,2,NULL,2),(77,0,2,NULL,1),(78,0,2,NULL,1),(97,0,2,38,1),(99,0,22,43,2),(105,0,2,34,3),(106,0,2,35,2);
/*!40000 ALTER TABLE `carrello` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomecategoria` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Panetteria'),(2,'Carne e salumi'),(3,'Pesce e Sushi'),(4,'Pasta e riso'),(5,'Frutta e Verdura'),(6,'Formaggi latte e uova'),(7,'Surgelati'),(8,'Bevande'),(9,'Vino'),(10,'Superalcolici');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornitori`
--

DROP TABLE IF EXISTS `fornitori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornitori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomefornitori` varchar(80) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `numero` varchar(100) DEFAULT NULL,
  `pIVA` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornitori`
--

LOCK TABLES `fornitori` WRITE;
/*!40000 ALTER TABLE `fornitori` DISABLE KEYS */;
INSERT INTO `fornitori` VALUES (1,'AGS Import SRL','a.@popi.it','39231294','1231231231235321'),(2,'DalterFood Group','b@popi.it','357237122','373454543'),(3,'New Trade International','c@popi.it','312093102','745563576');
/*!40000 ALTER TABLE `fornitori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prodotti`
--

DROP TABLE IF EXISTS `prodotti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prodotti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `prezzo` double DEFAULT NULL,
  `idcategoria` int DEFAULT NULL,
  `idfornitori` int DEFAULT NULL,
  `URLImmagine` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idcategoria` (`idcategoria`),
  KEY `idfornitori` (`idfornitori`),
  CONSTRAINT `prodotti_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `prodotti_ibfk_2` FOREIGN KEY (`idfornitori`) REFERENCES `fornitori` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prodotti`
--

LOCK TABLES `prodotti` WRITE;
/*!40000 ALTER TABLE `prodotti` DISABLE KEYS */;
INSERT INTO `prodotti` VALUES (31,'Fontina',12.7,6,2,'https://alessandrellishop.it/1050-large_default/formaggi-mucca-italia-valle-d-aosta-semistagionato-fontina-valdostana-dop-bredy-bruno.jpg'),(33,'COCA-COLA 6 x 1.35 L',12,8,3,'https://d2f5fuie6vdmie.cloudfront.net/asset/ita/2022/27/83dc3d5e816a3275e9107ba591161ef6b09b6dc8.jpeg'),(34,'Sassicaia 0.75 L',290,9,3,'https://data.negoziodelvino.it/imgprodotto/doppio-magnum-3-litri-sassicaia-2018-in-cassa-legno_12496_zoom.jpg'),(35,'Sambuca Molinari 70 cl',14.9,10,3,'https://www.comunianvini.it/shop/2041-medium_default/sambuca-molinari-100-cl.jpg'),(38,'Kobe',100,2,1,'https://www.grandchef.net/cm/showfiles.php/magazine/carne-di-manzo-giapponese-wagyu/wagyu-770x514.jpg'),(39,'Arance',2.6,5,2,'https://www.my-personaltrainer.it/2019/11/18/arancia_900x760.jpeg'),(40,'Guanciale',19.8,2,1,'https://www.salumisorrentino.com/wp-content/uploads/2017/02/1215-Guanciale.jpg'),(41,'Spek',8.21,2,1,'https://www.rinner-speck.it/wp-content/uploads/2020/03/Rinner_Speck_1-4-600x600.jpg'),(42,'Salmone',33,3,1,'https://www.pesceacasatua.it/wp-content/uploads/2020/09/img-24.jpg'),(43,'Box sushi medium',30,3,1,'https://www.carrefour.it/on/demandware.static/-/Sites-carrefour-master-catalog-IT/default/dweddfc890/large/Boxdelfuoco-3701292641724-1.jpg'),(44,'Fettuccine',2,4,1,'https://www.deliveryfast.it/wp-content/uploads/2022/03/Fettuccine-alluovo-Emiliane-Barilla-500gr.jpg'),(45,'Riso carnaroli',2,4,1,'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71aAXjYF+2L._AC_SY300_SX300_.jpg'),(46,'Tagliatelle',2.2,4,1,'https://www.dececco.com/wp-content/uploads/2018/05/0SW4203-TAGLIATELLE-3.png'),(47,'Banane',2.6,5,2,'https://i0.wp.com/notiziescientifiche.it/wp-content/uploads/2021/11/banane.jpg?resize=779%2C438&ssl=1'),(49,'Patate',3.2,5,2,'https://www.latrentina.it/wp-content/uploads/2019/11/patate-1.jpg'),(50,'Peperoni',3.2,5,2,'https://www.my-personaltrainer.it/2022/09/26/peperoni-2_900x760.jpeg'),(51,'Pere',2.4,5,2,'https://www.ifruit.it/wp-content/uploads/2021/06/58110-_pere-coscia-768x768-1.jpg'),(52,'Caciocavallo',15.99,6,2,'https://www.caseificiodinucci.it/web/wp-content/uploads/2013/06/CACIOCAVALLO-DI-AGNONE-PAT-SEMISTAGIONATO-_DEG5775-Modifica.jpg'),(53,'Kiwi',3.6,5,2,'https://www.zespri.com/content/dam/zespri/it/product/homepage-product-sungold-min.png'),(54,'Pecorino Romano DOP 200.0 g',5.89,6,2,'https://www.volpetti.com/wp-content/uploads/2018/04/12-pecorino-romano_001.jpg'),(55,'Chinotto 1.5 L',0.75,8,3,'https://www.bereacasa.it/wp-content/uploads/2018/01/Chinotto-Sanpellegrino-in-bottiglia-125lt.jpg'),(56,'Parmiggiano Reggiano DOP 0.50 kg',10.95,6,2,'https://static.spaghettiemandolino.it/cdn-cgi/image/format=auto,fit=contain,width=500,height=500/img_prodotti/big/7471.jpg'),(57,'Patatine fritte',1.5,7,2,'https://ilfattoalimentare.it/wp-content/uploads/2020/05/Pata-snella.jpg'),(58,'Latte Intero',1.25,6,2,'https://cdn.easycoop.com/media/catalog/product/cache/6a235447ffaf2a4eb09bae5f60fe7f21/c/e/centrale_del_latte_di_roma_latte_fresco_alta_qualita_intero_1_20210714_7605312_1.jpg'),(59,'Latte Parzialmente Scremato',1.25,6,2,'https://objectstorage.eu-milan-1.oraclecloud.com/n/axl3hgtiszxy/b/Bucket-CRAI-IMG-PROD/o/images/catalog/eg-0114315/eg-0114315_1_big.jpg'),(60,'Uova Fresche',2.19,6,2,'https://www.my-personaltrainer.it/images/ricette/1281/uova-sode-a-forma-di-cuore.jpg'),(61,'Broccoli',2.9,5,2,'https://www.fondazioneveronesi.it/uploads/thumbs/2022/11/08/broccolo_1_thumb_720_480.jpg'),(62,'Salsiccia',4.5,2,1,'https://www.ilnorcino.eu/wp-content/uploads/2020/12/Salsiccie-fresche-dolci.jpg'),(63,'Philadelpia 250.0 g',3.19,6,2,'https://www.carrefour.it/dw/image/v2/BDWP_PRD/on/demandware.static/-/Sites-carrefour-master-catalog-IT/default/dw65e285d6/large/PHILADELPHIAREGULARGR250-8001590640258-1.png?sw=260&sh=260&sm=fit&sfrm=png'),(64,'Mozzarella di bufala 250.0 g',4.5,6,2,'https://www.pizzeriamanuno.it/wp-content/uploads/2018/06/mozzarella-di-bufala-di-manuno-900x600.jpg'),(65,'Gorgonzola DOP 300 g',5.1,6,2,'https://salumipasini.com/wp-content/uploads/1445PI_Gorgonzola_bianco.jpg'),(66,'Babybel 5 x 20 g',1.99,6,2,'https://www.carrefour.it/dw/image/v2/BDWP_PRD/on/demandware.static/-/Sites-carrefour-master-catalog-IT/default/dwbc6fb56a/large/MINIBABYBELROSSOX5-3073780968508-1.png?sw=260&sh=260&sm=fit&sfrm=png'),(67,'Ricotta 250 g',1.15,6,2,'https://www.latteriamontecatini.shop/wp-content/uploads/2017/05/ricotta_la_nuova_montecatini.jpg'),(68,'Magnum',5.79,7,2,'https://www.bigbasket.com/media/uploads/p/l/40079771_4-kwality-walls-magnum-truffle-ice-cream.jpg'),(70,'Patatine al forno',1.4,7,2,'https://www.surgelatoselezionato.it/wp-content/uploads/2018/09/PACK-PV-PATATE-ROSMARINO-600.png'),(71,'Pesce spada congelato',6.15,7,2,'http://www.lebontadelmaresrl.it/555-tm_thickbox_default/trance-di-pesce-spada-standard.jpg'),(72,'Bastoncini findus 450.0 g',6.99,7,2,'https://cdn.easycoop.com/media/catalog/product/cache/6a235447ffaf2a4eb09bae5f60fe7f21/c/a/capitan_findus_5_bastoncini_di_merluzzo_125_g_4587520_188392_2056318_1.jpg'),(73,'Asiago DOP',3.27,6,2,'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/31har1SwKIL._AC_.jpg'),(74,'Sofficini findus',3.2,7,2,'https://www.carrefour.it/dw/image/v2/BDWP_PRD/on/demandware.static/-/Sites-carrefour-master-catalog-IT/default/dwb954c810/large/SOFFICINISZLATTOSIOFINDUS-8051084008927-1.png?sw=260&sh=260&sm=fit&sfrm=png'),(75,'Nuggets congelati',3.5,7,2,'https://www.carrefour.it/dw/image/v2/BDWP_PRD/on/demandware.static/-/Sites-carrefour-master-catalog-IT/default/dw6b932d5f/large/NAGGHYAIA-8008110121006-1.png?sw=260&sh=260&sm=fit&sfrm=png'),(76,'Tris di verdure congelate',1.99,7,2,'https://www.superparma.it/wp-content/uploads/2020/07/orogel_tris_grigliato.png'),(77,'Carote',2.6,5,2,'https://shop.eccherortofrutta.it/314-large_default/ananas.jpg'),(78,'Pizza Margherita 400.0 g',5.79,7,2,'https://images.dissapore.com/wp-content/uploads/IMG_Cameo.jpg'),(79,'Acqua Levissima 6 x 2 L',5.79,8,2,'https://flashdistribuzione.com/wp-content/uploads/2020/04/Copia-di-Copia-di-Copia-di-Copia-di-Senza-titolo-3-150x150.png'),(80,'Patasnella barchette 600.0 g',3,7,2,'https://www.aliperme.it/photo/2022/06/14/1/main/photo/0284437_A_1_A.jpg'),(81,'Hamburger 200 g',3.3,7,2,'https://r.restore.shopping/resizer/go?s=https%3a%2f%2frsbackend.blob.core.windows.net%2fbrandbank-are%2f8008110004545_1_637528752522948023.png&w=300&h=280'),(82,'Haagen dazs caramello salato 400 g',6.7,7,2,'https://www.lattenews.it/files/2019/06/H%C3%A4agen-Dazs_Speculoos-Caramel-Biscuit-Cream-696x654.jpg'),(83,'Succo di frutta',1.7,8,3,'https://www.bevandeadomicilio.eu/wp-content/uploads/2021/06/santal-dolce-di-natura-1-litro.jpg'),(84,'Centrifugati',1.6,8,3,'http://distribuzionemoderna-lemmon.softecspa.net/distribuzione-moderna/lemmon/media/images/files/216d/e3ec/-95d/8-48/49-9/d0b-/4e3a/5f73/7203/original/centrifugati_group.jpg?1553879995'),(85,'SCHWEPPES Limonata 1.5 L',1.89,8,3,'https://www.gruppolazialebevande.it/wp-content/uploads/2016/04/0717_lemon.png'),(86,'Cedrata 1.5 L',1.4,8,3,'https://www.lefresieconserve.it/2348-square_home_default/cedrata-tassoni-.jpg'),(87,'Bosca Asti 0.75 L',4.99,9,3,'https://www.bosca.it/wp-content/uploads/2021/02/Shooting_Bosca-five-stars-Asti.png'),(88,'Provolone Classico 300.0 g',7.35,6,2,'https://www.volpetti.com/wp-content/uploads/2018/04/17-provolone-del-monaco_001.jpg'),(89,'Red bull 250 ml',1.4,8,3,'https://www.carrefour.it/dw/image/v2/BDWP_PRD/on/demandware.static/-/Sites-carrefour-master-catalog-IT/default/dwdc2673cb/large/REDBULLENERGYDRINK-9002490100070-1.png?sw=260&sh=260&sm=fit&sfrm=png'),(90,'Monster 500.0 ml',1.75,8,3,'https://marvel-b1-cdn.bc0a.com/f00000000104050/www.monsterenergy.com/media/uploads_image/2020/12/01/auto/800/87591f586417b0288eb2386272bf1c24.png?mod=v1_4904dfd6041e59d1b71a31042fe4b060'),(92,'Powerade 0.5 L',1.35,8,3,'https://www.rainieribevande.com/733-large_default/powerade-confez-12-bott-da-05-lt.jpg'),(93,'Estathè alla pesca 1.5 L',3.4,8,3,'https://gustiditalia.com/img/010013.jpg'),(94,'Estathè al limone 1.5 L',3.4,8,3,'https://cdn.shopify.com/s/files/1/0550/9378/8880/products/estathe-al-limone-15lt-571750_600x.jpg?v=1630527657'),(95,'Aglianico del taburno 0.75 L',6.65,9,3,'https://www.svinando.com/var/cache/img/srv/www/htdocs/giordanoweb/images/catalogo/H600_S2636-b.webp'),(96,'Burrata 200.0 g',3.9,6,2,'https://campaniadop.com/519-home_default/burrata-con-latte-di-bufala-.jpg'),(97,'Barbera d\'Asti 0.75 L',6.79,9,3,'https://data.callmewine.com/imgprodotto/barbera-dasti-la-villa-olim-bauda-2021_44700_zoom.jpg'),(98,'Barolo 0.75 L',6.25,9,3,'https://shop.langhe.net/files/2020/03/barolo_f_borgogno-1.png'),(99,'Calamari',32,3,1,'https://www.marchispa.it/img/leoblog/b/1/355/lg-b-img_blog3hf61v.jpg'),(100,'Brachetto 0.75 L',9.32,9,3,'https://buonitaly.it/1439161-thickbox_default/083224-cinzano-brachetto-dacqui-spumante-dolce-cl75.jpg'),(101,'Brunello di Montalcino 0.75 L',26.39,9,3,'https://data.callmewine.com/imgprodotto/brunello-di-montalcino-tenuta-di-collosorbo-2017_40408_zoom.jpg'),(102,'Gamberi',27,3,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2022-04/gambero%20rosso%20del%20mediterraneo.jpg'),(103,'Greco di tufo 0.75 L',11.99,9,3,'https://www.collidicastelfranci.com/wp-content/uploads/2020/04/grotte-1.png'),(104,'Merlot 0.75 L',8.67,9,3,'https://www.giordanovini.it/var/cache/img/srv/www/htdocs/giordanoweb/images/catalogo/H600_02533-b.webp'),(105,'Madregoccia 0.75 L',10,9,3,'https://www.tenutaiuzzolini.kr.it/wp-content/uploads/2021/10/MADREGOCCIA-astuccio.png'),(106,'Primitivo 0.75 L',14.65,9,3,'https://www.giordanovini.it/var/cache/img/srv/www/htdocs/giordanoweb/images/catalogo/H600_6401-b.webp'),(107,'Principe spinelli 0.75 L',12.5,9,3,'https://www.tenutaiuzzolini.kr.it/wp-content/uploads/2021/05/brandy.png'),(108,'Vermentino 0.75 L',10.65,9,3,'https://www.beveragegroup.it/wp-content/uploads/2021/06/San_Poggio_Vermentino-scaled.jpg'),(109,'Chianti classico 0.75 L',17.2,9,3,'https://www.amawine.it/files/foto/1337_1.jpg'),(110,'Etna 0.75 L',13.7,9,3,'https://vinielisabettaabrami.it/sciaredellalba/wp-content/uploads/2021/02/Etna-Rosso-Sciare-dellAlba-1.png'),(111,'Barbaresco 0.75 L',16.65,9,3,'https://data.callmewine.com/imgprodotto/barbaresco-produttori-del-barbaresco-2019_49018_zoom.jpg'),(112,'Montepulciano 0.75 L',5.99,9,3,'https://shop.chiusagrande.com/wp-content/uploads/2017/05/terre-rosso.png'),(113,'Brandy 70 cl',8.99,10,3,'https://www.lacasadelrum.it/wp-content/uploads/2017/11/BRANDY_AQVAE-scaled.jpg'),(114,'Cognac Martell 70 cl',31.7,10,3,'https://www.enotecacorsetti.com/wp-content/uploads/2022/11/cognac-martell-xo.jpg'),(115,'Vodka Mont Blanc 70 cl',18.15,10,3,'https://www.abcfoodservice.it/img/p/2/7/9/8/4/27984.jpg'),(116,'vitello',15,2,1,'https://www.lamiaspesa.centrocarneshop.com/115-large_default/bistecche-di-reale-senz-osso-carne-che-passione-a-fette-.jpg'),(117,'Gin Tanqueray 70 cl',20,10,3,'https://www.rotundodrink.it/wp-content/uploads/2018/06/Liquore-Gin-Tanqueray-vol.43.1-lt.1.jpg'),(118,'Whiskey Black Label 70 cl',25,10,3,'https://rhsdelivery.it/wp-content/webp-express/webp-images/uploads/2021/12/Johnnie-Walker-Black-Label-800x800.png.webp'),(119,'Aranciata 0.75 L',0.75,8,3,'https://www.bereacasa.it/wp-content/uploads/2017/12/fanta-aranciata-15lt-1.jpg'),(120,'Rum Zacapa 70 cl',20,10,3,'https://data.callmewine.com/imgprodotto/rum-zacapa-23-anni-confezione_9449_zoom.jpg'),(121,'Tequila JOSE CUERVO 70 cl',17,10,3,'https://liquo.it/726-large_default/tequila-jose-cuervo-especial-1-litro-tequila-mezcal.jpg'),(122,'Amaro montenegro 70 cl',15.2,10,3,'https://shared.winelivery.com/images/products/61a8a235b1d79000655ec102.jpeg'),(123,'Jagermeister 70 cl',11.7,10,3,'https://cdn-begaf.nitrocdn.com/SWbXYVYvVhaPBVhWXvVxAoegGYfuQgHM/assets/images/optimized/rev-560d022/wp-content/uploads/2022/10/amaro-jagermeister-1l.jpg'),(124,'Unicum 70 cl',12.6,10,3,'https://www.gruppolazialebevande.it/wp-content/uploads/2016/04/0287_unicum.png'),(125,'Pane integrale ',1.2,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/pane%20integrale.jpg'),(126,'Zucchine',2.6,5,2,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/styles/article_1200_800/public/2022-06/tipi%20di%20zucchine%20-%20Finedininglovers.jpg.webp?itok=6fAmhxWW'),(127,'Pomodori',4.8,5,2,'https://www.salepepe.it/files/2016/08/pomodoro-benessere-1140x636.jpg'),(128,'Ciabatta',0.8,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/ciabatta.jpg'),(130,'Pane challah',2.2,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/challah.jpg'),(132,'Pane arabo',1.1,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/pane%20arabo.jpg'),(133,'Bagel',1.3,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/bagel.jpg'),(134,'Focaccia',0.9,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/focaccia.jpg'),(135,'Soda bread',1.2,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/soda%20bread.jpg'),(136,'Manzo',20,2,1,'https://www.gebacarni.it/wp-content/uploads/2020/03/entrecote-manzo.jpg'),(137,'Pane di segale',1.5,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/pane%20di%20segale.jpg'),(138,'Pane a lievitazione naturale',1.1,1,1,'https://www.finedininglovers.it/sites/g/files/xknfdk1106/files/2023-02/pane%20a%20lievitazione%20naturale.jpg'),(139,'Arance',2.6,5,2,'https://www.my-personaltrainer.it/2019/11/18/arancia_900x760.jpeg'),(140,'Tacchino',5.4,2,1,'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRLZRs5ZaB9RgPSs-IbNgVL7chKigMu6uNFIvBmkJbGFCmcoavBHlJGugi_SC0n9dqxl3cdYx0UvJ_HDE2KNa4mb4knD03VHOjYOdLEHq3eCzdNFZO69GhW&usqp=CAE'),(141,'Coniglio',4.7,2,1,'https://maniman.shop/wp-content/uploads/2022/02/ConiglioFiletto.jpeg'),(142,'Agnello',40,2,1,'https://www.macelleriapompa.it/wp-content/uploads/2023/02/20221212171523_3S1A2905-scaled-1.jpg'),(143,'Abbacchio',27,2,1,'https://d37va2rovhwkkr.cloudfront.net/preview_images/news/2201_0.jpg'),(144,'Pancetta',6.7,2,1,'https://www.centrocarnirigamonti.it/wp-content/uploads/2021/02/pancetta-liscia-affettata.jpg'),(145,'Guanciale',19.8,2,1,'https://www.salumisorrentino.com/wp-content/uploads/2017/02/1215-Guanciale.jpg'),(146,'Prosciutto Crudo',70,2,1,'https://www.spaziodelbuongusto.de/72-thickbox_default/parma-schinken.jpg'),(147,'Fesa di Tacchino',30,2,1,'https://www.italyfoodshop.it/wp-content/uploads/2019/09/ARC-926928.jpg'),(148,'Bresaola',3.12,2,1,'https://salumipasini.com/wp-content/uploads/Bresaola_Punta_di_anca_0503MJ-6x.jpg'),(149,'Culatello',6.1,2,1,'https://www.cibecco.com/wp-content/uploads/2016/11/culatello_di_zibello_dop_trancio_salumificio_squisito.jpg'),(150,'Lonzino',8.83,2,1,'https://www.foodexplore.com/media/catalog/product/cache/cfb506310985da6e6b5b75be9be619ee/p/r/product_l_o_lonzino-di-maiale.gif'),(151,'Mortadella',3.6,2,1,'https://salumipasini.com/wp-content/uploads/Mortadella_Con_Pistacchi_1003JF-1-1140x1140.jpg'),(152,'Salame',15,2,1,'https://b1602398.smushcdn.com/1602398/wp-content/uploads/2017/09/schiacciata_da_raw.jpg?lossy=1&strip=1&webp=1'),(153,'Salamino',13.5,2,1,'https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTraWC43gpi6_Z4WESNoVFQ1BKhP81RhctpM6f_vlvRP6wkUpOQ5AgsXIN6ZS05gkCzLAWD8dB7jR_8G85PM58kLUzJM2DqL57GaQ_S3619g7VJbVZ03ZS2&usqp=CAE'),(154,'Baccala',20,3,1,'https://media.cortilia.it/images/v1/pc/022PROD0921.841x862.jpg'),(155,'Cefalo',22,3,1,'https://media.cortilia.it/images/v1/pc/061PROD0520.841x862.jpg'),(156,'Bufalo',30,2,1,'https://grassfeditalia.com/wp-content/uploads/2020/06/MG_7562.jpg'),(157,'Merluzzo',19,3,1,'https://fishmi.it/wp-content/uploads/2020/09/Merluzzo-scaled.jpg'),(158,'Orata',24,3,1,'https://shop.bergel.it/wp-content/uploads/2021/05/990757.jpg'),(159,'Pesce Persico',28,3,1,'https://www.misya.info/wp-content/uploads/2013/11/pesce-persico-1.jpg'),(160,'Pesce Spada',30,3,1,'https://www.misya.info/wp-content/uploads/2012/11/pesce-spada.jpg'),(161,'Platessa',27,3,1,'https://www.pescheriamercatodelpesce.com/wp-content/uploads/2020/02/Filetto-di-Platessa-senza-pelle_8d2d2eb7c94fcd3.jpg'),(162,'Grappa 70 cl',17.7,10,3,'https://www.roner.com/swt-media/eb/cf/6d/1671713605/Grappa%20Gew%C3%BCrztraminer%20Karton%20000063_800x800.png'),(163,'Polpo',23,3,1,'https://fishmi.it/wp-content/uploads/2022/01/polpo.jpg'),(164,'Spigola',20,3,1,'https://www.nicesurgelati.it/wp-content/uploads/2021/07/filetto-di-spigola.jpg'),(165,'Tonno',18,3,1,'https://www.misya.info/wp-content/uploads/2012/11/tonno-4.jpg'),(166,'Limoncello Pallini 50 cl',8.6,10,3,'https://bottegaalcolica.com/9258-large_default/limoncello-pallini-1l.jpg'),(167,'Calamari',32,3,1,'https://www.marchispa.it/img/leoblog/b/1/355/lg-b-img_blog3hf61v.jpg'),(168,'Triglie',28,3,1,'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQa2ZLo7dtVoNy4Wz7k5EFjHtCwFHk1nw03D53J7YZqV3PfPW6U2Kdd8pXckdpAZFdC6FujvGr98PdlouUvxF6CHC6iHUMPEZ1lNJ3cGidC6ONysD-qOiBR&usqp=CAE'),(169,'Scampi',35,3,1,'https://egress.storeden.net/gallery/5ecfda4ee39ee1fae39ce03b'),(170,'Box sushi small',20,3,1,'https://www.carrefour.it/dw/image/v2/BDWP_PRD/on/demandware.static/-/Sites-carrefour-master-catalog-IT/default/dwb04154f2/large/SushiParty-3701292641700-1.png?sw=260&sh=260&sm=fit&sfrm=jpg'),(171,'Box sushi large',40,3,1,'https://www.carrefour.it/dw/image/v2/BDWP_PRD/on/demandware.static/-/Sites-carrefour-master-catalog-IT/default/dwf274df09/large/MenuLove-3701292641717-1.png?sw=260&sh=260&sm=fit&sfrm=jpg'),(172,'Fusilli',1.5,4,1,'https://www.cicalia.com/it/img/imgproducts/59234/l_59234.jpg'),(173,'Penne rigate ',1.5,4,1,'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61vvjLBzQbL.__AC_SY300_SX300_QL70_ML2_.jpg'),(174,'Cernia',24,3,1,'https://media.cortilia.it/images/v1/pc/108PROD0721.841x862.jpg'),(175,'Dentice',70,3,1,'https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcScKvTNLRQPBJK-5OR8zkqqnPrP4XbSIf6sX9lRhIP1NtXbBJo_EfgnZHdn2aLZw1iqqBLHA6-wUc6SpxSERZcq-HdAjwHk0HbwnsJ64N4&usqp=CAE'),(176,'Maiale',5.3,2,1,'https://www.macelleriasapetta.com/wp-content/uploads/2013/06/Bistecca-di-Suino.png'),(177,'Pollo',4.9,2,1,'https://sanitasenzaproblemi.it/wp-content/uploads/2020/05/carne_di_pollo.jpg'),(178,'Farfalle',1.6,4,1,'https://www.italyfoodshop.it/wp-content/uploads/2019/10/FARFALLE-N%C2%B0-85-Pasta-di-semola-di-grano-duro-RUMMO-500-Gr.jpg'),(179,'Spaghetti',1.6,4,1,'https://www.amanti.events/653-large_default/spaghetti-pasta-rummo-500gr.jpg'),(180,'Gnocchetti freschi',2.5,4,1,'https://www.bcgourmet.it/images/prodotti/gnocchi/i-classici/bcgourmet-classici-gnocchetti-freschi.png'),(181,'Rigatoni',1.5,4,1,'https://cdn.shopify.com/s/files/1/0550/9378/8880/products/voiello-rigatoni-nr-124-500gr-970748_600x.jpg?v=1631699663'),(182,'Tortellini all \'uovo',2.2,4,1,'https://shop.silvanoromaniparma.it/media/catalog/product/cache/1/thumbnail/600x/17f82f742ffe127f42dca9de82fb58b1/t/o/tortelliniemiliani.jpg'),(183,'Riso basmati',2.2,4,1,'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71aAXjYF+2L._AC_SY300_SX300_.jpg'),(184,'Conchigliette',1.6,4,1,'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/81femkDWQBL.__AC_SX300_SY300_QL70_ML2_.jpg'),(185,'Pastina',1.8,4,1,'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71L4oDZFy5L.__AC_SX300_SY300_QL70_ML2_.jpg'),(186,'Orecchiette',2,4,1,'https://www.dececco.com/wp-content/uploads/2019/09/QSX0091-ORECCHIETTE-3.png'),(187,'Pasta integrale',2.5,4,1,'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/61QYUSOdnPS._AC_SX679_.jpg'),(188,'Lasagne',2.8,4,1,'https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T2/images/I/71DaL+9DGAL._AC_SY300_SX300_.jpg'),(189,'Pappardelle',2,4,1,'https://www.carosi.it/wp-content/uploads/FIO0243.jpg'),(190,'Ravioli',2.5,4,1,'https://www.pastificiofracaro.com/wp-content/uploads/2017/07/pastificio-fracaro-vicenza-arzignano-pasta-fresca-uovo-ripiena-ravioli-carne-pacco.png'),(191,'jin',21,4,2,NULL);
/*!40000 ALTER TABLE `prodotti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `ruolo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES (1,'admin','admin','admin@admin.it','admin'),(2,'cliente','cliente','cliente@cliente.it','cliente'),(3,'lavoratore','lavoratore','lavoratre@lavoratore.it','lavoratore'),(19,'luca','lucaiodice','lucaiodice@banana.it','cliente'),(20,'paolo','banana','paolo@gmail.com','cliente'),(21,'franco','franchetto','franco@gmail.com','cliente'),(22,'tom','tomyyy','tom@gmail.com','cliente');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'alimentari'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-03 11:05:54
