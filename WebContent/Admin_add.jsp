<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function datevalid(elem ,invalidmsg){
    
    var datexp=/^(\d{2})(\/|-)(\d{2})\2(\d{4})$/;
    if(elem.value.match(datexp))
        {
        return true;
    	}
    else
        {
    alert(invalidmsg);
    elem.focus();
   		return false;
        }
}

function valid(y)
{
    var x=document.getElementById(y).value;
    var alphaExp=/^[a-zA-Z]+$/;
    if(x.match(alphaExp))
        {
            return true;
        }
        else{
            alert("Please type Letters");
            
            return false;
            
        }
    }
function valid2(y)
{
    var x=document.getElementById(y).value;
    var alphaExp=/^[0-9]+$/;
    if(x.match(alphaExp))
        {
            return true;
        }
        else
            {
            alert("Please type digits");
            
            return false;
            
        }
    }
function lengthRestriction(elem, min, max){
    var uInput = document.getElementById(elem).value;
    if(uInput.length >= min && uInput.length <= max){
        return true;
    }
    else
        {
    alert("Please enter " +min+ " characters only");
   
    return false;
}
}
function not_blank()
{
	//alert("hello");
	var t1=document.frm.txt1.value;
	var t2=document.frm.elig.value;
	var t3=document.frm.dur.value;
	var t4=document.frm.cert.value;
	var t5=document.frm.loc.value;

	if((t1==0) ||(t2==0)|| (t3==0) ||
			 (t4==0) || (t5==0))
		
	{
		
		alert("enter all the fields");
		return true;
	}
		else
		{
			
			alert("you have entered all the values");
			return false;

		}
}
</script>
</head>
<body>
<a href="Admin_Home.jsp"><u>Administration Home</u></a>
<jsp:include page="header.html"></jsp:include>
<%
if((request.getSession(false)!=null) && (request.getSession(false).getAttribute("role").equals("admin")))
{
%>
<h1 align="center"><b>Add New Course</b></h1>
<form action="unicontrol" name="frm" id="frm" method="post">
<input type="hidden" name="page" value="AdmAdd"></input>
<table align="center" border="2" bordercolor="black" bgcolor="gray">
<tr>
<td><b>Program Name</b></td>
<td><input type="text" name="programName" id="txt1"onblur="valid('txt1')"></input></td>
</tr>
<tr><td><b>Description</b></td><td><textarea name="desc" id="desc"></textarea></td></tr>
<tr><td><b>Eligibility</b></td><td><textarea name="elig" id="elig" ></textarea></td></tr>
<tr><td><b>Duration</b></td><td><input type="text" name="dur" ></input></td></tr>
<tr><td><b>Degree Certificate Degree</b></td>
<td><input type="text" name="cert" onblur="valid('cert')"></input></td></tr>
<tr>
<tr><td><input type="submit" value="Add" onclick="not_blank(),datevalid(document.getElementById('edate'),'Wrong Date Format'),datevalid(document.getElementById('sdate'),'Wrong Date Format')"></input></td></tr>
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