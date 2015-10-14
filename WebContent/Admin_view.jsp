<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Programs</title>
<%@page import="com.igate.university.dao.AdminLogin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.igate.university.bean.ProgramsOffered"%>
</head>
<body>
<a href="Admin_Home.jsp"><font ><u>Admin Home</u></font></a>
<jsp:include page="header.html"></jsp:include>


<%
AdminLogin admlogin= new AdminLogin();
List list=new ArrayList();
list=admlogin.get_program_name();
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("admin")))
{
%>

<form action="unicontrol" method="post">
<input type="hidden" name="page" value="Admview"></input>
<input type="hidden" name="sub" value="adm"></input>
<table align="center" border="2" bordercolor="black" bgcolor="gray">
<tr>
<td>Please select Program name</td>
<td>
<select name="programName">
<% for(int i=0;i<list.size();i++)
{
%>
<option value="<%=list.get(i)%>"><%=list.get(i)%></option>
<%
}
%>
</select>
</td></tr>
<tr><td><input type="submit" value="get"  /></td></tr>
</table>
</form>
<% String vect=(String)request.getSession().getAttribute("vect");

ProgramsOffered pgf= (ProgramsOffered)request.getAttribute("plist");
if(pgf!=null){
%>

<input type="hidden" name="page" value="Admupd"></input>
<input type="hidden" name="pname" value="<%=vect %>"></input>
<table align="center" border="2" bordercolor="black" bgcolor="gray">
<tr><td><b>Description</b></td><td><input type="text" name="desc" id="desc" readonly="readonly" value="<%=pgf.getDescription() %>"></input></td></tr>
<tr><td><b>Eligibility</b></td><td><input type="text" name="elig" id="elig" readonly="readonly" value="<%=pgf.getApplicant_eligibilty() %>" ></input></td></tr>
<tr><td><b>Duration</b></td><td><input type="text" name="dur" readonly="readonly" value="<%=pgf.getDuration() %>"></input></td></tr>
<tr><td><b>Degree Certificate Degree</b></td>
<td><input type="text" name="cert" value="<%=pgf.getDegree_certificate_offered() %>" readonly="readonly" ></input></td></tr>
<tr><td><form action="unicontrol" method="post"><input type="submit" name="delete" value="delete"></input></td></tr>
</table>
<input type="hidden" name="page" value="prodel"></input>
<input type="hidden" name="pname" value="<%=vect %>"></input>
</form>

</table>
<a href="LogOutAdmin.jsp">Log out</a>
<br />
<br />

<%} 
}
else
{
	out.println("<b>You are not logged in.Please login to see this page</b><br/><a href='admin.jsp'>go to login</a>");
}
%>

</body>
</html>