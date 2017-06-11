<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*"%>
<% Class.forName("oracle.jdbc.driver.OracleDriver"); %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>success</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>

	<%
String name = request.getParameter("name");
String email = request.getParameter("email");
  %>
	<h1 style="color: red">
		<%=name %>
		successfully signed up
	</h1>
	<% 
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String uname = "system";
    String pass = "system";
    
        Connection con = DriverManager.getConnection(url,uname,pass);
                    
                   
         
        		PreparedStatement ps=con.prepareStatement(  "select customer_id from customer1 where email_id=?");  
        		
        		ps.setString(1,email); 
        		ResultSet rs =ps.executeQuery();
        		while(rs.next()) {
             %>Your customer id is
	<%= rs.getString("customer_id") %>

	<% } %>

	<a href="login.jsp" class="button">Click here to login</a>
	

</body>
</html>