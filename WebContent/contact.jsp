<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.Login.User" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>
<link rel="icon" href="images/tensbit.ico" type="image">
<link rel="stylesheet" type="text/css" href="css/style_contact.css" />
<script type="text/javascript">
function check()
{
if (document.f1.name.value==null || document.f1.name.value=="")
	{
	alert("Please enter your name!!");
	document.f1.name.focus();
	return false;
	}
else if (document.f1.email.value==null || document.f1.email.value=="")
{
alert("Please enter your email!!");
document.f1.email.focus();
return false;
}
else if (document.f1.type.value==null || document.f1.type.value=="")
{
alert("Please select your query type!!");
document.f1.type.focus();
return false;
}
else if (document.f1.message.value==null || document.f1.messag.value=="")
{
alert("Please enter your message!!");
document.f1.message.focus();
return false;
}
return true;
}
</script>
</head>
<body>
<%!
User user = null;
boolean checkuser = false;
Connection myCon = null;
PreparedStatement mySmt = null;
String sql = null;
String name,email,message,type;
ResultSet myRs = null;
int var;
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
public void setupConnection(String sql) throws Exception{
	try{
	mySmt = myCon.prepareStatement("select * from contacts");
	myRs = mySmt.executeQuery();
	while(myRs.next())
	{
		var++;
	}
	var++;
	mySmt = myCon.prepareStatement(sql);
	mySmt.setString(1, var+"");
	mySmt.setString(2, email);
	mySmt.setString(3, type);
	mySmt.setString(4, name);
	mySmt.setString(5, message);
	mySmt.executeUpdate();
	}
	catch(Exception e)
	{
		System.out.print(e.toString());
	}
}
%>
<%
var = 0;
boolean checkuser = false;
if (session.getAttribute("token_user")!=null){
user = (User)session.getAttribute("user");
checkuser = true;
}

name = request.getParameter("name");
message = request.getParameter("message");
email = request.getParameter("email");
type = request.getParameter("type");

if (name!=null)
{
	sql = "insert into contacts values(?,?,?,?,?)";
	createConnection();
	setupConnection(sql);
}
%>
<img src="images/home1.png" width="1340" height="660" class="fishes"/>
<table class="tuna">
      <tr>
        <th width="101">
			<div class="dropdown" >
				<%if (!checkuser) { %><span class="mama"><a href="Login.jsp" style="color: #330000; text-decoration: none;">LOGIN</a><% }%></span>
				<%if (checkuser) { %><p style="color: #330000; text-decoration: none;">Hi <%=user.getFirstName() %></p><% }%>
			</div>
		</th>
		<th width="12">     	
		<th width="10">
        <th width="155"><a href="home.jsp" style="color: #330000; text-decoration: none;" class="mama"> SHOP NOW</a></th>
</table>
	<table width="489" height="176" id="headtable">
    <tr>
      <td width="481" height="147"><a href="home.jsp"><div align="center"><span id="head">tens</span><span id="head1">bit</span></div>
      </a></td>
    </tr>
    <tr>
      <td height="21"><div align="center"><span id="tagline">Your Trust Our Priority </span></div></td>
    </tr>
</table>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&key=AIzaSyDgA5fKB0CtSL1_h-ILgDEMCV8U2RxZxVY"></script><div style="overflow:hidden;height:500px;width:600px;"><div id="gmap_canvas" style="height:430px;width:550px; left:45px; top:5px;"><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div></div><script type="text/javascript"> function init_map(){var myOptions = {zoom:14,center:new google.maps.LatLng(22.6037636,88.41425200000003),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById("gmap_canvas"), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(22.6037636, 88.41425200000003)});infowindow = new google.maps.InfoWindow({content:"<b>Tensbit</b><br/>VIP Road<br/>700055 Kolkata" });google.maps.event.addListener(marker, "click", function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>
    <form name="f1" action="contact.jsp" method="post" onsubmit="return check()">
    <table width="200" border="0" class="hehe">
      <%if(name!=null){ %><tr><td colspan="3" style="text-align:center;font-family:verdana;font-size:15px;"><b>Thank you <%=name %>. We will get back to you asap.</b></td></tr><%} %>
      <tr>
        <td width="138" height="69" class="super">Name</td>
        <td width="7">:</td>
        <td width="299">
          <input type="text" name="name" style="font-size:22px;" <%if(checkuser) {%>value="<%=user.getFirstName()+" "+user.getLastName()%>"; readonly<%} %>/></td>
      </tr>
      <tr>
        <td height="66" class="super">E-mail ID </td>
        <td> :	</td>
        <td>
          <input type="text" name="email" style="font-size:22px;" <%if(checkuser) {%>value="<%=user.getEmail()%>"; readonly<%} %>/></td>
      </tr>
      <tr>
        <td height="36" class="super">Query type </td>
        <td>:</td>
        <td><label>
          <select name="type" style="font-size:20px;">
		  <option value="Security">Delivery</option>
		  <option value="Security">Security</option>
		  <option value="Payment">Payment</option>
		  <option value="Offer">Offer</option>
		  <option value="Return">Return</option>
		  <option value="Other">Other</option>
          </select>
        </label></td>
      </tr>
      <tr>
        <td height="86" class="super">Message</td>
        <td>:</td>
        <td><label>
          <textarea name="message" style="font-size:22px;"></textarea>
        </label></td>
      </tr>
      <tr>
        <td colspan="3" class="super">&emsp;&emsp;&emsp;&emsp;&nbsp;*GIVE US A CALL*<hr/> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+91-9874090188<br/>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;+91-9674306480</td>
      </tr>
    </table>
    <label></label>
		<input type="submit" name="b1" value="SUBMIT" class="fishy" id="btn"/>
</form>
</body>
</html>