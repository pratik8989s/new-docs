<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

</head>

<style>
ul {
    list-style-type: none;
    color: #002e4d
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: ;
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
    font-family: "Times New Roman", Georgia, Serif;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    
}

a:hover:not(.active) {
    background-color: #a1cbe2;
}

.active {
background-color:white ;
}
</style>

<body>

<ul>
  <li><a href="#"  ><font face="Times New Roman" size="5" color="#002e4d">SOFTCART</font></a></li>

    <li><a href="#"><font face="Times New Roman" size="5" color="#002e4d">About Us</font></a></li>
    <li><a href="#"><font face="Times New Roman" size="5" color="#002e4d">Services</font></a></li>
    <li class="right"><a href="login.jsp"><font face="Times New Roman" size="5" color="#002e4d">Login</font></a></li>
     
     <li class="right"><a href="adminlogin.jsp"><font face="Times New Roman" size="5" color="#002e4d"> Admin Login</font></a></li>
</ul>






</body>

</html>



