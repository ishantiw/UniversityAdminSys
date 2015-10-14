<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@page import="java.util.*"%>
 <%@page import="com.igate.university.bean.*" %>
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Scheduled Program</title>
</head>
<jsp:include page="header.html"></jsp:include>
<body>
<center>
<!--<form action="unicontrol" method="post"> 
<input type="hidden" name="page" value="applicant" ></input>
<input type="hidden"  name="hide" value ="3"/>
<input name="submit" type="submit" value="Click Here To view Schedule"></input>
</form>
--></center>
<center>

<% 

List sch_list=(List)request.getSession().getAttribute("list");
if(sch_list!=null)
{%>
	<b>SCHEDULED PROGRAM</b>
	<table border="2" align="center" bgcolor="gray" bordercolor="maroon">
	<tr>
	<th>SCHEDULED_PROGRAM_ID</th>
	<th> PROGRAM_NAME </th>
	<th>LOCATION </th>
	<th> START_DATE </th>
	<th>END_DATE</th>
	<th> SESSIONS_PER_WEEK</th>
	</tr><%
Iterator li=sch_list.iterator();
while(li.hasNext())
{
	ProgramSchedule prg=(ProgramSchedule)li.next();

%>
<tr>
<td><%=prg.getScheduled_program_id() %></td>
<td><%=prg.getProgram_name() %></td>
<td><%=prg.getLocation() %></td>
<td><%=prg.getStartdate() %></td>
<td><%=prg.getEnddate()%></td>
<td><%=prg.getSessions_per_week() %></td>

</tr>
<%} %>
</table>
<br/>
<a href="Home.jsp">Go to Home</a>
<%}
else
{
%>
<h1>No Scheduled Programs Exists</h1>
<%
}
%>
</center>
</body>
</html>