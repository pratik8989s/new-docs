<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>failed</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<center>
		<%
			String name = request.getParameter("name");
		%>
		<h1 style="color: black">
			<%=name%>
			Please enter the valid details<br>
			<b>Note:-Password and Confirm Password should be same.<b></b><br>
			

		</h1>

		<a href="signup.jsp" class="button">Click here to try again</a>
	</center>

</body>
</html>