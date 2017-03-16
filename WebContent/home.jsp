<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*" %>
<%@ page import= "com.Login.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Best Deals on your Favorite Smart Phones</title>
<link rel="icon" href="images/tensbit.ico" type="image"/>
<link rel="stylesheet" type="text/css" href="css/main.css" />
</head>
<body>
<%! int j=1,k=1 ;%>
<%!
Connection myCon = null;
PreparedStatement mySmt = null,mySmt2=null;
ResultSet myRs = null;
String sql = "";
boolean check=false;
User user = null;
boolean checkuser = false;
public void setsql()
{
	sql="select * from mobiles";
}
public void createConnection() throws Exception {
	try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bijoyan","admin");

	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
}
public void setupConnection() throws Exception{
	try{
	mySmt = myCon.prepareStatement(sql+" order by id asc");
	myRs = mySmt.executeQuery();
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	}
}

%>
<%
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
mySmt2 = myCon.prepareStatement("select * from mobsearch");
myRs = mySmt2.executeQuery();
if (myRs.next()) 
{
mySmt2 = myCon.prepareStatement("delete from mobsearch");
mySmt2.executeUpdate();
}
setsql();
setupConnection();
session.setAttribute("statement", mySmt);
%>
<div id="header">
  <table width="489" height="176" id="headtable">
    <tr>
      <td width="481" height="147"><a href="home.jsp"><div align="center"><span id="head">tens</span><span id="head1">bit</span></div></a></td>
    </tr>
    <tr>
      <td height="21"><div align="center"><span id="tagline">Your Trust Our Priority </span></div></td>
    </tr>
  </table>
  
  <div align="right">
    <table width="418" id="taglist">
      <tr>
        <td width="25"><img src="images/tick.png" height="25px" width="25px"/></td>
        <td width="377"><div align="left">Phones from trusted brands </div></td>
      </tr>
      <tr>
        <td><img src="images/tick.png" height="25px" width="25px"/></td>
        <td>Best deals for your favourite smartphones </td>
      </tr>
      <tr>
        <td><img src="images/tick.png" height="25px" width="25px"/></td>
        <td>Monthly Discounts on selected brands </td>
      </tr>
      <tr>
        <td><img src="images/tick.png" height="25px" width="25px"/></td>
        <td>In a day delivery available </td>
      </tr>
      <tr>
        <td height="23"><img src="images/tick.png" height="25px" width="25px"/></td>
        <td>Cash on Delivery Available </td>
      </tr>
    </table>
  </div>
</div>
<div id="navbar" >
<div id="menu">
<ul>
<li>
<% if (!checkuser){ %><a href="Login.jsp">Login</a><%} %>
<% if (checkuser) { %><a>Hi <%=user.getFirstName() %></a>
<ul><li><a href="profile.jsp?email=<%=user.getEmail()%>">Profile</a></li>
<li><a href="LogoutServlet">Log Out</a></li>
</ul></li><%} %>
<li><a href="cart.jsp">Cart</a></li>
<li><a href="contact.jsp">Contact</a></li>
</ul>
</div>
<div>
		<form id="tfnewsearch" method="get" action="search.jsp">
		        <input type="text" class="tftextinput" name="q" size="21" maxlength="120"><input type="submit" value=">" class="tfbutton">
		</form>
	<div class="tfclear"></div>
  </div>
</div>
<div id="filter-wrapper">
<form name="filter-form" action="search.jsp" method="post">
&nbsp; Brand <select name="brand">
<option>All</option>
<option>Samsung</option>
<option>Apple</option>
<option>Lenovo</option>
<option>Microsoft</option>
<option>OnePlus</option>
<option>LeEco</option>
<option>Sony</option>
<option>Xiomi</option>
<option>Asus</option>
<option>Huawei</option>
</select>
&nbsp; Price <select name="price">
<option>All</option>
<option>Below 5000</option>
<option>5000 to 15000</option>
<option>15000 to 25000</option>
<option>25000 to 35000</option>
<option>35000 to 50000</option>
<option>Above 50000</option>
</select>
&nbsp; Type <select name="type">
<option>All</option>
<option>Smart Phones</option>
<option>Tablets</option>
</select>
&nbsp; OS <select name="os">
<option>All</option>
<option>Android</option>
<option>Windows</option>
<option>iOS</option>
</select>
<input type="submit" value="Filter" class="filt-button"/></form>
</div>
<div id="content-wrapper">
<form name="content" action="phones.jsp" method="post">
<table>
<% for(j=1;j<=2;j++){ %>
<tr class="mySlides">
<% for(k=1;(k<=3)&&myRs.next();k++) { %>
<td style="text-align:center"><a href="single.jsp?id=<%=myRs.getString(1) %>"><img src="<%=myRs.getString(4)%>" width="200px" height="350px"/></a><p style="text-align:center;font-family:verdana;font-size:16px;">
<span style="font-size:20px;"><%=myRs.getString(2) %></span><br /><%=myRs.getString(5) %><br /><%=myRs.getString("Type") %></p></td>
<% } %>
</tr>
<%}%>
</table>
<input type="submit" value="...View All..." class="tfbutton" style="margin-left:610px;margin-bottom:10px;">
</form>
</div>
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
<%

%>
</body>
</html>
