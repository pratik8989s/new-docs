<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.shopping.dao.UpdateOrderStatusDao"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String ostatus=request.getParameter("oid1");
System.out.println("check1");
System.out.println(ostatus);
System.out.println("check2");
String oid=request.getParameter("oid");
String v=UpdateOrderStatusDao.updateOrderStatus(oid, ostatus);
if(v.equals("true")){
out.println("Order Status Changed Successfully!!!");
RequestDispatcher rd=request.getRequestDispatcher("generateReport.jsp");
rd.forward(request, response);
}
else{
out.println("Order Status Not Changed. Try Again!!!");
RequestDispatcher rd=request.getRequestDispatcher("generateReport.jsp");
rd.forward(request, response);

}
 %>
</body>
</html>