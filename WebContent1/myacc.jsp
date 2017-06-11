<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="com.shopping.beans.*"%>
<%@page import="com.shopping.dao.UserUpdateProfileDao"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<%
		String email = (String) session.getAttribute("useremail");
		if (session.getAttribute("useremail") == null) {
			response.sendRedirect("home.jsp");
		} else {
			String cid=(String)session.getAttribute("customer_id");
			UserUpdateProfileDao.fetchUserProduct(cid);
			RegisterBean up_prof1=UserUpdateProfileDao.up_prof;
	%>
	<center>
		<h2>USER PROFILE</h2>
	</center>
	
	<center>
		<table cellspacing="5" border="1">
					<tr>
						<td><font color=black>Customer Id:</font></td>
						<br>
						<td><%=up_prof1.getId() %> </td>
					</tr>
					<tr>
						<td><font color=black>Customer Name:</font></td>
						<br>
						<td><%=up_prof1.getName() %> </td>
					</tr>
					<tr>
						<td><font color=black>Customer address:</font></td>
						<td><%=up_prof1.getAddress() %> </td>
					</tr>
					<tr>
						<td><font color=black>Customer Phone:</font></td>
						<td><%=up_prof1.getPhNo() %></td>
					</tr>
					<tr>
						<td><font color=black>Email ID:</font></td>
						<td><%=up_prof1.getEmailID() %> </td>
					</tr>
					<tr>
						<td><font color=black>Password:</font></td>
						<td><%=up_prof1.getPasswd() %> </td>
					</tr>

				</table>
				<%} %>

		<br> <br>
		<form action="first.jsp">
			<input type="submit" value="Back to home page">
		</form>
	</center>

</body>
</html>