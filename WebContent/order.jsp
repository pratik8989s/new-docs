<%@page import="utils.system"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="com.shopping.beans.*"%>
<%@page import="com.shopping.dao.AdminUpdateProductDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order details</title>
<!--  <script type="text/javascript">
	function validateorder() {
		var pid;
		var radios;
		

		pid = orderform.pid.value;
		

		if (pid == null || pid == "" || pid == " ") {
			alert("Please Enter your product id...");
			return false;
		}

		return true;
	}
	function noBack() {
		window.history.forward()
	}
	noBack();
	window.onload = noBack;
	window.onpageshow = function(evt) {
		if (evt.persisted)
			noBack()
	}
	window.onunload = function() {
		void (0)
	}
</script>-->

<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
<br><br><br><br><br><br>

	<center>
		<h2>
			<font >Place Your Order</font>
		</h2>
	</center>
	<form name="orderform" action="ShoppingController" method="post" >
	<%String email = (String) session.getAttribute("useremail");
	String pid = request.getParameter("pid");
	
	if(session.getAttribute("useremail") == null){
	response.sendRedirect("home.jsp");
	}else
	{	AdminUpdateProductDao.fetchUserProduct(pid);
	ProductBean up_prod1=AdminUpdateProductDao.up_prod;
	System.out.println("hellooooooo1");
	//System.out.println(Integer.parseInt(request.getParameter("quant")));
	//System.out.println(Integer.parseInt(up_prod1.getPrice()));
	System.out.println("hellooooooo2");
	 %>
		<center>
			<div id="Login">
			<table cellspacing="5" border="1">
					<tr>
						<td><font color=red>Product Id:</font></td>
						<br>
						<td><%= up_prod1.getPid()%> <br>
						<br></td>
					</tr>
					<tr>
						<td><font color=red>Product Name:</font></td>
						<br>
						<td><%= up_prod1.getPname()  %> <br>
						<br></td>
					</tr>
					<tr>
						<td><font color=red>Product Category:</font></td>
						<td><%= up_prod1.getPcat()  %></td>
					</tr>
					<tr>
						<td><font color=red>Product Status:</font></td>
						<td><%= up_prod1.getPstatus()  %></td>
					</tr>
					<tr>
						<td><font color=red>Product Price:</font></td>
						<td><%= up_prod1.getPrice() %>
						<br></td>
					</tr>
					<tr>
						<td><font color=red>Product Description:</font></td>
						<td><%= up_prod1.getPdesc() %></td>
					</tr>
					
					<%--  <tr>
						<td><font color=red>Total Price:</font></td>
						
						<td><%= Integer.parseInt(request.getParameter("quant"))*Integer.parseInt(up_prod1.getPrice())  %>
						</td>
					</tr>--%>
					
				</table>
				<br>
				Select Payment mode:
				<select name="radios">
							<option  value="Net Banking">Net Banking</option>
							<option  value="COD">COD</option>
							<option  value="Debit Card">Debit Card</option>
							<option  value="Cerdit Card">Cerdit Card</option>
							
						</select>
				<input type="submit" class="button" value="Proceed" id="submit"><br> <br> <br>
				<input type="hidden" value="pay" name="category" />
<input type="hidden" value=<%=request.getParameter("pid") %> name="pid" />
			</div>
		</center><%} %>
	</form>
</body>
</html>