<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<head>
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #38ACEC;
}

li {
    float: left;
}

li.right
{
float: right;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

a:hover:not(.active) {
    background-color: #a1cbe2;
}

.active {
background-color:#4CAF50;
}
</style>
</head>
<body>

<ul>
  <li><a href="#" >SOFTCART</a></li>
  
   <li><a href="myProduct.jsp">View Products</a></li>
    <li><a href="Myorders.jsp">My Orders</a></li>
     <li><a href="Mycart.jsp">My Cart</a></li>
      <li><a href="Mywishlist.jsp">My WishList</a></li>
    <li><a href="myacc.jsp">View Profile</a></li>
    <li class="right"><a href="signout1.jsp">Sign Out</a></li>
     <li><a href="updateProfile.jsp">Update Profile</a></li>
     <li class="right"><a href="change.jsp">Change Password</a></li>
</ul>

</body>
</html>



</body>
</html>