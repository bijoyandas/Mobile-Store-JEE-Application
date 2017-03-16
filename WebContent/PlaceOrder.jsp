<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "com.Login.User" %>
<%@ page import= "java.sql.*" %>
<%@ page import = "com.Login.OrderServlet" %>
<%@ page import = "java.util.Date,java.util.Calendar,java.text.SimpleDateFormat" %>
<%@ page import = "com.Login.myorders" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm Order || Payments</title>
<link rel="icon" href="images/tensbit.ico" type="image">
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/style_pay.css" />
</head>
<body>
<form action="OrderServlet">
<%!
boolean checkuser = false;
User user;
Connection myCon = null;
PreparedStatement mySmt = null,mySmt2=null;
ResultSet myRs = null;
String orderid,name="",price,email,address,ddate,quantity;
int id = 0;
float p = 0;
int qty = 0;
String sql = null;
myorders orderObj;

public void createConnection() throws Exception
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bijoyan","admin");
}

public void setupConnection() throws Exception
{
	id=0;
	name="";
	p=0;
	qty=0;
	mySmt = myCon.prepareStatement("select * from orders");
	myRs = mySmt.executeQuery();
	while(myRs.next())
		id++;
	id++;
	orderid = id  + "";
	mySmt = myCon.prepareStatement("select * from cart");
	myRs = mySmt.executeQuery();
	while(myRs.next()){
		name+=myRs.getString(2)+", ";
		p+=Float.parseFloat(myRs.getString(5));
		qty++;
	}
	email = user.getEmail();
	address = user.getAddress() + ", "+ user.getCity()+": "+user.getPinCode()+", "+user.getState();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	Calendar c = Calendar.getInstance();
	c.setTime(new Date()); // Now use today date.
	c.add(Calendar.DATE, 3); // Adding 3 days
	ddate = sdf.format(c.getTime());
	price = p+"";
	quantity = qty + "";
	orderObj = new myorders();
	orderObj.setDdate(ddate);
	orderObj.setAddress(address);
	orderObj.setEmail(email);
	orderObj.setOrderid(orderid);
	orderObj.setName(name);
	orderObj.setQty(quantity);
	orderObj.setPrice(price);
}
%>
<%
qty = 0;
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);

if(session.getAttribute("token")==null)
    response.sendRedirect("Login.jsp");

if (session.getAttribute("token_user")!=null){
user = (User)session.getAttribute("user");
checkuser = true;
}

createConnection();
setupConnection();
session.setAttribute("order", orderObj);
%>
<div id="navbar">
<marquee style="color:#FFFFFF; padding-top:12px; font-family: 'Times New Roman', Times, serif; font-size:20px;">
SECURE PAYMENT&emsp;&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;ORIGINAL PRODUCTS&emsp;&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;FREE AND EASY RETURNS&emsp;&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;100% BUYER PROTECTION
</marquee>
</div>
<table width="489" height="176" id="headtable">
    <tr>
      <td width="481" height="147"><a href="home.jsp"><div align="center"><span id="head">tens</span><span id="head1">bit</span></div>
      </a></td>
    </tr>
    <tr>
      <td height="21"><div align="center"><span id="tagline">Your Trust Our Priority </span></div></td>
    </tr>
</table>
<div id="menu">
<ul>
<li>
<% if (!checkuser){ %><a href="Login.jsp">Login</a><%} %>
<% if (checkuser) { %><a>Hi <%=user.getFirstName() %></a>
<ul><li><a href="profile.jsp?email=<%=user.getEmail()%>">Profile</a></li>
<li><a href="LogoutServlet">Log Out</a></li>
</ul></li><%} %>
<li id="cart"><a href="cart.jsp">Cart</a></li>
<li><a href="contact.jsp">Contact</a></li>
</ul>
 </div>
 <table width="200" border="1" class="finish" style="margin-bottom:20px;border-color:#33CCFF;">
  <tr bgcolor="#0099FF" style="border-color:#33CCFF;">
   <%if (checkuser) {%> <td height="36" colspan="5" style="font-size:20px;">&nbsp;Thanks for choosing tensbit, <%=user.getFirstName() %></td><%} %>
  </tr>
  <tr bgcolor="#0099FF" style="border-color:#33CCFF;">
    <td height="52" colspan="5" style="font-size:20px;">&nbsp;Delivery Address : &nbsp;
      <label style="position:absolute; font-size:28px; height: 28px;">
   <input type="text" name="textfield" size="123px;" value="<%=address%>" style="margin-top:2px;font-size:18px;padding-top:5px;position:relative;bottom:5px;"/>
    </label></td>
  </tr>
  <tr bgcolor="#0099FF" style="border-color:#33CCFF;">
    <td height="53" colspan="5" style="font-family:verdana;font-size:24px; text-align:center; background-color:#FFFFFF; font-weight:bolder;">ORDER SUMMARY</td>
  </tr>
  <tr bgcolor="#0099FF" style="border=0;text-align:center">
  <td height="38" style="font-weight:bolder;width:20px;position:relative;">ORDERID</td>
    <td height="38" style="font-weight:bolder;">ITEMS</td>
    <td width="144" style="font-weight:bolder; padding-left:4px">QUANTITY</td>
    <td width="187" style="font-weight:bolder;">DELIVERY DATE </td>
    <td width="213" style=" font-weight:bolder;">TOTAL PRICE </td>
  </tr>
  <tr style="text-align:center;font-family:verdana;font-size:20px;">
    <td width="299"><%=orderid %></td>
    <td width="469" style="font-size:28px; font-weight:bolder; color:#000033;"><%=name %></td>
    <td><%=quantity %></td>
    <td><%=ddate %></td>
    <td><%=price %></td>
  </tr>
</table>

<table width="200" border="0" class="final">
  <tr>
    <td height="55" style="border-collapse:collapse; border-style:dotted; font-size:24px; background-color: #FF9933;font-weight:bolder;">YOUR PAYMENT WILL BE ONLY BY CASH ON DELIVERY </td>
  </tr>
  <tr>
    <td style="">
 <input type="submit" value="CONFIRM ORDER" class="fuzzy1"/>
    </td>
  </tr>
</table>
<div id="footer">
<table>
  <tr>
    <td width="33%">Copyright &copy; 2016 tensbit || All Rights Reserved</td>
    <td width="33%"><span style="font-family:verdana;font-size:20px;color:white;">Social :</span> <a id="facebook" href="http://www.facebook.com/tensbit" target="_blank">Facebook</a>&nbsp;<a id="twitter" href="http://www.twitter.com/tensbit" target="_blank">Twitter</a>
	&nbsp;<a id="gplus" href="http://www.plus.google.com/tensbit" target="_blank">Google+</a></td>
	<td width="33%"><span style="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:16px;">Policies : </span><a style="text-decoration:none;color:white;" href="security.html">Security</a>,&nbsp;
	<a style="text-decoration:none;color:white;" href="contact.jsp">24x7 Contact</a>,&nbsp;<a style="text-decoration:none;color:white;" href="uses.html">Terms of Use</a></td>
  </tr>
</table>
</div>
</form>
<%
mySmt.close();
myCon.close();
%>
</body>
</html>