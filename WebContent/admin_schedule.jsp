<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.igate.university.dao.AdminLogin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedule Program</title>
</head>
<body>
<a href="Admin_Home.jsp"><font><U>Admin Home</U></font></a>
<jsp:include page="header.html"></jsp:include>
<h1 align="center"><b>Schedule Program</b></h1>
<form action="unicontrol" name="frm" id="frm" method="post">

<input type="hidden" name="page" value="Admsch"></input>

<%
AdminLogin admlogin= new AdminLogin();
List list=new ArrayList();
list=admlogin.get_program_name();
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("admin")))
{
%>

<table align="center" border="2" bordercolor="black" bgcolor="gray">
<tr><td>Program Names</td><td colspan="3">
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
<tr><td>Choose Location</td><td colspan="3"><input type="text" name="loc"></input></td></tr>
<tr><td>Start Date</td>
<td>
<td ><select name="sday">
			<c:forEach var="i" begin="1" end="31" step="1">
				<option value="${i}" />${i}
			</c:forEach>
		</select></td>
		<td><select name="smon">
			<option value="jan">jan</option>
			<option value="feb">feb</option>
			<option value="mar">mar</option>
			<option value="apr">apr</option>
			<option value="may">may</option>
			<option value="jun">jun</option>
			<option value="jul">jul</option>
			<option value="aug">aug</option>
			<option value="sep">sep</option>
			<option value="oct">oct</option>
			<option value="nov">nov</option>
			<option value="dec">dec</option>
		</select></td>
		<td><select name="syear">
			<c:forEach var="i" begin="2012" end="2013" step="1">
				<option value="${i}" />${i}
			</c:forEach>
		</select></td>
</tr>


<tr><td>End Date</td>
<td>
<td><select name="eday">
			<c:forEach var="i" begin="1" end="31" step="1">
				<option value="${i}" />${i}
			</c:forEach>
		</select></td>
		<td><select name="emon">
			<option value="jan">jan</option>
			<option value="feb">feb</option>
			<option value="mar">mar</option>
			<option value="apr">apr</option>
			<option value="may">may</option>
			<option value="jun">jun</option>
			<option value="jul">jul</option>
			<option value="aug">aug</option>
			<option value="sep">sep</option>
			<option value="oct">oct</option>
			<option value="nov">nov</option>
			<option value="dec">dec</option>
		</select></td>
		<td><select name="eyear">
			<c:forEach var="i" begin="2012" end="2013" step="1">
				<option value="${i}" />${i}
			</c:forEach>
		</select></td>
</tr>

<tr><td>Sessions Per Week :</td><td colspan="3"><input type="text" name="spw"></input></td></tr>
<tr><td colspan="4"><input type="submit" name="submit" value="Add" ></input></td></tr>
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