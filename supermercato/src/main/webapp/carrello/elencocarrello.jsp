<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%	List<Map<String,String>> prodotti = (List<Map<String,String>>) request.getAttribute("elencocarrello"); %>    
<%@ page import="com.generation.supermercato.entities.*" %>
<% Utente u = (Utente) request.getAttribute("utente"); %>
<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/style.css">

	<link rel="stylesheet" href="../prodotti/elencoprodotti.css" type="text/css">
	<link rel="shortcut icon" href="../images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="../images/apple-touch-icon.png">

    <link rel="stylesheet" href="../css/responsive.css">

    <link rel="stylesheet" href="../css/custom.css">
		<title>Il tuo carrello</title>
	</head>
	<body>
	<header class="main-header">

        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
 
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                    	<i class="fa fa-bars"></i>
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
                        <li class="nav-item">
                        <% if(u != null) {%>
						<%	 if(u.getRuolo().equals("admin")) {%>
								<li><a class="nav-link" href="/fornitori/elencofornitori">Elenco Fornitori</a></li>
								<li><a class="nav-link" href="/prodotti/formnuovoprodotto">Nuovo Prodotto</a></li>
								<li><a class="nav-link" href="/fornitori/formnuovofornitore">Nuovo Fornitore</a></li>
							<%}%>
						<%	if(u.getRuolo().equals("cliente")) {%>
								<li><a class="nav-link" href="/profilo/profilo?id=<%= u.getId() %>">Profilo</a></li>
								<li><a class="nav-link" href="/carrello/carrelloprodotti?id=<%= u.getId() %>">Carrello</a></li>
							<%}%>
						<%} %>
						</li>
						<% if(u != null) {%>
						
                        <li class="nav-item"><a class="nav-link" href="/utenti/logout">LOGOUT</a></li>
                        	<%} %>
                    </ul>
                </div>

                <div class="attr-nav">
                    <ul>

                    </ul>
                </div>

            </div>
        
        </nav>

    </header>
		<h1>Prodotti nel carrello</h1>
		<div class="container-fluid">
	<%double costoTotale = 0; 
	for (Map<String, String> m : prodotti) {
	%>

	<div class="col-lg-4 col-md-3 col-sm-3  card" >
		<img class="imgCard"src="<%=m.get("URLImmagine")%>"
			alt="<%=m.get("URLImmagine")%>" >
			<h4>
				<b><%=m.get("nome")%></b>
			</h4>
			<p><b><%=m.get("quantita")%></b></p>
			<p><b><%=m.get("prezzo")%> €</b></p>
			
			<%
			if (u != null) {
			%>
			<%
			if (u.getRuolo().equals("cliente")) {
			%>
			<form method="post" action="/carrello/rimuovi">
			<input type="text" name="id" value="<%= u.getId()%>"hidden>
			<input type="text" name="idprodotto" value="<%=m.get("id")%>" hidden>
				<button type="submit" class="btn btn-warning">RIMUOVI</button>
			</form>
			<%}%>
			<%
			}
			%>
	</div>
	<% costoTotale += Double.parseDouble(m.get("prezzototale")); %>
	<%
	}
	%>
	<hr>
	<br>
	<hr>
	<br>
	<h2> PREZZO TOTALE:<%= Math.round(costoTotale*100.0)/100.0 %> €</h2>
	
	 </div>
	<form method="get" action="/carrello/continuaacquisto" class="text-center">
		<button type="submit" class="btn btn-warning" >continua l'acquisto</button>
	</form>
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
                                    <p>Indirizzo: Piazza Labomba Escappa <br>Ardea<br> 00040 </p>
                                </li>
                                <li>
                                    <p>Numero di telefono <a href="tel:3470000000">3470000000</a></p>
                                </li>
                                <li>
                                    <p>Email: <a href="flashmall@flashmall.it">flashmall@flashmall.it</a></p>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <div id="bananone">
       <a class="navbar-brand" href="https://www.youtube.com/shorts/EZoGCLj5Ey0"><img src="images/ironcane.png" class="logo2" alt=""></a>
    </div>

    <div id="banana"></div>
    <div class="footer-copyright">
        <p class="footer-company">All Rights Reserved. &copy; 2023 <a href="#">FlashMall</a> Design By:
            Federico x2, Tommaso, Livia, Davide, Luca</a></p>
    </div>


    <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>
	<script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.superslides.min.js"></script>
    <script src="../js/bootstrap-select.js"></script>
    <script src="../js/inewsticker.js"></script>
    <script src="../js/bootsnav.js."></script>
    <script src="../js/images-loded.min.js"></script>
    <script src="../js/isotope.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/baguetteBox.min.js"></script>
    <script src="../js/form-validator.min.js"></script>
    <script src="../js/contact-form-script.js"></script>
    <script src="../js/custom.js"></script>
</body>
</html>