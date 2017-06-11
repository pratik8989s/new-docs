<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.beans.*"%>
<%@page import="com.shopping.dao.UserProduct"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Product</title>
<link rel="stylesheet" type="text/css" href="common.css">
<link rel="stylesheet" type="text/css" href="style-table.css">
</head>
<body>
	<%
		if (session.getAttribute("useremail") == null) {
			response.sendRedirect("home.jsp");
		} else {
			System.out.println("hellooo2");
			UserProduct.fetchUserProduct();
			ArrayList<ProductBean> prod1 = UserProduct.prod;
	%>
	<form action="SearchCategory.jsp">
		Search By Category <select name="choice">
			<option value="Textiles">Textiles</option>
			<option value="Electronics">Electronics</option>
			<option value="Books">Books</option>
			<option value="Watches">Watches</option>
			<option value="Sports">Sports</option>
			<option value="Stationery">Stationery</option>
			<input type="submit" value="search">



		</select>
	</form>

	<center>
		<h2>Products</h2>
	</center>
	<center>
		<table border=1>
			<tr>
				<th>Product id</th>
				<th>Product name</th>
				<th>Product category</th>
				<th>Product Status</th>
				<th>Product Price</th>
				<th>Description</th>
				<th>View Photo</th>
				<th>Add to Cart</th>
				<th>Add to WishList</th>

			</tr>
			<%
				for (int j = 0; j < prod1.size(); j++) {
			%>

			<tr>

				<td><%=prod1.get(j).getPid()%></td>
				<td><%=prod1.get(j).getPname()%></td>
				<td><%=prod1.get(j).getPcat()%></td>
				<td><%=prod1.get(j).getPstatus()%></td>
				<td><%=prod1.get(j).getPrice()%></td>
				<td><%=prod1.get(j).getPdesc()%></td>
				
				<td><a href=<%=prod1.get(j).getPid()+".jpg"%> height="100" width="100">><img src=<%=prod1.get(j).getPid()+".jpg"%> height="20" width="20"></a></td>
				
				<%
					if (prod1.get(j).getPstatus().equals("OutOfStock")) {
				%>
				<td><h3>
						<i><b>Out Of Stock<b></b></i>
					</h3></td>
				<%
					} else {
				%>

				<td>
					<form action="Wishlist.jsp">
						<input type="submit" value="Add to Wishlist"> <input
							type="hidden" value=<%=prod1.get(j).getPid()%> name="pid" />
					</form>
				</td>

				<%
					}

							if (prod1.get(j).getPstatus().equals("OutOfStock")) {
				%>
				<td><h3>
						<i><b>Out Of Stock<b></b></i>
					</h3></td>
				<%
					} else {
				%>
				<td>
					<form action="cart.jsp">

						<input type="submit" value="Add to Cart"> <input
							type="hidden" value=<%=prod1.get(j).getPid()%> name="pid">
						<input type="hidden" value="1" name="val">
					</form>
				</td>
				<%
					}
				%>
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