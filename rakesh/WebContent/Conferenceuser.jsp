<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
 <%
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader("Expires",0);
  %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
		<%response.sendRedirect("index.jsp");%>
<%} else {
%>
<!doctype html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/dropdown.css"/>
        <title>HomePage</title>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>;
		<script type="text/javascript">
		$(document).ready(function()
		{
			$(".account").click(function()
		{
			var X=$(this).attr('id');
			if(X==1)
		{
			$(".submenu").hide();
			$(this).attr('id', '0'); 
		}
		else
		{
		$(".submenu").show();
		$(this).attr('id', '1');
		}
		});
		//Mouse click on sub menu
		$(".submenu").mouseup(function()
		{
		return false
		});
		//Mouse click on my account link
		$(".account").mouseup(function()
		{
		return false
		});
		//Document Click
		$(document).mouseup(function()
		{
		$(".submenu").hide();
		$(".account").attr('id', '');
		});
		});
</script>
<script type="text/javascript">
function load(select)
{
	var xmlhttp;
	xmlhttp=new XMLHttpRequest();
	xmlhttp.onreadystatechange=function()
	{
		if((xmlhttp.readyState==4)&&(xmlhttp.status==200))
		{
				document.getElementById("content").innerHTML =xmlhttp.responseText;
				
		}
	}
	xmlhttp.open("GET","conferenceselect?conference="+select);
	xmlhttp.send();
}
</script>
    </head>
<body>
<div id="container">
<div id="header">
<span style="font-size: 2.5em;color:white;position:relative;top:50px;left:80px;"><a href="index.jsp"  style="color: #ffffff;text-decoration:none">SUPERCOMPUTING</a></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:500px;">Welcome  <%=session.getAttribute("userid")%></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:550px;"><a href="profile.jsp" style="color: #ffffff;text-decoration:none">Profile</a></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:600px;"><a href="logout.jsp" style="color: #ffffff;text-decoration:none">Logout</a></span>
</div>
</div>
<div id="sidebar">
<form action=conferenceselect>
<div style="position:relative;Top:45px;left:45px;">
<%
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select cid,name from conferences where startdate>=CURDATE()");
    while(rs.next()){
    	out.print("<input type='radio' name='conference' value='"+rs.getInt("cid")+"' onclick='load(this.value)'>"+rs.getString("name")+"<br><br>"); 
    }
%>
</div>
</form>
</div>
<div id="content">
</div>
</body>
</html>
<%
    }
%>
