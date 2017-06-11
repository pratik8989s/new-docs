<%@page
	import="weblogic.servlet.internal.PageFlowActionRuntimeMBeanImpl"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@page import="com.shopping.beans.*"%>
<%@page import="com.shopping.dao.AdminGenerateReportDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" type="text/css" href="common.css">
</head>
<body>
	<%
		//String name=(String)session.getAttribute("uname1");
		if (session.getAttribute("adminemail") == null) {
			response.sendRedirect("home.jsp");
		} else {
			AdminGenerateReportDao.AdminGenerateReport();
			ArrayList<AdminReportBean> report1 = AdminGenerateReportDao.report;
	%>
	<center>
		<h2>Products</h2>
	</center>
	<center>
		<table border=1>
			<tr>
				<th>Customer id</th>
				<th>Customer Name</th>
				<th>Customer Address</th>
				<th>Customer PhoneNo.</th>
				<th>Customer Email_ID</th>
				<th>Order id</th>
				<th>Order date</th>
				<th>payment mode</th>
				<th>Order Status</th>
				<th>Product id</th>
				<th>Product Name</th>
				<th>Product Category</th>
				<th>Product Status</th>
				<th>Product price</th>
				<th>Product Desc</th>
				<!--  <th>Update Order Status</th>-->




			</tr>
			<%
				for (int i = 0; i < (report1.size()); i++) {
			%>

			<tr>

				<td><%=report1.get(i).getCid()%></td>
				<td><%=report1.get(i).getName()%></td>
				<td><%=report1.get(i).getAddress()%></td>
				<td><%=report1.get(i).getPhNo()%></td>
				<td><%=report1.get(i).getEmailID()%></td>
				<td><%=report1.get(i).getOid()%></td>
				<td><%=report1.get(i).getDate()%></td>
				<td><%=report1.get(i).getMode()%></td>
				<td><%=report1.get(i).getOstat()%></td>


				<td><%=report1.get(i).getPid()%></td>
				<td><%=report1.get(i).getPname()%></td>
				<td><%=report1.get(i).getPcat()%></td>
				<td><%=report1.get(i).getPstatus()%></td>
				<td><%=report1.get(i).getPrice()%></td>
				<td><%=report1.get(i).getPdesc()%></td>
				<%--  <td><select NAME="OSTATUS">

						<option VALUE="PROGRESS">PROGRESS</option>
						<option VALUE="DISPATCHED">DISPATCHED</option>
				</select></td>



				<td><form action="UpdateOrderStatus.jsp">


						<input type="submit" value="Update Order Status"> <input
							type="hidden" name="oid" value=<%=report1.get(i).getOid()%>>

					</form></td>--%>




			</tr>
			<%
				}
				}
			%>
		</table>
		<br> <br> <br> <br> <a href="adminpage.jsp"
			class="button">Back to Admin page</a>
	</center>

</body>
</html>