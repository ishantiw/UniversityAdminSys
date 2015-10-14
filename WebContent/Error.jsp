<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
Admin<a href="Admin_Home.jsp"><font ><u> Home</u></font></a>
<h1>This is an Error Page</h1>
<b>
GO TO Admin<a href="admin.jsp"><font ><u> Login</u></font></a>
<br/>
GO TO MAC<a href="MACLogin.jsp"><font ><u> Login</u></font></a>

<%String err=request.getParameter("msg"); 

if(err!=null)
{
	out.println(err);
}

%></b>
</body>
</html>