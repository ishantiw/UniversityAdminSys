<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Home</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>


<jsp:include page="header.html"></jsp:include>
<%if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("admin")))
{ %>
<form>
<h1 align="center"><font color="black"><u>Welcome Administration</u></font></h1>
<marquee><b>Hello admin , You can perform following task</b></marquee>
<table align="left" border="2" bordercolor="lightblue">
<tr>
<td><a href="Admin_add.jsp"><font >Add New Course</font></a></td>
</tr>
<tr>
<td><a href="admin_schedule.jsp"><font >Schedule a Course</font></a></td>
</tr>
<tr>
<td><a href="Admin_view.jsp"><font>View Course Schedule</font></a></td>
</tr>
<tr>
<td><a href="Admin_view_scheduled.jsp"><font>View Scheduled programs</font></a></td>
</tr>

<tr>
<td><a href="Admin_update.jsp"><font>Update Existing Course</font></a></td>
</tr>

</table>
</form>
<a href="LogOutAdmin.jsp">Log out</a>
<br />
<br />
<%
}
else
{
	out.println("<b>You are not logged in.Please login to see this page</b><br/><a href='admin.jsp'>go to login</a>");
}
%>

</body>
</html>