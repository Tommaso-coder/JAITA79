<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="registrazione.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>REGISTRAZIONE</title>
<script>
    var controllo = <%=session.getAttribute("controllo")%>;
    if(controllo){
    	window.onload=function(){
    		swal( "Oops" , "Compila il form correttamente" , "error" )
    	};
    }
</script>
<% session.setAttribute("controllo", false); %>
</head>
<body>
	<div class="box">
		<form action="/utenti/registrazione" method="post">
			<h2>REGISTRAZIONE</h2>
			<div class="inputBox">
				<input type="text" name="user" required="required"> <span>Username</span>
				<i></i>
			</div>
			<div class="inputBox">
				<input type="password" name="pass" required="required"> <span>Password</span>
				<i></i>
			</div>
			<div class="inputBox">
				<input type="email" name="email" required="required"> <span>Email</span>
				<i></i>
			</div>
			<div class="link">
				<a href="formlogin.jsp">Sei già registrato? Fai il login!</a>
			</div>
			<input type="submit" value="Registrati" id="pulsantelogin">
		</form>
	</div>
</body>
</html>
