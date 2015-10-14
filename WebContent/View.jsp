<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.sql.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title><link href="style.css" rel="stylesheet" type="text/css" />
<%
Connection con;
Class.forName("oracle.jdbc.driver.OracleDriver");
con= DriverManager.getConnection("jdbc:oracle:thin:@192.168.104.157:1522:orcl","trg276","training276");

String query="select distinct scheduled_program_id from application";
PreparedStatement pstmt=null;
ResultSet rs=null;
pstmt=con.prepareStatement(query);
rs=pstmt.executeQuery();%> 
</head>
<body>
<a href="MACHome.jsp">HOME</a>
<jsp:include page="HeaderMAC.jsp"></jsp:include>
<%
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("mac"))) 
{

%>
<form action="unicontrol" method="post">
<input type="hidden" name="page" value="mac"/>

<table align="center">
<tr>
     <td>Enter Program ID</td><td><select name="pgmID">
     <option value="select">select Program Id</option>
     <% while(rs.next())
    	 {
    	 %>
    	       <option value="<%= rs.getString(1)%>"> <%= rs.getString(1)%></option>
    	<%  
    	 }
    %>
  </select></td>
  
  <td><input type="submit" name="macbtn" value="View"></input></td>
</tr>
</table>

        
</form>
<a href="LogOutMAC.jsp">Log out</a>
<br />
<br />
<% 
}
else
{
	out.println("<b>You are not logged in.Please login to see this page</b><br/><a href='MACLogin.jsp'>go to login</a>");
}
%>
</body>
</html>

