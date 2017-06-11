<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.shopping.dao.CancelOrderDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<%
			String email = (String) session.getAttribute("useremail");
			String pwd = (String) session.getAttribute("userpassword");
			String name = (String) session.getAttribute("username");
		%>
		<h1 style="color: red">
			<%=name%>
		</h1>
		<%
			
			
			String pid = request.getParameter("pid");
			String cid = (String) session.getAttribute("customer_id");
			CancelOrderDao.cancelUserOrder(cid, pid);
			
			out.println("Product_Id= " + pid);
			out.println("Order Successfully Cancelled");
			RequestDispatcher rd = request
					.getRequestDispatcher("Myorders.jsp");
			rd.include(request, response);
		%>
	</center>

</body>
</html>