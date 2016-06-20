<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader("Expires",0);
  %>
<%
if((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || (session.getAttribute("userid")!="admin")) {
%>
		<%response.sendRedirect("logout.jsp");%>
<%} else  {
%>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
        <link rel="stylesheet" type="text/css" href="css/dropdown.css"/>
		<div id="container">
		<div id="header">
		<span style="font-size: 2.5em;color:white;position:relative;top:50px;left:80px;"><a href="index.jsp"  style="color: #ffffff;text-decoration:none">SUPERCOMPUTING</a></span>
		<span style="font-size:1.0em;color:white;position:relative;top:50px;left:500px;">Welcome  <%=session.getAttribute("userid")%></span>
		<span style="font-size:1.0em;color:white;position:relative;top:50px;left:550px;"><a href="profile.jsp" style="color: #ffffff;text-decoration:none">Profile</a></span>
		<span style="font-size:1.0em;color:white;position:relative;top:50px;left:600px;"><a href="logout.jsp" style="color: #ffffff;text-decoration:none">Logout</a></span>
		</div>
		</div>
<div id="content">
	<form action=conferenceupdate method="post">
    Name of Event:<br>
	<input type="text" name="eventname"><br>
	Start Date:<br>
	<input type="text" name="startdate"><br>
	End Date:<br>
	<input type="text" name="enddate"><br>
	Location:<br>
	<input type="text" name="location"><br>
	Event Type:<br>
	<input type="text" name="eventtype"><br>
	Event Description:<br>
	<textarea name="desc"></textarea><br>
	Links:<br>
	<input type="text" name="link"><br>
	<input type="submit" value="Update">
	</form>
	</div>

<%
    }
%>
