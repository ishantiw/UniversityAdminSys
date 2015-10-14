<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@page import="com.igate.university.dao.AdminLogin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page import="com.igate.university.bean.ProgramSchedule"%>
</head>
<body>
<a href="Admin_Home.jsp"><font ><u>Admin Home</u></font></a>
<jsp:include page="header.html"></jsp:include>


<%
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("admin")))
{
	
	AdminLogin admlogin= new AdminLogin();
	List list=new ArrayList();
	if(admlogin.get_schedule_name()!=null)
	{
	list=admlogin.get_schedule_name();

%>

<form action="unicontrol" method="post">
<input type="hidden" name="page" value="Admviewsch"></input>
<table align="center" border="2" bordercolor="black" bgcolor="gray">
<tr>
<td>Please select Program name</td>
<td>
<select name="scheduleName">
<% for(int i=0;i<list.size();i++)
{
%>
<option value="<%=list.get(i)%>"><%=list.get(i)%></option>
<%
}
	}else
	{
		out.println("<b>Connection is not their with the database.<br/>please try after sometime</b>");
	}
%>
</select>
</td></tr>
<tr><td><input type="submit" value="get"  /></td></tr>
</table>
</form>
<% String vects=(String)request.getSession().getAttribute("vects");

ProgramSchedule pps= (ProgramSchedule)request.getAttribute("slist");
if(pps!=null){
%>


<table align="center" border="2" bordercolor="black" bgcolor="gray">
<tr><td><b>Program Name</b></td><td><input type="text" name="pname" id="desc" readonly="readonly" value="<%=pps.getProgram_name() %>"></input></td></tr>
<tr><td><b>Location</b></td><td><input type="text" name="loc" id="elig" readonly="readonly" value="<%=pps.getLocation() %>" ></input></td></tr>
<tr><td><b>Sessions Per Week</b></td><td><input type="text" name="sdf" readonly="readonly" value="<%=pps.getSessions_per_week() %>"></input></td></tr>
<tr><td><b>Start Date :</b></td>
<td><input type="text" name="sdate" value="<%=pps.getStartdate()%>" readonly="readonly" ></input></td></tr>
<tr><td>End Date:<td><input type="text" name="edate" value="<%=pps.getEnddate()%>" readonly="readonly" ></input></td></tr>
<tr><td><form action="unicontrol" method="post"><input type="submit" name="delete" value="delete"></input></td></tr>
</table>
<input type="hidden" name="page" value="schdel"></input>
<input type="hidden" name="sname" value="<%=vects %>"></input>
</form>
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