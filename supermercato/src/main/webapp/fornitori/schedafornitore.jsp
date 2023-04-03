<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%	Map<String,String> fornitori = (Map<String,String>) request.getAttribute("fornitore"); %>
<%	List<Map<String,String>> prodotti = (List<Map<String,String>>) request.getAttribute("prodottifornitore");%>
<html>
	<head>
		<title><%= fornitori.get("nomefornitori") %></title>
	</head>
	<body>
		<h1><%= fornitori.get("nomefornitori") %></h1>
		<hr>
		<br>
		<a href="/">Home</a> 
		<a href="/prodotti/elencoprodotti">Elenco prodotti</a>
		<br>
		<hr>
		<br>
		<hr>
		<table>
			<tr>
				<td>
					NOME
				</td>
				<td>
					PREZZO
				</td>
				<td>
					CATEGORIA
				</td>
			</tr>
			<% for(Map<String,String> m : prodotti) {%>
			<tr>
				<td>
					<%= m.get("nome") %>
				</td>
				<td>
					<%= m.get("prezzo") %>
				</td>
				<td>
					<a href="/categoria/cercacategoria?id=<%= m.get("idcategoria") %>">
						<%= m.get("nomecategoria") %>
					</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>