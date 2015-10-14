<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Acknowledgment</title>
</head>
<body>

<a href="Admin_Home.jsp"><font ><u>Admin Home</u></font></a>

<h1 align="center"><font color="maroon"><u>ADMINISTRATION</u></font></h1>
<img alt="University" src="images\c.bmp" width="100%" height="200" border="2"/>
<%
if(request.getSession(false)!=null){
String msg=request.getParameter("msg");
if(msg!=null)
{
	out.println(msg);
}
}
else
{
	out.println("<b>You are not logged in.Please login to see this page</b><br/><a href='admin.jsp'>go to login</a>");
}
%>
<br/>
<br/>
you can <a href="LogOutAdmin.jsp">Logout</a>
</body>
</html>