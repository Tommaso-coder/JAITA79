<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.generation.supermercato.entities.*" %>
<% Utente u = (Utente) request.getAttribute("utente"); %>
<html>
	<head>
	</head>
	<body>
		<h3>COMPLETA L'ACQUISTO</h3>
		<form action="/carrello/acquisto" method="get">
			<table>
				<tr>
					<td>
						INDIRIZZO
					</td>
					<td>
						<input type="text" name="indirizzo" placeholder="Via Roma, 2, Roma, RM, 00016, " required="required">
					</td>
				</tr>
				<tr>
					<td>
						NUMERO CARTA
					</td>
					<td>
						<input type="number" name="numerocarta" placeholder="5333 xxxx xxxx xxxx" required="required">
					</td>
				</tr>
				<tr>
					<td>
						DATA SCADENZA
					</td>
					<td>
						<input type="number" name="datascadenza" placeholder="MM/AA" required="required">
					</td>
				</tr>
				<tr>
					<td>
						CVV
					</td>
					<td>
						<input type="number" name="cvv" placeholder="000" required="required">
					</td>
				</tr>
			</table>
		</form>
		<a href="/carrello/compraprodotti?id=<%= u.getId()%>">COMPRA</a>
	</body>
</html>