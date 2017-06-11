<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change password</title>
<link rel="stylesheet" type="text/css" href="common.css">
<!--  <script type="text/javascript">
	function validate() {
		var old;
		var newpass;
		var connew;

		old = loginform.old.value;
		newpass = loginform.newpass.value;
		connew = loginform.connew.value;

		if (old == null || old == "" || old == " ") {
			alert("Please Enter the Password");
			return false;
		}

		if (newpass == null || newpass == "" || newpass == " ") {
			alert("Please enter your new password...");
			return false;
		}
		if (connew == null && connew == null) {
			alert("provide your credentials...");
			return false;
		}
		if (newpass.length < 6) {
			alert("Password must be at least 6 characters long");
			return false;
		}
		if (newpass != connew) {
			alert("Password does not match")
			return false;
		}

		return true;
	}
</script>-->
</head>
<body id="cpwd">
	<center>
		<h2>
			Change Password <br> <br>
		</h2>
	</center>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%
	//String name=(String)session.getAttribute("uname1");
	if(session.getAttribute("adminemail") == null){
	response.sendRedirect("home.jsp");
	}else{
	 %>
	<form name="loginform" action="adpass.jsp" method="post"">
		<center>
			<div>
				<br> <br>
				<table>
					<tr>
						<td>Old Password :</td>
						<td><input type="password" size="35" placeholder="Enter Old Password" id="input" name="old"></td>
					</tr>
					<tr>
						<td>New Password :</td>
						<td><input type="password" size="35" placeholder="Enter New Password" id="input" name="newpass"></td>
					</tr>
					<tr>
					<td>Confirm New Password :</td>
					<td><input type="password" size="35" placeholder="Confirm New Password" id="input" name="connew"></td>
					</tr>
					</table>
					<input type="submit" class="button" value="Change" id="submit">
					</div>
					
					</center>
	</form>
	<%} %>
</body>
</html>