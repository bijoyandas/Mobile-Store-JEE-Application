<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Login.LoginServlet" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%!
Connection myCon = null;
PreparedStatement mySmt = null;
%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
myCon = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bijoyan","admin");
mySmt = myCon.prepareStatement("delete from cart");
mySmt.executeUpdate();
mySmt.close();
myCon.close();
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>tensbit | Login</title>
<link rel="icon" href="images/tensbit.ico" type="image">
<link rel="stylesheet" type="text/css" href="css/style_login.css" />
<script type="text/javascript">
	function sign()
	{
		{
		if(document.form1.textfield.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield.focus();
			return false;
		}
		if(document.form1.textfield1.value=="")
		{
			alert("Please fill up all the fields");
			document.form1.textfield.focus();
			return false;
		}
		}
		return true;
	}
</script>
</head>
<body>

<img src="images/home1.png" width="1340" height="660" class="fishes"/>
			<table width="489" height="176" id="headtable">
    <tr>
      <td width="481" height="147"><a href="index.html"><div align="center"><span id="head">tens</span><span id="head1">bit</span></div>
      </a></td>
    </tr>
    <tr>
      <td height="21"><div align="center"><span id="tagline">Your Trust Our Priority </span></div></td>
    </tr>
</table>
<img src="images/images.jpg" style="position:absolute; left: 166px; top: 499px; width: 141px; height: 123px;"/><img src="images/download.jpg" width="171" style="position:absolute; left: 166px; top: 220px; height: 127px; width: 141px;" /><img src="images/download.png" width="167" style="position:absolute; left: 166px; top: 366px; width: 141px; height: 113px;"/>
		<form id="form1" name="form1" method="post" action="LoginServlet" onsubmit="return sign()">
		  <label>
		    <input type="submit" name="Submit" value="Sign in" class="but" />
	      </label>
		<table width="200" border="0" class="tuna1">
          <tr>
            <td height="63" style="text-decoration:underline; color:#663366;">SIGN IN </td>
          </tr>
</table>
		<table width="200" border="0" class="tuna">
          <tr>
            <td width="93" height="41">Email ID </td>
            <td width="8">:</td>
            <td width="355"> 
              <label>
                <input type="text" name="textfield" class="xing" />
              </label>
            </td>
          </tr>
          <tr>
            <td height="34" >Password</td>
            <td>:</td>
            <td>
			<label>
              <input type="password" size="20" name="textfield1" class="xing"/>
            </label>
			</td>
          </tr>
        </table>
		</form>
		<p class="mem"><a href="Signup.jsp" style="color:#330000;"> Not a member of tensbit yet? Sign up?</a></p>
</body>
</html>