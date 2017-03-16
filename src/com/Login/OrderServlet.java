package com.Login;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection myCon = null;
	PreparedStatement mySmt = null;
	ResultSet myRs = null;
	User user;
	myorders orderObj;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			orderObj = (myorders)request.getSession().getAttribute("order");
			user = (User)request.getSession().getAttribute("user");
			Class.forName("oracle.jdbc.driver.OracleDriver");
			myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bijoyan","admin");
			mySmt = myCon.prepareStatement("insert into orders values(?,?,?,?,?,?,?)");
			mySmt.setString(1, orderObj.getOrderid());
			mySmt.setString(2, orderObj.getName());
			mySmt.setString(3, orderObj.getEmail());
			mySmt.setString(4, orderObj.getPrice());
			mySmt.setString(5, orderObj.getAddress());
			mySmt.setString(6, orderObj.getDdate());
			mySmt.setString(7, orderObj.getQty());
			mySmt.executeUpdate();
			mySmt = myCon.prepareStatement("delete from cart");
			mySmt.executeUpdate();
			mySmt.close();
			myCon.close();
			response.sendRedirect("thankyou.jsp");
			}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

}
