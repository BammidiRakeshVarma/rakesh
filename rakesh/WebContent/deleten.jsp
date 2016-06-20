<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String ch=request.getParameter("pr");
Connection con;
Statement st;
if(ch.equals("openmp"))
{
	String s1=request.getParameter("na");
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
	st = (Statement) con.createStatement();
	String sql="DELETE FROM `openmp` WHERE `progname`='" + s1 +"'";
	st.executeUpdate(sql);
	response.sendRedirect("deleteprogram.jsp");
	}
	catch(ClassNotFoundException e)
	{
		e.printStackTrace();
	}
	catch(Exception ex)
	{
		ex.printStackTrace();
	}
	
}
else if(ch.equals("mpi"))
{		String s=request.getParameter("na");
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/rakesh","root", "Vamsy");
		st = (Statement) con.createStatement();
		st.executeUpdate("DELETE FROM `mpi` WHERE `mprogname`='" +s+"'");
		response.sendRedirect("deleteprogram.jsp");
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
	
}


%>
</body>
</html>