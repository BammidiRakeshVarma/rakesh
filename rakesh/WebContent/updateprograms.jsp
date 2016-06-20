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
<form action=admin_program_update method="post">
Program Title:<br>
<input type="text" name="pname"><br><br>
Program:<br>
<textarea name="prog" style="width: 451px; height: 266px">${Program}</textarea><br><br>
<input type="radio" name="program" value="openmp">OpenMP<br><br>
<input type="radio" name="program" value="mpi" >MPI<br><br>
<button type="submit">Go</button>
</form>
</div>
        
      
</div>    
<%
}
%>