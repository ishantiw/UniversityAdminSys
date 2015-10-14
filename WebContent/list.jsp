<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.List,java.util.Iterator" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>list</title><jsp:include page="HeaderMAC.jsp"></jsp:include>
</head>
<body>
<a href="MACHome.jsp">Home</a>
<%
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("mac"))) 
{

%>
<form action="unicontrol" method="post">
<center>
<%
List programs=(List)request.getSession().getAttribute("progs");
Iterator it=programs.iterator();

%>
 Select a Program SCheduled ID : <select name="progid">
<%while(it.hasNext()){
	String prog=(String)it.next();
	%>
<option value="<%=prog%>"><%=prog%></option>

<%} %>

</select>
<input type="submit" value="filter" name="macbtn"><input type="hidden" name="page" value="mac"/></input>
</center>
</form>
<a href="LogOutMAC.jsp">Log out</a>
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