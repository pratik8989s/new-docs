<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up-Soft Cart</title>

<link rel="stylesheet" type="text/css" href="common.css">

<%-- <script type="text/javascript">  


function validateform(){  
var name=myform.name.value;
var phno=myform.contactno.value;
var email=myform.email.value;
var password=myform.passwd.value;  
var conpasswd=myform.confirmpasswd.value

  
if (name==null || name==""){  
  alert("Name can't be blank");  
  return false;  
}
if(phno==null || phno=="")
{
	alert("Contact number should not be empty");
	return false;
}
if(phno.length!=10 )
		{
	alert("Contact number should be 10 numbers");
	return false;
	}
if(isNaN(phno))
{
alert("it should contain only digits");
return false;
}


if(email==null||email=="")
	{
	alert("Please enter EmailID");
	return false;
	}


if(password==null||password=="")
{
	alert("Please enter Password");
	return false;
}
if(password.length<6 || password.length>12 ){  
  alert("Password must between 6 to 12 charcaters long ");  
  return false;  
  }  
if(conpasswd==null||conpasswd=="")
	{
	alert("Please confirm Password")
	return false;
	}
	if(password!=conpasswd)
		{
		alert("Password does not match")
		return false;
		}
  return true;
}  
</script>--%>
</head>
<body id="sign">

<form name="myform" action="ShoppingController" method="post">
<h2 id="signbanner"></h2>
<h2><center> 
User Registration 
</center></h2>
<br>
<br>
<br>
<div id="div1"><br>
<br>
<center>
<table cellspacing="5">
	<tr>
		<td>Name:</td>
		<td><input type="text" id="input" name="name" required></td>
	</tr>
	<tr>
		<td>Address:</td>
		<td><textarea name="addr" id="input">
</textarea></td>
	</tr>
	<tr>
		<td>Contact No:</td>
		<!--  <td><input type="tel" size=10 id="input" name="contactno" required></td>-->
		<td><input type="number" min="1" max="9" size="10" ></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input type="email"  id="input" name="email" required></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="password" id="input" name="passwd" required></td>
	</tr>
	<tr>
		<td>Confirm Password:</td>
		<td><input type="password" id="input" name="confirmpasswd" required></td>
	</tr>

</table>
</center> 


<input type="hidden" value="insert" name="category" />
<center> <input type="submit" class="button" value="Register" id="submit" >
</center>
<br>
</div>
</form>
</body>
</html>