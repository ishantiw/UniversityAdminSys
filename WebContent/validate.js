function validate()
{
	if(validFirstName()&& validMiddleName()&& validLastName()&& validmarks()&& emailValidator())
	{
		return true;
	}
	else
	{
		return false;
	}
}
function validFirstName()
{
	
	var fn=document.appfrm.firstname.value;
	var y=/^[a-zA-Z]+$/;
	
	if(!fn.match(y))
    {
    	alert("enter valid firstname");
		document.appfrm.firstname.value="";
		return false;
	}
	else	
	return true;
}
function validMiddleName()
{
	var mn=document.appfrm.middlename.value;
	var y=/^[a-zA-Z]+$/;
	if(!mn.match(y))
	{
		alert("enter valid middlename");
		document.appfrm.middlename.value="";
		return false;
	}
	else return true;
}
function validLastName()
{
	var ln=document.appfrm.lastname.value;
	var y=/^[a-zA-Z]+$/;
	if(!ln.match(y))
	{
		alert("enter valid lastname");
		document.appfrm.lastname.value="";
		return false;
	}
	else return true;
}
/*function validdate()
{
	status=false;
	//var y=/^[0-3][0-9]\-[0-1][0-9]\-\d{4}$/;
	var dob=document.appfrm.dd.value+"-"+document.appfrm.mm.value+"-"+document.appfrm.yy.value;
	if(dob.match(y))
   	{
       var a=dob.substr(0,2);
      if(eval(a)>31||eval(a)==0)
       {
    	   alert("enter valid date(day)");
    	   document.appfrm.dob.value="";
   		status=false;
       }
      var b=dob.substr(3,2);
      if(eval(b)>12||eval(b)==0)
      {
   	   alert("enter valid date(month)");
   	document.appfrm.dob.value="";
  		status=false;
      }
      var c=dob.substr(6,4);
      if(eval(c)<1900||eval(c)==0||eval(c)>2012)
      {
   	   alert("enter valid date(year)less than 2012");
   	document.appfrm.dob.value="";
  		status=false;
      }
    }
    else
    {
    	alert("enter valid date");
    	document.appfrm.dob.value="";
		status=false;
	}
	status=true;
	return status;
}*/

function emailValidator()
{
	
    var emailExp = /^[\w\-\.\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-z0-9]{2,4}$/;
    var ele=document.appfrm.email.value;
    if(!ele.match(emailExp))
   	
    {
    	alert("Enter a valid email id ");
    	document.appfrm.email.value="";
    	return false;
	}
    return true;
}
function validmarks()
{
	
	var y=/^\d{1,3}$/;
	var mark=document.appfrm.markstxt.value;
	if(!mark.match(y))
   	
    {
    	alert("enter valid marks");
    	document.appfrm.markstxt.value="";
    	
		return false;
	}
	else
	{
		if(mark>0 && mark<=100)
		{
			return true;
		}
		else
		{
			alert("ur mark is invalid");
			document.appfrm.markstxt.value="";
			return false;
		}
	
	}
	return true;
}

