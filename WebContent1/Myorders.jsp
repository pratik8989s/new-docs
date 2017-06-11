<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.beans.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="com.shopping.dao.UserOrderDao"%>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<%
		
		if (session.getAttribute("useremail") == null) {
			response.sendRedirect("home.jsp");
		} else {

			String cid = (String) session.getAttribute("customer_id");
			System.out.println("hellooo1");
			System.out.println(cid);
			UserOrderDao.fetchUserOrder(cid);
			ArrayList<OrderBean2> ord1 = UserOrderDao.ord;
	%>
	<center>
		<h2>Products</h2>
	</center>
	<center>
		<table border=1>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Product Category</th>
				<th>PRODUCT Status</th>
				<th>Product Price</th>
				<th>PRODUCT Desc</th>
				<th>Order ID</th>
				<th>Order Date</th>
				<th>Payment Mode</th>
				<th>Order Status</th>

			</tr>
			<%
				for (int i = 0; i < ord1.size(); i++) {
			%>
			<tr>

				<td><%=ord1.get(i).getPid()%></td>
				<td><%=ord1.get(i).getPname()%></td>
				<td><%=ord1.get(i).getPcat()%></td>
				<td><%=ord1.get(i).getPstatus()%></td>
				<td><%=ord1.get(i).getPri()%></td>
				<td><%=ord1.get(i).getDesc()%></td>
				<td><%=ord1.get(i).getOid()%></td>
				<td><%=ord1.get(i).getDate()%></td>
				<td><%=ord1.get(i).getPay()%></td>
				<td><%=ord1.get(i).getStst()%></td>
				<td>
					<form action="CancelOrder.jsp">
						<input type="submit" value="Cancel Order"> <input
							type="hidden" value=<%=ord1.get(i).getPid()%> name="pid" />
					</form>
				</td>




			</tr>
			<%
				}
				}
			%>

		</table>
		<br> <br> <br> <a href="first.jsp" class="button">Back
			to home page</a>
	</center>

</body>
</html>