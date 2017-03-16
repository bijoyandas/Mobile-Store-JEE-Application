<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.Login.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%!
User user;
%>
<%
user = (User)session.getAttribute("user");
%>
<title><%=user.getFirstName() %>'s Profile</title>
<link rel="icon" href="images/tensbit.ico" type="image">
<link rel="stylesheet" type="text/css" href="css/style_edit.css" />
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
	<form id="form1" name="form1" method="post" action="UpdateServlet" onsubmit="return valid()">
	<table width="200" border="0" class="tab10">
      <tr class="tr10">
        <td height="46">First Name </td>
        <td>:</td>
        <td><label>
          <input type="text" name="textfield8" style="font-size:18px" value="<%=user.getFirstName()%>"/>
          </label>
		</td>
      </tr>
      <tr class="tr10">
        <td width="130" height="46"> Last Name</td>
        <td width="10">:</td>
        <td width="308">
          <label>
          <input type="text" name="textfield" style="font-size:18px" value="<%=user.getLastName()%>"/>
          </label>       </td>
      </tr>
	  <tr class="tr10">
	  	<td>Password</td>
		<td>:</td>
		<td>
		<label>
		<input type="password" name="textfield7" style="font-size:18px" value="<%=user.getPassword()%>"/>
	  </label>	  </tr>
      <tr class="tr10">
        <td height="55">Mobile</td>
        <td>:</td>
        <td>
          <label>
            <input type="text" name="textfield2" style="font-size:18px" value="<%=user.getMobile()%>"/>
          </label>       </td>
      </tr>
      <tr class="tr10">
        <td height="103"><p>Address</p>        </td>
        <td>:</td>
        <td>
          <label></label>
          <textarea name="textarea" style="font-size:18px; height:80px"><%=user.getAddress()%></textarea>       </td>
      </tr>
      <tr class="tr10">
        <td>Email</td>
        <td>:</td>
        <td>
          <label>
            <input type="text" name="textfield3" style="font-size:18px" value="<%=user.getEmail()%>"/>
          </label>        </td>
      </tr>
      <tr class="tr10">
        <td>City</td>
        <td>:</td>
        <td>
          <label>
            <input type="text" name="textfield4" style="font-size:18px" value="<%=user.getCity()%>"/>
          </label>        </td>
      </tr>
      <tr class="tr10">
        <td height="31">State</td>
        <td>:</td>
        <td>
          <label>
            <input type="text" name="textfield5" style="font-size:18px" value="<%=user.getState()%>"/>
          </label>        </td>
      </tr>
      <tr class="tr10">
        <td>PIN code </td>
        <td>:</td>
        <td>
          <label>
            <input type="text" name="textfield6" style="font-size:18px" value="<%=user.getPinCode()%>"/>
          </label>        </td>
      </tr>
</table>
<input type="submit" name="Submit" value="Done" class="kola"/>
	</form>
	<p class="tunamax" style="text-decoration:none; font-size:28px;">Hi <%=user.getFirstName() %></p>
</body>
</html>