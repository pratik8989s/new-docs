<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="com.shopping.dao.UserInsertCartDao"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<center>
		<%String name=(String)session.getAttribute("username"); %>
		<h1 style="color: red">
			<%=name%>
		</h1>
		<%
			
			String pid = request.getParameter("pid");
			String cid = (String) session.getAttribute("customer_id");
			UserInsertCartDao.InsertUserCart(cid, pid);
			out.println("Product_id= " + pid);
			out.println("Added to cart");
			
			if(request.getParameter("val").equals("1")){
			
			RequestDispatcher rd = request.getRequestDispatcher("myProduct.jsp");
			rd.include(request, response);
			}
			else{
			
			RequestDispatcher rd = request.getRequestDispatcher("Mywishlist.jsp");
			rd.include(request, response);
			}
			
		%>
	</center>
</body>
</html>