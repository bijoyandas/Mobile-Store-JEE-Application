package com.Login;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection myCon = null;
	PreparedStatement mySmt = null;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bijoyan","admin");
			mySmt = myCon.prepareStatement("delete from cart");
			mySmt.executeUpdate();
			mySmt.close();
			myCon.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().removeAttribute("user");
		request.getSession().invalidate();
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Expires", "0");
		response.setDateHeader("Expires", -1);
		response.sendRedirect("Login.jsp");
	}

}
