<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@page import="com.igate.university.dao.AdminLogin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.igate.university.bean.ProgramsOffered"%>
</head>
<jsp:include page="header.html"></jsp:include>
<body>
<%
	AdminLogin admlogin = new AdminLogin();
	List list = new ArrayList();
	list = admlogin.get_program_name();
%>

<form action="unicontrol" method="post"><input type="hidden"
	name="page" value="Admview"></input> <input type="hidden" name="sub"
	value="app"></input>
<table align="center" border="2" bordercolor="black" bgcolor="gray">
	<tr>
		<td>Please select Program name</td>
		<td><select name="programName">
			<%
				for (int i = 0; i < list.size(); i++) {
			%>
			<option value="<%=list.get(i)%>"><%=list.get(i)%></option>
			<%
				}
			%>
		</select></td>
	</tr>
	<tr>
		<td><input type="submit" value="get" /></td>
	</tr>
</table>
</form>
<%
	String vect = (String) request.getSession().getAttribute("vect");

	ProgramsOffered pgf = (ProgramsOffered) request
			.getAttribute("plist");
	if (pgf != null) {
%>

<input type="hidden" name="page" value="Admupd"></input>
<input type="hidden" name="pname" value="<%=vect%>"></input>
<table align="center" border="2" bordercolor="black" bgcolor="gray">
	<tr>
		<td><b><u>Description :-</u></b></td>
		<td><b><%=pgf.getDescription()%></b></td>
	</tr>
	<tr>
		<td><b><u>Eligibility :-</u></b></td>
		<td><b><%=pgf.getApplicant_eligibilty()%></b></td>
	</tr>
	<tr>
		<td><b><u>Duration :-</u></b></td>
		<td><b><%=pgf.getDuration()%></b></td>
	</tr>
	<tr>
		<td><b><u>Degree Certificate Degree :-</u></b></td>
		<td><b><%=pgf.getDegree_certificate_offered()%></b></td>
	</tr>
	<tr>
		<td></td>
	</tr>
</table>
<%
	}
%>
</body>
</html>