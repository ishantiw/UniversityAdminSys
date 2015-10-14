<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<style type="text/css">

h2{font-size: x-large;color: maroon;}
</style>
</head>
<body>

<jsp:include page="header.html"></jsp:include>

<%
if(request.getSession(false)!=null)
{
	request.getSession(false).invalidate();
}
%>
<form action="unicontrol" method="post">

<input type="hidden" name="page" value="adminLogin"></input>
<table align="center" border="2" bordercolor="black" bgcolor="gray"> 

	<tr>
		<td><b>Enter User ID</b></td>
		<td><input type="text" name="uid"></input></td>
	</tr>
	<tr>
		<td><b>Enter Password</b></td>
		<td><input type="password" name="pwd"></input></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" name="submit" value="Login"></input></td>
	</tr>

</table>

</form>

</body>
</html>