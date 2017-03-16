package com.Login;
import java.sql.*;

public class LoginDAO {
	
	Connection myCon = null;
	PreparedStatement mySmt = null;
	ResultSet myRs = null;
	
	public boolean check(String email,String password)
	{
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bijoyan", "admin");
		mySmt = myCon.prepareStatement("select * from users where email=? and password=?");
		mySmt.setString(1, email);
		mySmt.setString(2, password);
		myRs = mySmt.executeQuery();
		if (myRs.next())
			{
			return true;
			}
		else {
			return false;
			}
		}
		catch(Exception e) {
			System.out.println(e.toString());
		}
	
		return false;
	}
	public User getUser() throws Exception
	{
		User user = new User();
		user.setFirstName(myRs.getString(1));
		user.setLastName(myRs.getString(2));
		user.setMobile(myRs.getString(4));
		user.setAddress(myRs.getString(5));
		user.setEmail(myRs.getString(6));
		user.setCity(myRs.getString(7));
		user.setState(myRs.getString(8));
		user.setPinCode(myRs.getString(9));
		user.setPassword(myRs.getString(3));
		mySmt.close();
		myCon.close();
		return user;
	}
}
