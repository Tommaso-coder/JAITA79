<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.generation.supermercato.entities.*"%>
<%@ page import="java.util.*"%>
<%
Utente u = (Utente) request.getAttribute("utente");
%>
<%
List<Map<String, String>> storico = (List<Map<String, String>>) request.getAttribute("storico");
%>
<html>
<head>
 <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">


    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/responsive.css">
    <link rel="stylesheet" href="../css/custom.css"> 
    
   
<title><%=u.getUser()%></title>
</head>
	<body>
	
		 <header class="main-header">

        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
 
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    <img src="../images/menu.png" width = "20" height ="20">
                </button>
                    <a class="navbar-brand" href="/"><img src="../images/ironcane.png" class="logo" alt=""></a>
                </div>

                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="/">HOME</a></li>
                        
                        <li class="nav-item"><a class="nav-link" href="/prodotti/elencoprodotti">I Nostri Prodotti</a></li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">CATEGORIE</a>
                            <ul class="dropdown-menu">
								<li><a href="/categoria/cercacategoria?id=1">PANETTERIA</a></li>
								<li><a href="/categoria/cercacategoria?id=2">CARNE & SALUMI</a></li>
                                <li><a href="/categoria/cercacategoria?id=3">PESCE & SUSHI</a></li>
                                <li><a href="/categoria/cercacategoria?id=4">PASTA & RISO</a></li>
                                <li><a href="/categoria/cercacategoria?id=5">FRUTTA & VERDURA</a></li>
                                <li><a href="/categoria/cercacategoria?id=6">FORMAGGI & LATTE & UOVA</a></li>
                                <li><a href="/categoria/cercacategoria?id=7">SURGELATI & GELATI</a></li>
                                <li><a href="/categoria/cercacategoria?id=8">BEVANDE</a></li>
                                <li><a href="/categoria/cercacategoria?id=9">ENOTECA</a></li>
                                <li><a href="/categoria/cercacategoria?id=10">SUPERALCOLICI</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#banana">About Us</a></li>
                        <li class="nav-item"><a class="nav-link" href="/utenti/formlogin">LOGOUT</a></li>
                    </ul>
                </div>

                <div class="attr-nav">
                    <ul>

                    </ul>
                </div>

            </div>
        
        </nav>

    </header>
			<br>
		<div class="card text-center">
			<div class="card-body">
				<h2 class="card-title">
					CIAO
					<%=u.getUser()%>!!!
				</h2>
				<p class="card-text">PASS
				<%=u.getPass()%></p>
				
				<p class="card-text">EMAIL
				<%=u.getEmail()%></p>
				
				<p class="card-text">RUOLO
				<%=u.getRuolo()%></p>				
			</div>
		</div>	
		<h3>STORICO</h3>
		<table>
			<tr>
				<td>NOME</td>
				<td>QUANTITA</td>
				<td>PREZZO</td>
			</tr>
			<%
			for (Map<String, String> m : storico) {
			%>
			<tr>
				<td><%=m.get("nome")%></td>
				<td><%=m.get("quantita")%></td>
				<td><%=m.get("prezzototale")%></td>
			</tr>
			<%
			}
			%>
		</table>
		<br>
		<br>
		<br>
		<footer>
        <div class="footer-main">
            <div class="container">
		
                <div class="row">
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-widget">
                            <h4>About FlashMall</h4>
                            <p>Siamo un'azienda dedicata a fornire ai nostri clienti prodotti alimentari 
                            di alta qualità a prezzi convenienti, ci impegniamo a fornire un servizio clienti
                            eccellente, offrendo assistenza e supporto in ogni fase del processo di acquisto. 
                            Siamo sempre disponibili per rispondere alle domande dei nostri clienti e aiutare a 
                            risolvere qualsiasi problema e siamo lieti di fornire ai nostri clienti i migliori prodotti
                            alimentari a prezzi convenienti e un'esperienza di shopping semplice e piacevole. 
                            Grazie per aver scelto FlashMall per la vostra spesa!</p> 
							<p></p> 							
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                    </div>
                    <div class="col-lg-4 col-md-12 col-sm-12">
                        <div class="footer-link-contact">
                            <h4>Contact Us</h4>
                            <ul>
                                <li>
                                    <p><img src = "images/right-arrow.png" width = "10" height= "10" class = "mt-3" aria-hidden="true"></i>Indirizzo: Piazza Labomba Escappa <br>Ardea<br> 00040 </p>
                                </li>
                                <li>
                                    <p><img src = "images/right-arrow.png" width = "10" height= "10" class = "mt-3" aria-hidden="true"></i>Numero di telefono <a href="tel:3470000000">3470000000</a></p>
                                </li>
                                <li>
                                    <p><img src = "images/right-arrow.png" width = "10" height= "10" class = "mt-3" aria-hidden="true"></i>Email: <a href="flashmall@flashmall.it">flashmall@flashmall.it</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
	
		
		  <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/bootsnav.js."></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>   
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>