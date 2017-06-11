<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>

<%@page import="com.shopping.dao.UserInsertWishListDao"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<center>
		<%
			String email = (String) session.getAttribute("useremail");
			String pwd = (String) session.getAttribute("userpassword");
			String usname = (String) session.getAttribute("username");
		%>
		<h1 style="color: red">
			<%=usname%>
		</h1>
		<%
			String pid = request.getParameter("pid");
			String cid = (String) session.getAttribute("customer_id");
			UserInsertWishListDao.InsertUserWishlist(cid, pid);

			out.println("Product_Id= " + pid);
			out.println("Added to Wishlist");
			RequestDispatcher rd = request
					.getRequestDispatcher("myProduct.jsp");
			rd.include(request, response);
		%>
	</center>

</body>
</html>