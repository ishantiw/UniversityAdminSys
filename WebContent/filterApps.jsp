<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FilterApps</title><link href="style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<a href="list.jsp">BACK</a>
<%@include file="list.jsp" %>
<%@page import="com.igate.university.bean.ApplicForm" %>
<center>
<%
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("mac"))) 
{

%>
<%List apps=new ArrayList();
apps=(List)request.getSession().getAttribute("applications");
if(!apps.isEmpty()){
Iterator itr=apps.iterator();
%>
<b>Application Details </b><br/><br/>
<% String message="srinivas";
message=(String)request.getSession().getAttribute("message");
if(message.equals("invalid date")){ %>
<label style="font-size: large">Invalid Interview Date Entered</label>
<%}%>
<table border="1">
<tr>
	<th>Appid</th>
	<th>Fullname</th>
	<th>DoB</th>
	<th>Qualification</th>
	<th>marks</th>
	<th>goals</th>
	<th>mailid</th>
	<th>status</th>
	<th>dateofInterview</th>
	<th></th>
	<th></th>
</tr>
<%for(int i=0;itr.hasNext();i++){
	ApplicForm bean=new ApplicForm();
	bean=(ApplicForm)itr.next();
	%>
<tr>
	<td><%=bean.getApplication_id() %></td>
	<td><%=bean.getFullname() %></td>
	<td><%=bean.getDob() %></td>
	<td><%=bean.getHigh_qua() %></td>
	<td><%=bean.getMarks() %></td>
	<td><%=bean.getGoal() %></td>
	<td><%=bean.getEmail() %></td>
	<td><%=bean.getStatus() %></td>
	<%if(bean.getInterview()==null){ %>
	<td>EnterInterviewDate</td>
	<%}else {%>	
	<td><%=bean.getInterview() %></td>
	<%} %>
	<%if(bean.getStatus().equals("applied")){ %>
	<td><form action="unicontrol" method="post" name="f1">
	<input type="hidden" name="page" value="mac"/>
	<select name="day">
						<%for(int j=1;j<=31;j++){ %>
							<option value="<%=j%>"><%=j%></option>
						<%} %>
					</select>
					<select name="month">
						<option value="jan">Jan</option>
						<option value="feb">Feb</option>
						<option value="mar">Mar</option>
						<option value="apr">Apr</option>
						<option value="may">May</option>
						<option value="jun">Jun</option>
						<option value="jul">Jul</option>
						<option value="aug">Aug</option>
						<option value="sep">Sep</option>
						<option value="oct">Oct</option>
						<option value="nov">Nov</option>
						<option value="dec">Dec</option>
					</select>
					<select name="year">
						<%for(int j=2000;j<=2020;j++){ %>
							<option value="<%=j%>"><%=j%></option>
						<%}%>
						</select>
	<input type="hidden" name="hid" value="<%=i%>"></input><input type="submit" name="macbtn" value="accept"></input></form></td>
	<td><form action="unicontrol" method="post"><input type="hidden" name="hid" value="<%=i%>"></input><input type="hidden" name="page" value="mac"/><input type="submit" name="macbtn" value="reject"></input></form></td>
	<%}else if(bean.getStatus().equals("accepted")){ %>
	<td><form action="unicontrol" method="post"><input type="hidden" name="hid" value="<%=i%>"></input><input type="hidden" name="page" value="mac"/><input type="submit" name="macbtn" value="confirm"></input></form></td>
	<td><form action="unicontrol" method="post"><input type="hidden" name="hid" value="<%=i%>"></input><input type="submit" name="macbtn" value="reject"></input><input type="hidden" name="page" value="mac"/></form></td>
	<%} %>
</tr>
<%}
}else{%>
<h3>No Applications to filter for this program</h3>
<% }%>

</table>
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

</center>
 
</body>
</html>