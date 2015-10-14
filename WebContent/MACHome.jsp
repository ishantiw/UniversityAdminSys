<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="HeaderMAC.jsp"></jsp:include>
<marquee><b>Hello Member Of Admission Committee , You can perform following task</b></marquee>
<%
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("mac"))) 
{

%>
<form method="post" action="unicontrol">
<input type="hidden" name="page" value="mac"/>
<table align="center" border="2" bordercolor="lightblue">
<tr>

<td align="center"><input type="submit" name="macbtn" value="View Applictions" border="2" style="background-color: gray;" ></input></td>
</tr>
<tr>
<td align="center"><input type="submit" name="macbtn" value="Update Application" border="2" style="background-color: gray;"></input></td>
</tr>


</table>
</form>
<% 
}
else
{
	out.println("<b>You are not logged in.Please login to see this page</b><br/><a href='MACLogin.jsp'>go to login</a>");
}
%>

</body>
</html>