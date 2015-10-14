<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<title>Application Form</title>
<%@page import="com.igate.university.dao.AdminLogin"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.igate.university.bean.ProgramSchedule"%>
<script type="text/javascript" src="validate.js">
	
</script>
</head>
<jsp:include page="header.html"></jsp:include>
<body bgcolor="">
<a href="Home.jsp">Go to Home</a>
<form action="unicontrol" name="appfrm" method="post">
<center><input type="hidden" name="page" value="applicant"></input>
<h1><u><b><font color="maroon">Application Form</font></b></u></h1>
<marquee><b><u>Please enter your details correctly</u></b></marquee>
<table cellpadding="1" cellspacing="5" align="center" border="2" bgcolor="gray" bordercolor="maroon">
	<tr>
		<th>*First Name:</th>
		<th><input type="text" name="firstname" id="firstname"></th>
	</tr>
	<tr>
		<th>Middle Name:</th>
		<th><input type="text" name="middlename" id="middlename"></th>
	</tr>
	<tr>
		<th>*Last Name:</th>
		<th><input type="text" name="lastname" id="lastname"></th>
	</tr>
	<tr>
		<th>Date of Birth:</th>
		<th><select name="dd">
			<option value="0" selected>day</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
			<option value="25">25</option>
			<option value="26">26</option>
			<option value="27">27</option>
			<option value="28">28</option>
			<option value="29">29</option>
			<option value="30">30</option>
			<option value="31">31</option>
		</select> <select name="mm">

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
		</select> <select name="yy">
			<option value="0" selected>year</option>
			<option value="2005">2005</option>
			<option value="2006">2006</option>
			<option value="2007">2007</option>
			<option value="2008">2008</option>
			<option value="2009">2009</option>
			<option value="2010">2010</option>
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
		</select></th>
	</tr>
	<tr>
		<th>Highest Qualification:</th>
		<th><select name="high_qua">
			<option value="12th">12th</option>
			<option value="Diploma">Diploma</option>
		</select></th>
	</tr>
	<tr>
		<th>Marks Obtained:</th>
		<th><input type="text" name="markstxt" id="markstxt"></th>
		<th>[In percentage]</th>
	</tr>
	<tr>
		<th>Out of:</th>
		<th><input type="text" name="outoftxt" value="100"
			readonly="readonly"></th>
	</tr>
	<tr>
		<th>Goals:</th>
		<th><input type="text" name="goal" id="goal"></input></th>
	</tr>
	<tr>
		<th>Email ID:</th>
		<th><input type="text" name="email" id="email"></th>
	</tr>
	<tr>
		<td><b>Scheduled Program:</b></td>
		
	<td>
<%	AdminLogin admlogin= new AdminLogin();
	List list=new ArrayList();
	if(admlogin.get_schedule_name()!=null)
	{
	list=admlogin.get_schedule_name();
%>
<select name="sp">
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
</select></td>
		<td colspan="3"><input type="hidden" name="hide" value="1" /> <input type="submit"
	name="appbtn" value="Apply" onclick="return validate();"></td>
	</tr>
</table>
</center>
</form>


</body>
</html>