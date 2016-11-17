<%@ include file="loginredirect.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login Page</title>
		<link rel="stylesheet" type="text/css" href="login.css">
	</head>
	<body>
	<header>
		<img src ="../images/tellus-logo.png"/>
	</header>
		<div>
			<form action="login.jsp" method="post">
				<table align=center border="0" width="30%">
					<tr>
						<td><h3>Username</h3></td>
						<td><input type=text name=user required></td>
					</tr>
					<tr>
						<td><h3>Password</h3></td>
						<td><input type=password name=pass required></td>
					</tr>
				</table>
				<button type=submit>Login</button>
			</form>
		</div>	
	</body>
</html>