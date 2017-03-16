package com.Login;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
		Connection myCon= null;
		PreparedStatement mySmt = null,mySmt2=null;
		ResultSet myRs = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mobileid = request.getParameter("mobid");
		String id;
		int var =0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bijoyan","admin");
			mySmt = myCon.prepareStatement("select * from cart");
			myRs = mySmt.executeQuery();
			while(myRs.next()) {
				var++;
			}
			id = (var + 1)+"";
			mySmt2 = myCon.prepareStatement("select * from mobiles where id=?");
			mySmt2.setString(1, mobileid);
			myRs = mySmt2.executeQuery();
			myRs.next();
			mySmt = myCon.prepareStatement("insert into cart values(?,?,?,?,?)");
			mySmt.setString(1, id);
			mySmt.setString(2, myRs.getString(2));
			mySmt.setString(3, myRs.getString(4));
			mySmt.setString(4, myRs.getString(1));
			mySmt.setString(5, myRs.getString(5));
			mySmt.executeUpdate();
			mySmt2.close();
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
