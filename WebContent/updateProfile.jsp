<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.beans.*"%>
<%@page import="com.shopping.dao.UserUpdateProfileDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product-Soft Cart</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<form action="ShoppingController" method="post">
		<%
			if (session.getAttribute("useremail") == null) {
				response.sendRedirect("home.jsp");
			} else {
			
		
			String cid=(String)session.getAttribute("customer_id");
			UserUpdateProfileDao.fetchUserProduct(cid);
			RegisterBean up_prof1=UserUpdateProfileDao.up_prof;

				
		%>
		<center>
			<div id="pd">
				<h2>
					<font color=black>Update Profile</font>
				</h2>
			</div>
		</center>
		<center>
			<div id="pd">
				<table cellspacing="5">
					<tr>
						<td><font color=black>Customer Id:</font></td>
						<br>
						<td><input type="text" value=<%=up_prof1.getId() %> name="id" id="id" size="35" /><br>
							<br></td>
					</tr>
					<tr>
						<td><font color=black>Customer Name:</font></td>
						<br>
						<td><input type="text" value=<%=up_prof1.getName() %> name="name" size="35" id="name" /><br>
							<br></td>
					</tr>
					<tr>
						<td><font color=black>Customer address:</font></td>
						<td><input type="text" value=<%=up_prof1.getAddress() %> name="textarea1" size="35" /><br>
							<br></td>
					</tr>
					<tr>
						<td><font color=black>Customer Phone:</font></td>
						<td><input type="text" value=<%=up_prof1.getPhNo() %> name="contact" size="35"><br>
							<br></td>
					</tr>
					<tr>
						<td><font color=black>Email ID:</font></td>
						<td><input type="text" value=<%=up_prof1.getEmailID() %> name="mail" size="35" /><br> <br></td>
					</tr>
					<tr>
						<td><font color=black>Password:</font></td>
						<td><input type="Password" value=<%=up_prof1.getPasswd() %> name="passwd" size="35" /><br> <br></td>
					</tr>

				</table>
			</div>
		</center>
		<center>
			<input type="submit" class="button" value="Update" id="submit"
				style="width: 212px;">
		</center>
		<input type="hidden" value="update" name="category" />
		<%
			}
		%>
	</form>
</body>
</html>