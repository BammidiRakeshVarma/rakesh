<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  	<%@ page import="java.sql.*" %>
  	<%
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader("Expires",0);
  %>
<%
if((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "") || (session.getAttribute("userid")!="admin")) {
%>
<%response.sendRedirect("logout.jsp");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<title>Delete Program</title>
</head>
<body>
<%} else  {
%>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<div id="container">
<div id="header">
<span style="font-size: 2.5em;color:white;position:relative;top:50px;left:80px;"><a href="index.jsp"  style="color: #ffffff;text-decoration:none">SUPERCOMPUTING</a></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:500px;">Welcome  <%=session.getAttribute("userid")%></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:550px;"><a href="profile.jsp" style="color: #ffffff;text-decoration:none">Profile</a></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:600px;"><a href="logout.jsp" style="color: #ffffff;text-decoration:none">Logout</a></span>
</div>
</div>

<div id="sidebaro">
		
		<div style="position:relative;Top:45px;left:45px;">
<%
	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
    Statement st = con.createStatement();
    ResultSet rs=st.executeQuery("select id,progname from openmp");
    %><strong>OpenMP Programs</strong><br><br>
    <% 
    while(rs.next()){
    	out.print(rs.getString("progname")+"<br><br>"); 
    			}
%>
			</div>
		
</div>
<div id="sidebarm">
	
		<div style="position:relative;Top:45px;left:45px;">
<%
	Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
    Statement stt = conn.createStatement();
    ResultSet rss=st.executeQuery("select mid,mprogname from mpi");%>

	<strong>MPI Programs</strong><br><br>

<%
    while(rss.next()){
    	out.print(rss.getString("mprogname")+"<br><br>"); 
    			}
%>
			</div>
		
</div>
<form action="deleten.jsp">
<div id="delete">
Enter name of the program you want to delete:<br>
<input type="text" name="na"><br><br>
<input type="radio" name="pr" value="openmp">OpenMP<br><br>
<input type="radio" name="pr" value="mpi" >MPI<br><br>
<button type="submit">Go</button>
</div>
</form>
<%
}
%>
</body>
</html>