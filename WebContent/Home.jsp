<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<link href="style.css" rel="stylesheet" type="text/css" />
</head>

<jsp:include page="header.html"></jsp:include>

<body>
<marquee><u><b>Welcome to University Admission System</b></u></marquee>
<table border="2">
<tr><td width="20%">
<ul>
<li><form action="unicontrol" method="post"><input type="hidden" name="page" value="applicant" ></input>
<input type="hidden"  name="hide" value ="3"/><a href=# onclick="submit()" style="font-size: large;color: black;"><b>View Programs</b></a></form></li>
<li><a href="ApplicationForm.jsp" style="font-size: large;color: black;"><b>Apply Online</b></a></li>
<li><a href="viewStatus.jsp"  style="font-size: large;color: black;"><b>Check Status</b></a></li>
<li><a href="admin.jsp" style="font-size: large;color: black;"><b>Administrator</b></a></li>
<li><a href="MACLogin.jsp" style="font-size: large;color: black;"><b>MAC</b></a></li>
</ul></td>
<td width="80%" >
<div>


<h2 align="center"><u>About Us</u></h2>
<center>
<p style="font-family: cursive; color: maroon;font-size: large;">
There are three categories of people who would access 
the system viz. applicants, members of admission 
committee(mac)and administrators.Each one of them would 
have some exclusive priviliges.There are three categories of people who would access 
the system viz. applicants, members of admission 
committee(mac)and administrators.Each one of them would 
have some exclusive priviliges.There are three categories of people who would access 
the system viz. applicants, members of admission 
committee(mac)and administrators.Each one of them would 
have some exclusive priviliges.There are three categories of people who would access 
the system viz. applicants, members of admission 
committee(mac)and administrators.
</p>
</center></div>	

</td></tr>

</table>
</body>




</html>