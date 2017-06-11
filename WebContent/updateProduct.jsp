<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.beans.*"%>
<%@page import="com.shopping.dao.AdminUpdateProductDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product-Soft Cart</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
<%
	String pid=request.getParameter("pid");
	if(session.getAttribute("adminemail") == null){
	response.sendRedirect("home.jsp");
	}else{
	
	AdminUpdateProductDao.fetchUserProduct(pid);
	ProductBean up_prod1=AdminUpdateProductDao.up_prod;
	
	 %>
	<form action="ShoppingController" method="post">	
		<center>
			<div id="pd">
				  <h2><font color=red>Update Products</font></h2><br>
				<br>
			</div>
		</center>
		<center>
			<div id="pd">
				<table cellspacing="5">
					<tr>
						<td><font color=red>Product Id:</font></td>
						<br>
						<td><input type="text" value=<%=up_prod1.getPid() %> name="id" id="pid" size="35" /><br>
						<br></td>
					</tr>
					<tr>
						<td><font color=red>Product Name:</font></td>
						<br>
						<td><input type="text" value=<%=up_prod1.getPname() %> name="name" size="35" id="name" /><br>
						<br></td>
					</tr>
					<tr>
						<td><font color=red>Product Category:</font></td>
						<td><%--<input type="text" value=<%=rs.getString(3) %> name="prodcategory" size="35" />--%>
						<select name="prodcategory" value=<%=up_prod1.getPcat() %>>
							<option  value="Textiles">Textiles</option>
							<option  value="Electronics">Electronics</option>
							<option  value="Books">Books</option>
							<option  value="Watches">Watches</option>
							<option  value="Phone">CellPhone</option>
						</select>
						<br>
						<br></td>
					</tr>
					<tr>
						<td><font color=red>Product Status:</font></td>
						<td><%-- <input type="text" value=<%=rs.getString(4) %> name="status" id="status" size="35">--%>
						<select name="status" value=<%=up_prod1.getPstatus() %>>
							<option value="InStock">InStock</option>
							<option value="OutOfStock">Out of Stock</option>
						</select>
						<br>
						<br></td>
					</tr>
					<tr>
						<td><font color=red>Product Price:</font></td>
						<td><input type="number" value=<%=up_prod1.getPrice() %> name="price" size="35" id="price" /><br>
						<br></td>
					</tr>
					<tr>
						<td><font color=red>Product Description:</font></td>
						<td><textarea value=<%=up_prod1.getPdesc() %> name="pdesc" rows="5" size="35"></textarea><br>
						<br></td>
					</tr>
					
				</table>
			</div>
		</center>
		<center>
		
			<input type="submit" class="button" value="updateproduct" id="submit" style="width: 295px; ">
			<input type="reset" value="Reset">
		</center>
		<input type="hidden" value="updateproduct" name="category" />
	</form>
	<%} %>
</body>
</html>