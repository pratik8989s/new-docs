<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Soft Cart</title>
<link rel="stylesheet" type="text/css" href="common.css">

<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>


<center>
<script type="text/javascript">


var image1= new Image();
image1.src="BigBanner.jpg "

var image2= new Image();
image2.src="lappy.jpg"

var image3= new Image();
image3.src="book2.jpg "


</script>


</head>
<body >

<%
	if(session.getAttribute("useremail") == null){
	response.sendRedirect("home.jsp");
	}else
	{ %>

<%@ include file="userheader.jsp"%>


	 <br><br><br><br>

	<div>
<center><h1><b><font size="9"><i><b>Welcome <%=session.getAttribute("username") %>,<%=session.getAttribute("customer_id") %> to SoftCart.com</b></i></font></b></h1></center>


	</div>
	<%} %>
	
	 <br><br><br><br>
	 
	 

	 
	 

<img src="iphone.jpg" name="slideshow" alt="imageslideshow">
<script type="text/javascript">
var numberImage=1
function myslide(){
document.images.slideshow.src=eval("image"+numberImage+".src")
if(numberImage < 3 )
numberImage=numberImage+1
else
numberImage=1
setTimeout("myslide()", 2500)
}
myslide()

 
</script>




















</center>




	
	
</body>
</html>