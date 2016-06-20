<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
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
<%
String s1=(String)session.getAttribute("userid");
%>
<div id="content">
<form action="proupdate.jsp" >
 <%
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
    Statement st = con.createStatement();
    Statement stt = con.createStatement();
    ResultSet r1=st.executeQuery("select first_name,last_name,email,uname,pass from members where uname='" +s1 + "'");
    ResultSet r2=stt.executeQuery("select city,phone from info where uname='" +s1 + "'");
    while(r1.next()){
    	out.print(""
    	+ "<strong>First name:</strong><br> <input type='text' name='first_name' value='"+r1.getString("first_name")+"' ><br><br>"
    			
    	+"<strong>Last name :</strong><br> <input type='text' name='last_name' value='"+r1.getString("last_name")+"' ><br><br>"
    
    	+"<strong>Email     :</strong><br> <input type='text' name='email' value='"+r1.getString("email")+"' ><br><br>"
    	
    	+"<strong>User Name :</strong><br> <input type='text' name='uname' value='"+r1.getString("uname")+"' ><br><br>"
    	
    	+"<strong>Password  :</strong><br> <input type='password' name='pass' value='"+r1.getString("pass")+"'><br><br>"
    	+"");
    }
    while(r2.next()){
    	out.print("<strong>City  :</strong><br> <input type='text' name='city' value='"+r2.getString("city")+"'><br><br>"

		+"<strong>Phone  :</strong><br> <input type='text' name='phone' value='"+r2.getString("phone")+"'><br><br>"
    	+"");	
    }
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}catch(Exception ex){
	ex.printStackTrace();
}		

%>
<input type="submit" name="up" value="update" >
</form>
</div>

</body>
</html>