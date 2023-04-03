<%@ page language="java"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%	List<Map<String, String>> fornitori = (List<Map<String, String>>) request.getAttribute("mapfornitori");%>
<html>
	<head>
		<title>Form nuovo fornitore</title>
	</head>
	<body>
		<h2>INSERISCI UN NUOVO FORNITORE</h2>
		<hr>
		<br>
		<form action="/fornitori/aggiungifornitore" method="post">
			<table>
				<tr>
					<td>
						NOME
					</td>
					<td>
						E-MAIL
					</td>
					<td>
						NUMERO
					</td>
					<td>
						P.IVA
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="nome" required = "required">
					</td>
					<td>
						<input type="text" name="email" required = "required">
					</td>
					<td>
						<input type="text" name="numero" required = "required">
					</td>
					<td>
						<input type="text" name="pIVA" required = "required">
					</td>
					<td>
						<input type="submit" value="AGGIUNGI">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>