<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Status</title>
</head>
<jsp:include page="header.html"></jsp:include>
<body bgcolor="silver">
<a href="Home.jsp">Home</a>
<form action="unicontrol" method="post">
<input type="hidden" name="page" value="applicant" ></input>
<input type="hidden"  name="hide" value ="2"/>
<table align="center" border="2" >
<tr><td><b>Enter your Application id :</b></td>

<td><input type="text" name="apid"/></td></tr>
<tr><td>
<input type="submit" value="submit"/></td></tr>
</table>
</form>

</body>
</html>