<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%List<Map<String,String>> utenti= (List<Map<String,String>>) request.getAttribute("elencoutenti"); %>
<html>
	<head>
		<title>ELENCO UTENTI</title>
	</head>
	<body>
		<table>
                <tr>
                    <td>
                        USER
                    </td>
                    <td>
                        PASS
                    </td>
                    <td>
                        EMAIL
                    </td>
                    <td>
                        RUOLO
                    </td>
                    <td>
                        NOMINATIVO
                    </td>
                     <td>
                        MODIFICA RUOLO
                    </td>
                </tr>
                <%for(Map<String,String> m: utenti) {%>
                	<tr>
                		<td><%=m.get("user")%></td>
                		<td><%=m.get("pass")%></td>
                		<td><%=m.get("email")%></td>
                		<td><%=m.get("ruolo")%></td>
                		<td><%=m.get("nominativo")%></td>	
						<td class="aggiorna">
							<a href="/utenti/aggiornaruolo?id=<%=m.get("id")%>">PROMUOVI</a>
						</td>
						<td class="aggiorna">
							<a href="/utenti/abbassaruolo?id=<%=m.get("id")%>">DECLASSA</a>
						</td>
                	</tr>
                <%} %>
		</table>
	</body>
</html>