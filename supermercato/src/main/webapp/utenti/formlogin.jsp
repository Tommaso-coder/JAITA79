<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="login.css" type="text/css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
		var controlloOk = <%=session.getAttribute("controlloOk")%>;
        if(controlloOk){
        	window.onload=function(){
        		swal( "Grazie!" , "Registrazione avvenuta con successo" , "success" )
        	};
        }
</script>
<% session.setAttribute("controlloOk", false); %>
<title>LOGIN</title>
</head>
<body>
	<div class="box">
		<form action="/utenti/login" method="get">
			<h2>LOGIN</h2>
			<div class="inputBox">
				<input type="text" name="user" required="required"> <span>Username</span>
				<i></i>
			</div>
			<div class="inputBox">
				<input type="password" name="pass" required="required"> <span>Password</span>
				<i></i>
			</div>
			<div class="link">
				<a href="formregistrazione.jsp">Non sei registrato? Registrati!</a>
			</div>
			<input type="submit" value="Login" id="pulsantelogin">
		</form>
	</div>
</body>
</html>