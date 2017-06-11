<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Soft Cart homepage</title>
<link rel="stylesheet" type="text/css" href="common.css">

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



<%@ include file="homeheader.jsp"%>
	
	
	<h1><b><u><i><font size="9"> SoftCart.com </i></u></b></h1>
	
<br>

	


<img src="BigBanner.jpg" name="slideshow" alt="imageslideshow">
<script type="text/javascript">
var numberImage=1
function myslide(){
document.images.slideshow.src=eval("image"+numberImage+".src")
if(numberImage < 3 )
numberImage=numberImage+1
else
numberImage=1
setTimeout("myslide()", 1500)
}
myslide()<br>

 
</script>


</center>


<br><br>



<%@ include file="footerhome.jsp"%>


</body>
</html>