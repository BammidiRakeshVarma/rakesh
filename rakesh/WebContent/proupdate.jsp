<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
Connection con;
Statement st;
String s0=(String)session.getAttribute("userid");
String s1=request.getParameter("first_name");
String s2=request.getParameter("last_name");
String s3=request.getParameter("email");
String s5=request.getParameter("pass");
String s6=request.getParameter("city");
String s7=request.getParameter("phone");
try {
	Class.forName("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
     st = con.createStatement();
     st.executeUpdate("update members set first_name='"+s1+"',last_name='"+s2+"',email='"+s3+"',pass=md5('"+s5+"') where uname='"+s0+"' ");
     st.executeUpdate("update info set city='"+s6+"',phone='"+s7+"' where uname='"+s0+"'");
     response.sendRedirect("profile.jsp");
}
catch(ClassNotFoundException e){
	
}
catch(Exception ex){
	
}
%>
</body>
</html>