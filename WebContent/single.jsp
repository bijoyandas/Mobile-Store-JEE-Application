<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.Login.User" %>
<%@ page import = "com.Login.cartServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%!
Connection myCon = null;
PreparedStatement mySmt = null;
ResultSet myRs = null;
String sql = null;
String id = null;
boolean checkuser = false;
User user;
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
	mySmt = myCon.prepareStatement(sql+" where id=?");
	mySmt.setString(1, id);
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
id = (String) request.getParameter("id");
if (id!=null && !(id.equals("")))
{
	setsql();
	setupConnection();
	myRs.next();
}
else {
	response.sendRedirect("home.jsp");
}
%>
<title><%=myRs.getString(2)%></title>
<link rel="icon" href="images/tensbit.ico" type="image">
<link rel="stylesheet" type="text/css" href="css/style_mob.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript">
function vat()
{
	if(document.f.text.value=="")
	{
		alert("Please give the PIN number");
		document.f.text.focus();
		return flase;
	}
	else
		alert("The device is available at your location");
	return true;
}
</script>
</head>
<body>
<div id="navbar">
<marquee style="color:#FFFFFF; padding-top:12px; font-family: 'Times New Roman', Times, serif; font-size:20px;">
STAY HOME AND SHOP ONLINE&emsp;&emsp;&emsp;&emsp;&emsp; &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;YOUR TRUST OUR PRIORITY
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
  
  <div align="right"></div>
<div id="navbar" style="margin-top:200px;">
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
<div style="">
<table width="200" border="1" class="main" style="border-collapse:collapse; margin-left:30px;">
  <tr>
    <td width="469" rowspan="2" class="hello" id="hello1" style="text-align:center;font-size:28px; font-family:verdana; color:#330066;"><%=myRs.getString(2) %> </td>
    <td height="47" colspan="2" style="font-size:20px;text-align:center; background-color:#999999;">GENERAL FEATURES </td>
  </tr>
  <tr>
    <td width="220" height="44" class="hello" id="hello1">Brand</td>
    <td width="585" class="hello" id="hello1"><%=myRs.getString(24) %></td>
  </tr>
  <tr>
    <td rowspan="27" id="phoneimage"><img src="<%=myRs.getString(4)%>"/>
	<br>
	<br />
	<br />
	<hr><p style="font-size:32px; font-weight:bolder;text-align:center;">Price :  <%=myRs.getString(5) %> <hr><p> 
	<br>
	<p class="hello" style="color:#0033CC;">&nbsp;UPTO 25% DISCOUNT ON EXCHANGE</p>
<br>
	<p class="hello" style="color:#0033CC"> &nbsp;&nbsp;CHECK AVAILABILITY </p>
	<form name="f" method="post">
	<input name="text" type="text" style="position:relative; width: 254px; height: 34px;"/>
&emsp;
<input name="go" type="submit" style="width: 65px; height: 38px;" value="Go" onclick="return vat();"/>
</form>
<img src="images/free.jpg" width="720" height="380" style="text-align:center;position:relative; height: 376px; width: 294px;"/></td>
    <td height="42" class="hello" id="hello1">SIM</td>
    <td class="hello" id="hello1"><%=myRs.getString(6) %></td>
  </tr>
  <tr>
    <td height="42" class="hello" id="hello1">Model</td>
    <td class="hello" id="hello1"><%=myRs.getString(3) %></td>
  </tr>
  
  <tr class="hello">
    <td height="42" colspan="2" class="hello" id="hello1" style="text-align:center;background-color:#999999;">PLATFORM</td>
  </tr>
  <tr>
    <td height="42" class="hello" id="hello1">OS</td>
    <td class="hello" id="hello1"><%=myRs.getString(21) %></td>
  </tr>
   <tr>
    <td height="42" class="hello" id="hello1">Version</td>
    <td class="hello" id="hello1"><%=myRs.getString(28) %></td>
  </tr>
  <tr class="hello">
    <td height="42" id="hello1">Graphics</td>
    <td id="hello1"><%=myRs.getString(20) %></td>
  </tr>
  <tr class="hello">
    <td height="49" id="hello1">Processor</td>
    <td id="hello1"><%=myRs.getString(22) %></td>
  </tr>
  <tr class="hello">
    <td height="41" colspan="2" class="hello" id="hello1" style="text-align:center; background-color:#999999;">DISPLAY</td>
  </tr>
  <tr class="hello">
    <td height="48" id="hello1">Screen-size</td>
    <td id="hello1"><%=myRs.getString(17) %></td>
  </tr>
  <tr class="hello">
    <td height="48" id="hello1">Resolution</td>
    <td id="hello1"><%=myRs.getString(16) %></td>
  </tr>
  <tr class="hello">
    <td height="44" colspan="2" id="hello1" style="text-align:center; background-color:#999999;">MEMORY</td>
  </tr>
  <tr class="hello">
    <td height="42" id="hello1">RAM/ROM</td>
    <td id="hello1"><%=myRs.getString(19) %></td>
  </tr>
  <tr class="hello">
    <td height="44" colspan="2" id="hello1" style="text-align:center; background-color:#999999;">BATTERY</td>
  </tr>
  <tr class="hello">
    <td height="44" id="hello1">Battery Type </td>
    <td id="hello1"><%=myRs.getString(18) %></td>
  </tr>
  <tr class="hello">
    <td height="44" colspan="2" id="hello1" style="text-align:center; background-color:#999999;">CAMERA</td>
  </tr>
  <tr class="hello">
    <td height="44" id="hello1">Rear Camera </td>
    <td id="hello1"><%=myRs.getString(10) %></td>
  </tr>
  <tr class="hello">
    <td height="44" id="hello1">Front Camera </td>
    <td id="hello1"><%=myRs.getString(9) %></td>
  </tr>
  <tr class="hello">
    <td height="92" id="hello1">Primary Camera Features </td>
    <td id="hello1"><%=myRs.getString(11) %></td>
  </tr>
  <tr class="hello">
    <td height="44" colspan="2" id="hello1" style="text-align:center; background-color:#999999;">MULTIMEDIA</td>
  </tr>
  <tr class="hello">
    <td height="44" id="hello1">Video Player </td>
    <td id="hello1"><%=myRs.getString(7) %></td>
  </tr>
  <tr class="hello">
    <td height="44" id="hello1">Music Player </td>
    <td id="hello1"><%=myRs.getString(8) %></td>
  </tr>
  <tr class="hello">
    <td height="44" colspan="2" id="hello1" style="text-align:center; background-color:#999999;">INTERNET AND CONNECTIVITY </td>
  </tr>
  <tr class="hello">
    <td height="44" id="hello1">Network Type </td>
    <td id="hello1"><%=myRs.getString(12) %></td>
  </tr>
  <tr class="hello">
    <td height="44" id="hello1">Bluetooth</td>
    <td id="hello1"><%=myRs.getString(13) %></td>
  </tr>
  <tr class="hello">
    <td height="44" id="hello1">Wi-Fi</td>
    <td id="hello1"><%=myRs.getString(14) %></td>
  </tr>
  <tr class="hello">
    <td height="44" colspan="2" id="hello1" style="text-align:center; background-color:#999999;">WARRANTY</td>
  </tr>
  <tr class="hello">
    <td height="78" id="hello1">Warranty</td>
    <td id="hello1"><%=myRs.getString(23) %></td>
  </tr>
</table>
</div>
<div id="shop">
<a href="cartServlet?mobid=<%=myRs.getString(1)%>"><span class="tfbutton1">ADD TO CART</span></a>
<a href="cartServlet?mobid=<%=myRs.getString(1)%>"><span class="tfbutton2">BUY NOW</span></a>
</div>
<table width="200" border="0" class="last">
  <tr style="font-size:20px; color:white; font-family:Verdana, Arial, Helvetica, sans-serif;">
    <td>Copyright &copy; 2016 tensbit || All Rights Reserved</td>
    <td><span style="font-family:verdana;font-size:20px;color:white;">Social :</span> <a id="facebook" href="https://www.facebook.com/tensbit" target="_blank">Facebook</a>&nbsp;<a id="twitter" href="https://twitter.com/tensbit" target="_blank">Twitter</a> &nbsp;<a id="gplus" href="https://plus.google.com/109314910350677095096" target="_blank">Google+</a></td>
    <td><span style="font-family:Verdana, Arial, Helvetica, sans-serif;font-size:16px;">Policies : </span><a style="text-decoration:none;color:white;" href="security.html">Security</a>,&nbsp; <a style="text-decoration:none;color:white;" href="contact.jsp">24x7 Contact</a>,&nbsp;<a style="text-decoration:none;color:white;" href="uses.html">Terms of Use</a></td>
  </tr>
</table>
<br>
<br>
<%
mySmt.close();
myCon.close();
%>
</body>
</html>