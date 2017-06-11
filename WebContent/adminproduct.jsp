<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.beans.*"%>
<%@page import="com.shopping.dao.UserProduct"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<%
		if (session.getAttribute("adminemail") == null) {
			response.sendRedirect("home.jsp");
		} else {

			UserProduct.fetchUserProduct();
			ArrayList<ProductBean> prod1 = UserProduct.prod;
	%>
	<!--  <form action="SearchCategory.jsp">
		Search By Category <select name="choice">
			<option value="Textiles">Textiles</option>
			<option value="Electronics">Electronics</option>
			<option value="Books">Books</option>
			<option value="Watches">Watches</option>
			<option value="Phone">CellPhone</option>
			<input type="submit" value="search">



		</select>
	</form>-->
	
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
				<th>Desc</th>
				<th>View Photo</th>
				<th>Update Product</th>
				<th>Delete Product</th>


			</tr>
			<%
		
					for (int j = 0; j <prod1.size(); j++) {
					
			%>
			<tr>
				<td><%=prod1.get(j).getPid()%></td>
				<td><%=prod1.get(j).getPname()%></td>
				<td><%=prod1.get(j).getPcat()%></td>
				<td><%=prod1.get(j).getPstatus()%></td>
				<td><%=prod1.get(j).getPrice()%></td>
				<td><%=prod1.get(j).getPdesc()%></td> 
				
				<td><a href=<%=prod1.get(j).getPid()+".jpg"%> height="100" width="100">><img src=<%=prod1.get(j).getPid()+".jpg"%> height="20" width="20"></a></td>

				<td>
					<form action="updateProduct.jsp">
						<input type="submit" value="Update Product"> <input
							type="hidden" value=<%=prod1.get(j).getPid()%> name="pid" />
					</form>
				</td>

				<td>
					<form action="ShoppingController">
						<input type="submit" value="Delete Product"> <input
							type="hidden" value=<%=prod1.get(j).getPid()%> name="pid" /> <input
							type="hidden" value="deleteproduct" name="category" />
					</form>
				</td>
				
			</tr>
			<%
				}
				}
			%>

		</table>

		<br> <br> <br> <a href="adminpage.jsp" class="button">Back
			to home page</a>
	</center>

</body>
</html>