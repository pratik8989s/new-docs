<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ include file = "logoutheader.jsp"; %>
<link rel="stylesheet" type="text/css" href="common.css">
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
</head>
<body>
<% 
      //HttpSession newsession = request.getSession(false);
      if (session != null) 
      {
      session.removeAttribute("uname");
         session.invalidate();
      }

    %>

		<br>
		<br>
		<br>
		<center>
			<h1 class="success">Invalid Credential</h1> <br>
				<br>
				<h2 class="success">Try Again!</h2></font>
		</center>
	
</body>
</html>