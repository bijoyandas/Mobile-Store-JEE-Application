package com.Login;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteCart")
public class deleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection myCon = null;
	PreparedStatement mySmt = null;
	ResultSet myRs = null;
	String last = null;
	int id;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			id = 0;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bijoyan","admin");
			mySmt = myCon.prepareStatement("select * from cart");
			myRs = mySmt.executeQuery();
			while(myRs.next())
			{
				id++;
			}
			last = id+"";
			mySmt = myCon.prepareStatement("delete from cart where orderid=?");
			mySmt.setString(1, last);
			mySmt.executeUpdate();
			mySmt.close();
			myCon.close();
			response.sendRedirect("cart.jsp");
			}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}

}
