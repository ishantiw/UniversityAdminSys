<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="header.html"></jsp:include>
<body>
<center>
<h2 align="center">Application Status</h2>
<b>Your status is </b><br/>
<b><u><font color="red"><%=session.getAttribute("status") %>
</font>
</u>
</b>
<br/>
<br/>
Go to
<a href="Home.jsp">Home</a>
</center>
</body>
</html>