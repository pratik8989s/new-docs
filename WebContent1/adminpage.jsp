<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Softcart Admin</title>

<%@include file="header.jsp"%>

<link rel="stylesheet" type="text/css" href="common.css">

</head>
<body id="adminbody">
 
<%
	
	 if(session.getAttribute("adminemail") == null){
	response.sendRedirect("adminlogin.jsp");
	}else{
	 %>
	

	<form action="ShoppingController" method="post">

		<input type="hidden" value="adlogout" name="category">
	</form>
	<br><br><br><br><br>
	<center>
		<font size="7" color: #002e4d><i>Welcome <%=session.getAttribute("admin_name")%> to Admin Page</i></font>
		<br><br><br>
		<figure>
  <img src="addd.jpg" alt="Admin" >
  
</figure>
		
		
		
	</center>

 <%} %>

</body>
</html>
