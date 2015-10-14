<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.igate.university.bean.ApplicForm"%><html>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.*"%>
<%@page import="com.igate.university.UniversityController.*"%>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Applications</title><link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%@include file="View.jsp" %>
<body>
<%
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("mac"))) 
{

%>
<form action="unicontrol" method="post">
<% List vect=(List)request.getSession().getAttribute("lis");
if(vect.isEmpty()){
	%>
	<h2>No applications for given Program Id</h2>
	<%}else{ %>


<h3 align="center"><b>APPLICATIONS</b></h3>
<table align="center" bgcolor="gray" border="2">
<tr>
<th>APPLICATION ID</th>
<th> NAME</th>
<th>DATE OF BIRTH</th>
<th>QUALIFICATION</th>
<th>MARKS</th>
<th>GOALS</th>
<th>EMAIL ID</th>
<th>STATUS</th>
</tr>

<%
for(int i=0;i<vect.size();i++) 
{
	ApplicForm stud=(ApplicForm)vect.get(i);

out.println("<tr><td><b>"+ stud.getApplication_id()+"</b></td><td>"+ stud.getFullname()+"</td><td>"+ stud.getDob()+
		"</td><td>"+ stud.getHigh_qua() +"</td><td>"+ stud.getMarks() +"</td><td>"+ stud.getGoal()+
		"</td><td>"+ stud.getEmail()+"</td><td>"+ stud.getStatus() +"</td></tr>");


}%>

</table>
</form>
<%} %>
<%
}
else
{
	out.println("<b>You are not logged in.Please login to see this page</b><br/><a href='admin.jsp'>go to login</a>");
}
%>

</body>
</html>