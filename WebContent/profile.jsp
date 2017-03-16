<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Login.User" %>
<%@ page import="com.Login.LogoutServlet" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%!
Connection myCon = null;
PreparedStatement mySmt = null;
ResultSet myRs = null;
String sql = null;
String email = null;
User user;
boolean checkuser=false;
public void setsql()
{
	sql="select * from users";
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
	mySmt = myCon.prepareStatement(sql + " where email=?");
	mySmt.setString(1, email);
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
email = request.getParameter("email");
if (email!=null && !(email.equals("")))
{
	setsql();
	createConnection();
	setupConnection();
}
else {
	response.sendRedirect("Login.jsp");
}
myRs.next();
%>
<title><%=myRs.getString(1) %>'s Profile</title>
<link rel="icon" href="images/tensbit.ico" type="image">
<link rel="stylesheet" type="text/css" href="css/style_profile.css" />
<script type="text/javascript">
	function valid()
	{
		{
		if(document.form1.textfield.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield.focus();
			return false;
		}
		if(document.form1.textfield8.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield8.focus();
			return false;
		}
		if(document.form1.textfield7.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield7.focus();
			return false;
		}
		if(document.form1.textfield2.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield2.focus();
			return false;
		}
		if(document.form1.textfield3.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield3.focus();
			return false;
		}
		if(document.form1.textfield4.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield4.focus();
			return false;
		}
		if(document.form1.textfield5.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield5.focus();
			return false;
		}
		if(document.form1.textfield6.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield6.focus();
			return false;
		}
		if(document.form1.textarea.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textarea.focus();
			return false;
		}
		}
		return true;
	}
</script>
</head>
<body>
<img src="images/home1.png" width="1340" height="660" class="fishes"/>
<form action="LogoutServlet">
<input type="submit" name="Submit2" value="Log out" class="kola2" /></form>
	<table width="489" height="176" id="headtable">
    <tr>
      <td width="481" height="147"><a href="home.jsp"><div align="center"><span id="head">tens</span><span id="head1">bit</span></div>
      </a></td>
    </tr>
    <tr>
      <td height="21"><div align="center"><span id="tagline">Your Trust Our Priority </span></div></td>
    </tr>
</table>
<img src="images/images.jpg" style="position:absolute; left: 166px; top: 499px; width: 141px; height: 123px;"/><img src="images/download.jpg" width="171" style="position:absolute; left: 166px; top: 220px; height: 127px; width: 141px;" /><img src="images/download.png" width="167" style="position:absolute; left: 166px; top: 366px; width: 141px; height: 113px;"/>
	<form id="form1" name="form1" method="get" action="Editprofile.jsp" onsubmit="return valid()">
	<table width="200" border="0" class="tab10">
      <tr class="tr10">
        <td height="46">First Name </td>
        <td>:</td>
        <td><%=myRs.getString(1) %></td>
      </tr>
      <tr class="tr10">
        <td width="130" height="46"> Last Name</td>
        <td width="10">:</td>
        <td width="308"><%=myRs.getString(2) %></td>
      </tr>
	  
      <tr class="tr10">
        <td height="55">Mobile</td>
        <td>:</td>
        <td><%=myRs.getString(4) %></td>
      </tr>
      <tr class="tr10">
        <td height="63"><p>Address</p>        </td>
        <td>:</td>
        <td><%=myRs.getString(5) %></td>
      </tr>
      <tr class="tr10">
        <td height="39">Email</td>
        <td>:</td>
        <td><%=myRs.getString(6) %></td>
      </tr>
      <tr class="tr10">
        <td height="49">City</td>
        <td>:</td>
        <td><%=myRs.getString(7) %></td>
      </tr>
      <tr class="tr10">
        <td height="52">State</td>
        <td>:</td>
        <td><%=myRs.getString(8) %></td>
      </tr>
      <tr class="tr10">
        <td>PIN code </td>
        <td>:</td>
        <td><%=myRs.getString(9) %></td>
      </tr>
</table>
<%
if (checkuser) {
user.setFirstName(myRs.getString(1));
user.setLastName(myRs.getString(2));
user.setPassword(myRs.getString(3));
user.setMobile(myRs.getString(4));
user.setAddress(myRs.getString(5));
user.setEmail(myRs.getString(6));
user.setCity(myRs.getString(7));
user.setState(myRs.getString(8));
user.setPinCode(myRs.getString(9));
session.setAttribute("user", user);
}
%>
<input type="submit" name="Submit" value="Edit Profile" class="kola"/>
</form><form name="shopform" action="home.jsp">
<input type="submit" name="Submit" value="Shop Now" class="kola3"/>
</form>
	<p class="tunamax" style="text-decoration:none; font-size:28px;">Hi <%=myRs.getString(1) %></p>
<%
mySmt.close();
myCon.close();
%>
</body>
</html>