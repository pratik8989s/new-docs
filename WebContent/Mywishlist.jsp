<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.beans.*"%>
<%@ page import="com.shopping.dao.UserWishListDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<%
		String email = (String) session.getAttribute("uname");
		String cid = null;

		if (session.getAttribute("useremail") == null) {
			response.sendRedirect("home.jsp");
		} else {

			cid = (String) session.getAttribute("customer_id");

			String val = "1";
			request.setAttribute("val", val);

			UserWishListDao.fetchUserWishList(cid);
			ArrayList<UserWishListBean> wishlist1 = UserWishListDao.wishList;
	%>
	<center>
		<h1>
			<font color=red>Welcome to your WishList</font>
		</h1>
		<h2>Products</h2>
	</center>
	<center>
		<table border=1>
			<tr>

				<th>Product ID</th>
				<th>PRODUCT NAME</th>
				<th>PRODUCT CATEGORY</th>
				<th>PRODUCT STATUS</th>
				<th>PRODUCT PRICE</th>
				<th>PRODUCT DESC</th>
				<th>View Photo</th>
				
				<th>Add to Cart</th>
				<th>Remove from WishList</th>


			</tr>
			<%
				for (int j = 0; j < wishlist1.size(); j++) {
			%>
			<tr>
				<td><%=wishlist1.get(j).getPid()%></td>
				<td><%=wishlist1.get(j).getPname()%></td>
				<td><%=wishlist1.get(j).getPcat()%></td>
				<td><%=wishlist1.get(j).getPstatus()%></td>
				<td><%=wishlist1.get(j).getPrice()%></td>
				<td><%=wishlist1.get(j).getPdesc()%></td>
				
				<td><a href=<%=wishlist1.get(j).getPid()+".jpg"%> height="100" width="100">><img src=<%=wishlist1.get(j).getPid()+".jpg"%> height="20" width="20"></a></td>

				<td>
					<form action="cart.jsp">
						<input type="submit" value="Add to Cart"> <input
							type="hidden" value=<%=wishlist1.get(j).getPid()%> name="pid">
						<input type="hidden" value="2" name="val">

					</form>
				</td>
 
				<td>
					<form action="removeFromWishList.jsp">
						<input type="submit" value="Remove from Wishlist"> <input
							type="hidden" value=<%=wishlist1.get(j).getPid()%> name="pid" />
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