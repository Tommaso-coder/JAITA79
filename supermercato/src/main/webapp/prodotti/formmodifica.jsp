<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%	Map<String, String> prodotti = (Map<String, String>) request.getAttribute("daModificare");%>
<%	List<Map<String, String>> categoria = (List<Map<String, String>>) request.getAttribute("mapcategoria");%>
<%	List<Map<String, String>> fornitori = (List<Map<String, String>>) request.getAttribute("mapfornitori");%>
<html>
	<head>
		<title>Modifica prodotto</title> 
	</head>
	<body>
		<h2>MODIFICA PRODOTTO</h2>
		<hr>
		<br>
		<form action="modificaprodotto" method="get">
			<table>
				<tr>
					<td>
					</td>
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
					<td>
						URL IMMAGINE
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="id" value="<%= prodotti.get("idprodotti") %>" hidden ="hidden">
					</td>
					<td>
						<input type="text" name="nome" value="<%= prodotti.get("nomeprodotto") %>" required="required">
					</td>
					<td>
						<input type="number" name="prezzo" value="<%= prodotti.get("prezzoprodotto") %>" required="required">
					</td>
					<td>
						<select name="idcategoria">
							<option value="<%= prodotti.get("idcategoria")%>"><%= prodotti.get("categoria")%></option >
						<%	for(Map<String,String> m : categoria) {%>
							<% if(!(prodotti.get("idcategoria").equalsIgnoreCase(m.get("id")))) {%>
								<option value="<%= m.get("id") %>"><%= m.get("nomecategoria") %></option>
						<%} }%>
						</select>
					</td>
					<td>
						<select name="idfornitori">
							<option value="<%= prodotti.get("idfornitori")%>"><%= prodotti.get("fornitore")%></option>
						<%	for(Map<String,String> m : fornitori) {%>
							<% if(!(prodotti.get("idfornitori").equalsIgnoreCase(m.get("id")))) {%>
								<option value="<%= m.get("id") %>"><%= m.get("nomefornitori") %></option>
						<%} }%>
						</select>
					</td>
					<td>
						<input type="text" name="URLImmagine" value="<%= prodotti.get("URLImmagine") %>" required="required">
					</td>
					<td>
						<input type="submit" value="AGGIORNA">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>