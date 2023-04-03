<%@ page language="java" 
    contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%    List<Map<String,String>> fornitori = (List<Map<String,String>>) request.getAttribute("fornitori");%>
<html>
    <head>
        <title>Elenco fornitori</title>
    </head>
    <body>
        <h1>ELENCO DEI FORNITORI</h1>
        <hr>
        <br>
        <a href="/">Home</a>
        <a href="/prodotti/elencoprodotti">Elenco prodotti</a>
        <br>
        <hr>
        <br>
        <br>

        <table>
            <tr>
                <td>
                    ID
                </td>
                <td>
                    NOME
                </td>
                <td>
                    EMAIL
                </td>
                <td>
                    NUMERO DI TELEFONO
                </td>
                <td>
                    PARTITA IVA
                </td>
                <td>
                   	NUMERO PRODOTTI
                </td>
            </tr>
            <% for(Map<String,String> m : fornitori) {%>
            <tr>
                <td>
                    <%= m.get("id") %>
                </td>
                <td>
                    <%= m.get("nomefornitori") %>
                </td>
                <td>
                    <%= m.get("email") %>
                </td>
                <td>
                    <%= m.get("numero") %>
                </td>
                <td>
                    <%= m.get("pIVA") %>
                </td>
                <td>
                    <%= m.get("nProdotti") %>
                </td>
                
            </tr>
            <%} %>
        </table>
    </body>
</html>