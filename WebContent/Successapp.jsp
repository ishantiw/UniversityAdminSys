<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><link href="style.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<jsp:include page="header.html"></jsp:include>
<body>
<%Integer appid=(Integer)request.getSession(false).getAttribute("appid"); 
out.println("<b>Your application has been successfully sent.</b><br/>"
					+"Your application number is :"+appid);
out.println("<br/><b>Click <a href='viewStatus.jsp'>here</a> to see your status</b>");

%>
</body>
</html>