<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="com.shopping.dao.UserDeleteFromCartDao"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove from Cart</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<center>
<%String name = (String) session.getAttribute("username"); %>
		<h1 style="color: red">
			<%=name%>
		</h1>
		<%
			String email = (String) session.getAttribute("useremail");
			String pwd = (String) session.getAttribute("userpassword");
			
			String cid = (String) session.getAttribute("customer_id");
			String pid = request.getParameter("pid");
			UserDeleteFromCartDao.DeleteUserCart(cid, pid);
			out.println("Product_Id= " + pid);
			out.println("Removed from Cart");
			RequestDispatcher rd = request.getRequestDispatcher("Mycart.jsp");
			rd.include(request, response);
		%>
	</center>

</body>
</html>