package com.shopping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shopping.beans.*;

import com.shopping.dao.AdminDAO;
import com.shopping.dao.DeleteProductDAO;
import com.shopping.dao.LoginDAO;
import com.shopping.dao.UserProduct;
import com.shopping.service.CartService;
import com.shopping.service.OrderService;
import com.shopping.service.ProductService;
import com.shopping.service.RegisterService;
import com.shopping.service.UpdateService;
import com.shopping.util.DBUtil;

/**
 * Servlet implementation class ShoppingController
 */

public class ShoppingController extends HttpServlet {
	HttpSession sessionObj = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShoppingController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		RequestDispatcher rd;
		HttpSession session = req.getSession();

		// boolean flag = true;
		String cat = req.getParameter("category");
		res.setContentType("text/html");
		PrintWriter pw = res.getWriter();

		if (cat == null) {
			System.out.println("hello sir");
			if (sessionObj != null)
				sessionObj.invalidate();

			res.sendRedirect("home.jsp");

		}

		else if (cat.equals("logout")) {
			req.getSession().invalidate();
			res.sendRedirect("signout.jsp");
		}

		else if (cat.equals("adlogout")) {
			req.getSession().invalidate();
			res.sendRedirect(req.getContextPath() + "/home.jsp");
		}

		else if (cat.equals("insert")) {

			// System.out.println("session setting interval");
			session.setMaxInactiveInterval(3000);

			// 1. retrieving the User Input data
			String id = null;
			String name = req.getParameter("name");
			String addr = req.getParameter("addr");
			String phnumber = req.getParameter("contactno");
			String email = req.getParameter("email");
			String password = req.getParameter("passwd");
			String cpass = req.getParameter("confirmpasswd");

			if (password.equals(cpass)) {

				RegisterBean rb = new RegisterBean(id, name, addr, phnumber,
						email, password);

				boolean result = false;
				RegisterService rs = new RegisterService();
				// if(flag){
				result = rs.register(rb);

				if (result == true) {
					rd = req.getRequestDispatcher("insertsuccess.jsp");

					rd.forward(req, res);
				} else {
					rd = req.getRequestDispatcher("inserterror.jsp");

					rd.forward(req, res);
				}
			} else {
				res.sendRedirect("inserterror.jsp");
			}

		}

		else if (cat.equals("UserProductReq")) {
			UserProduct.prod.clear();
			UserProduct up = new UserProduct();
			up.fetchUserProduct();
			session.setAttribute("UserProductObj", up);
			rd = req.getRequestDispatcher("myProduct.jsp");
			rd.forward(req, res);
		}

		else if (cat.equals("login")) {
			String uemail = req.getParameter("useremail1");
			String upass = req.getParameter("userpassword1");
			session.setAttribute("useremail", uemail);
			session.setAttribute("userpassword", upass);
			String uname = null;
			String customer_id = null;
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			try {

				con = DBUtil.getDBCon();

				ps = con
						.prepareStatement("select customer_id,cust_name from customer1 where email_id=?");
				ps.setString(1, uemail);

				rs = ps.executeQuery();
				rs.next();
				customer_id = rs.getString(1);
				uname = rs.getString(2);
				session.setAttribute("username", uname);
				session.setAttribute("customer_id", customer_id);
				rs.close();
				ps.close();
				con.close();

			} catch (Exception e) {
				System.out.println(e);
			}finally{
				try {
					rs.close();
					ps.close();
					con.close();
				} catch (SQLException e) {}
			}
			if (session.getAttribute("useremail") == null) {
				res.sendRedirect("signout2.jsp");
			} else {
				session.setMaxInactiveInterval(3000);

				if (LoginDAO.validate(uemail, upass)) {
					rd = req.getRequestDispatcher("first.jsp");
					rd.forward(req, res);
				} else {
					pw.print("Sorry username or password error!!!");
					rd = req.getRequestDispatcher("login.jsp");
					rd.include(req, res);
				}

			}
		} else if (cat.equals("update")) {

			/*
			 * HttpSession session =req.getSession(false); if
			 * (session==null||session.isNew()) {
			 * res.sendRedirect("pageexpired.jsp"); } else{
			 */

			// System.out.println("session setting interval");
			session.setMaxInactiveInterval(3000);
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String addr = req.getParameter("textarea1");
			String contact = req.getParameter("contact");
			String mailId = req.getParameter("mail");
			String passwd = req.getParameter("passwd");

			UpdateService ups = new UpdateService();

			UserUpdate uu = new UserUpdate(id, name, addr, contact, mailId,
					passwd);

			boolean result = false;
			result = ups.update(uu);

			if (result) {
				pw.print("<script type=\"text/javascript\">");
				pw.print("alert('Product added')");
				pw.print("</script>");
				rd = req.getRequestDispatcher("first.jsp");
				rd.forward(req, res);
			} else {
				rd = req.getRequestDispatcher("inserterror.jsp");

				rd.forward(req, res);
			}
		}

		else if (cat.equals("adminlogin")) {
			session = req.getSession();
			String email = req.getParameter("adminemail1");
			String pass = req.getParameter("adminpassword1");
			session.setAttribute("adminemail", email);
			session.setAttribute("adminpassword", pass);
			try {

				Connection con = DBUtil.getDBCon();

				PreparedStatement ps = con
						.prepareStatement("select admin_id,admin_name from admin where email_id=?");
				ps.setString(1, email);

				ResultSet rs = ps.executeQuery();
				rs.next();
				String admin_id = rs.getString(1);
				String admin_name = rs.getString(2);
				session.setAttribute("admin_id", admin_id);
				session.setAttribute("admin_name", admin_name);

				rs.close();
				ps.close();
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}

			if (session.getAttribute("adminemail") == null) {

				res.sendRedirect("home.jsp");
			} else {

				// System.out.println("session setting interval");
				session.setMaxInactiveInterval(3000);

				if (AdminDAO.validate(email, pass)) {

					rd = req.getRequestDispatcher("adminpage.jsp");
					rd.forward(req, res);
				} else {

					pw.print("Invalid Credentials");
					rd = req.getRequestDispatcher("adminlogin.jsp");
					rd.include(req, res);
				}
			}
		}

		if (cat.equals("add")) {
			// 1. retrieving the User Input data

			session = req.getSession(false);
			if (session == null || session.isNew()) {
				res.sendRedirect("pageexpired.jsp");

			} else {

				// System.out.println("session setting interval");
				session.setMaxInactiveInterval(3000);
				String pid = req.getParameter("pid");
				String name = req.getParameter("name");
				String pcat = req.getParameter("prodcategory");
				String status = req.getParameter("status");
				String price = req.getParameter("price");
				String pdesc = req.getParameter("pdesc");

				ProductBean pb = new ProductBean(pid, name, pcat, status,
						price, pdesc);

				boolean result = false;
				ProductService ps = new ProductService();

				result = ps.add(pb);

				if (result) {
					// pw.print("<script type=\"text/javascript\">");
					// pw.print("alert('Product added')");
					// pw.print("</script>");
					pw.println("Product added SuccessFully");
					rd = req.getRequestDispatcher("adminpage.jsp");

					rd.forward(req, res);
				} else {
					// pw.print("<script type=\"text/javascript\">");
					// pw.print("alert('Product cannot be added.Try again')");
					// pw.print("</script>");
					pw.println("Product Not added!Try Again!!!");
					rd = req.getRequestDispatcher("adminpage.jsp");

					rd.forward(req, res);
				}
			}
		}

		else if (cat.equals("deleteproduct")) {
			// session =req.getSession(false);
			// if (session==null||session.isNew())
			// {
			// res.sendRedirect("pageexpired.jsp");
			// } else{

			// System.out.println("session setting interval");
			session.setMaxInactiveInterval(3000);
			String pid = req.getParameter("pid");

			if (DeleteProductDAO.delete(pid)) {
				pw.print("<script type=\"text/javascript\">");
				pw.print("alert('Product deleted')");
				pw.print("</script>");
				rd = req.getRequestDispatcher("adminpage.jsp");
				rd.include(req, res);

			} else {
				pw.print("<script type=\"text/javascript\">");
				pw.print("alert('Product cannot be deleted.Try again')");
				pw.print("</script>");
				rd = req.getRequestDispatcher("adminpage.jsp");
				rd.include(req, res);

			}
		}

		else if (cat.equals("userforgetpassword")) {
			// session =req.getSession(false);
			// if (session==null||session.isNew())
			// {
			// res.sendRedirect("pageexpired.jsp");
			// } else{

			// System.out.println("session setting interval");
			session.setMaxInactiveInterval(3000);
			String em = req.getParameter("em");
			String otp = req.getParameter("otp");
			if (otp.equals("1234")) {
				String pass = null;

				try {

					Connection con = DBUtil.getDBCon();

					PreparedStatement ps = con
							.prepareStatement("select password from customer1 where email_id=?");
					ps.setString(1, em);

					ResultSet rs = ps.executeQuery();
					if (rs.next()) {
						pw.println("Your password is " + rs.getString(1));
						pw.println("<HTML>");
						pw.println("<body>");
						pw.println("<form action=\"login.jsp\">");
						pw.println("<input type=\"submit\" value=\"Click here to login.\">");
						pw.println("</body>");
						pw.println("</HTML>");
						rs.close();
						ps.close();
						con.close();
					} else {
						pw.println("Email Not Registered");
						rs.close();
						ps.close();
						con.close();

					}

				} catch (Exception e) {
					System.out.println(e);
				}

			} else {
				pw.println("Wrong OTP");
			}

		}

		else if (cat.equals("updateproduct")) {

			// session = req.getSession(false);
			// if (session == null || session.isNew()) {
			// res.sendRedirect("pageexpired.jsp");
			// } else {

			// System.out.println("session setting interval");
			session.setMaxInactiveInterval(3000);
			String pid = req.getParameter("id");
			String pname = req.getParameter("name");
			String pcat = req.getParameter("prodcategory");
			String status = req.getParameter("status");
			String price = req.getParameter("price");
			String pdesc = req.getParameter("pdesc");
			System.out.println("check2");
			System.out.println(pdesc);

			ProductService ps = new ProductService();

			ProductBean pb = new ProductBean(pid, pname, pcat, status, price,
					pdesc);

			boolean result = false;

			result = ps.update(pb);

			if (result) {
				pw.print("<script type=\"text/javascript\">");
				pw.print("alert('Product updated')");
				pw.print("</script>");
				rd = req.getRequestDispatcher("adminpage.jsp");

				rd.include(req, res);
			} else {
				pw.print("<script type=\"text/javascript\">");
				pw.print("alert('Product not updated.Try again')");
				pw.print("</script>");
				rd = req.getRequestDispatcher("adminpage.jsp");

				rd.include(req, res);
			}

		} else if (cat.equals("pay")) {
			/*
			 * session =req.getSession(false); if
			 * (session==null||session.isNew()) {
			 * res.sendRedirect("pageexpired.jsp"); } else{
			 */

			// String id = req.getParameter("id");
			// String status= req.getParameter("status");
			String cid = (String) session.getAttribute("customer_id");
			String pid = req.getParameter("pid");
			String mode = req.getParameter("radios");

			OrderService os = new OrderService();

			OrderBean ob = new OrderBean(pid, mode, cid);
			boolean result = false;

			result = os.pay(ob);

			if (result) {
				// pw.print("<script type=\"text/javascript\">");
				// pw.print("alert(' Order placed successfully ')");
				// pw.print("</script>");
				pw.print("<h3>Order Placed Successfully</h3>");
				rd = req.getRequestDispatcher("first.jsp");

				rd.include(req, res);
			} else {
				// pw.print("<script type=\"text/javascript\">");
				// pw.print("alert('Order not placed.Try again')");
				// pw.print("</script>");
				pw.print("<h3>Order Not Placed Successfully!Try Again.</h3>");
				rd = req.getRequestDispatcher("first.jsp");

				rd.include(req, res);
			}
		}

		else if (cat.equals("addtocart")) {
			session = req.getSession(false);
			if (session == null || session.isNew()) {
				res.sendRedirect("pageexpired.jsp");
			} else {

				// System.out.println("session setting interval");
				session.setMaxInactiveInterval(3000);
				CartService shoppingCart;
				shoppingCart = (CartService) session.getAttribute("cart");
				if (shoppingCart == null) {
					shoppingCart = new CartService();
					session.setAttribute("cart", shoppingCart);
				}
				String name = req.getParameter("pname");
				Integer price = Integer.parseInt(req.getParameter("price"));
				shoppingCart.addToCart(name, price);
				session.setAttribute("cart", shoppingCart);
				try {
					PrintWriter out = res.getWriter();

					/*
					 * TODO output your page here. You may use following sample
					 * code.
					 */
					// out.println("<!DOCTYPE html>");
					out.println("<html>");
					out.println("<head>");
					out.println("<title>result</title>");
					out.println("</head>");
					out.println("<body>");
					out.println("<h1>Product successfully added to cart </h1>");
					out.println("<form action='first.jsp'>Add more products<input type='submit' value='go'></form>");
					out.println("<hr>");
					out.println("<h2>Cart</h2>");
					HashMap<String, Integer> items = shoppingCart
							.getCartItems();
					out.println("<table border='1px'>");

					/*
					 * for(String key: items.keySet()){
					 * out.println("<tr><td>"+key
					 * +" - </td><td>"+"INR"+items.get(key)+"</td></tr>"); }
					 */
					for (String key : items.keySet()) {
						out.println("<form action='sc'><input type='hidden' name='name' value='"
								+ key
								+ "'><tr><td>"
								+ key
								+ " - </td><td>"
								+ "INR"
								+ items.get(key)
								+ "</td><td><input type='submit' value='delete'><input type='hidden' value='deletecart' name='category'></td></tr></form>");
					}

					out.println("<table>");
					out.println("<form action='order.jsp'><input type='submit' value='Pay'><br><input type='hidden' value='pay' name='category'></form>");
					out.println("</body>");
					out.println("</html>");
					out.close();

				} catch (IOException e) {

				}

			}
		} else if (cat.equals("deletecart")) {
			session = req.getSession(false);
			if (session == null || session.isNew()) {
				res.sendRedirect("pageexpired.jsp");
			} else {

				// System.out.println("session setting interval");
				session.setMaxInactiveInterval(3000);
				CartService shoppingCart;
				shoppingCart = (CartService) session.getAttribute("cart");
				String name = req.getParameter("name");
				shoppingCart.deleteFromCart(name);
				session.setAttribute("cart", shoppingCart);
				shoppingCart = (CartService) session.getAttribute("cart");
				try {
					PrintWriter out = res.getWriter();

					/*
					 * TODO output your page here. You may use following sample
					 * code.
					 */
					out.println("<!DOCTYPE html>");
					out.println("<html>");
					out.println("<head>");
					out.println("<title>Servlet deleteItem</title>");
					out.println("</head>");
					out.println("<body>");
					HashMap<String, Integer> items = shoppingCart
							.getCartItems();
					out.println("<table border='1px'>");

					for (String key : items.keySet()) {
						out.println("<form action='order.jsp'><input type='hidden' name='name' value='"
								+ key
								+ "'><tr><td>"
								+ key
								+ " - </td><td>"
								+ "INR"
								+ items.get(key)
								+ "</td><td><input type='submit' value='delete'>"
								+ "<input type='hidden' value='deletecart' name='category'></td></tr></form>");
					}

					out.println("</table>");
					out.println("<form action='sc'><input type='submit' value='Pay'><br><input type='hidden' value='pay' name='category'></form>");
					out.println("</body>");
					out.println("</html>");
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}

			}

		}

	}
}
