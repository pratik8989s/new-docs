<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Product-Soft Cart</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body id="deleteproduct">
<%
	//String name=(String)session.getAttribute("uname1");
	if(session.getAttribute("uname1") == null){
	response.sendRedirect("home.jsp");
	}else{
	 %>
<center><h2>DELETE PRODUCT FROM THE DATABASE</h2></center>
	<form action="ShoppingController" method="post">
		<br>
		<br>
		<br>
		<br>
		<br>
		<center>
			<div id="pd">
				<br>
				<br>
				<br>
				<table>
				<tr>
				 <td>Product ID<td><br> 
				 <td><input type="text" name="product" id="pid"></td>
				 </tr>
				</table>
			</div>
		</center>
		<center>
			<input type="submit" class="button" value="Delete Product" id="submit">
		</center>
		<input type="hidden" value="deleteproduct" name="category" />
	</form>
	<%} %>
</body>
</html>