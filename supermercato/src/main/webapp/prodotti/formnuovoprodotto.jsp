<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%	List<Map<String, String>> categoria = (List<Map<String, String>>) request.getAttribute("mapcategoria");%>
<%	List<Map<String, String>> fornitori = (List<Map<String, String>>) request.getAttribute("mapfornitori");%>
<html>
	<head>
		<title>Form nuovo prodotto</title>
	</head>
	<body>
		<h2>INSERISCI UN NUOVO PRODOTTO</h2>
		<hr>
		<br>
		<form action="nuovoprodotto" method="get">
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
					<td>
						FORNITORE
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="nome">
					</td>
					<td>
						<input type="text" name="prezzo">
					</td>
					<td>
						<select name="idcategoria">
						<%	for(Map<String,String> m : categoria) {%>
							<option value="<%= m.get("id") %>"><%= m.get("nomecategoria") %></option>
						<%} %>
						</select>
					</td>
					<td>
						<select name="idfornitori">
						<%	for(Map<String,String> m : fornitori) {%>
							<option value="<%= m.get("id") %>"><%= m.get("nomefornitori") %></option>
						<%} %>
						</select>
					</td>
					<td>
						<input type="submit" value="AGGIUNGI">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>