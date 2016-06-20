<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     <link rel="stylesheet" href="css/reset.css">
      <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in Page</title>
    </head>
    <body>
    <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
 <div class="container">
  <div class="login">
  	<h1 class="login-heading">
      <strong>Welcome.</strong> Please login.</h1>
      <form method="post" action=login>
        <input type="text"  placeholder="Username" required="required" class="input-txt" name="uname" value=""/>
          <input type="password" placeholder="Password" required="required" class="input-txt" name="pass" value="" />
          <div class="login-footer">
             <a href="reg.jsp" class="lnk">
              <span class="icon icon--min">ಠ╭╮ಠ</span> 
             Not yet Registered
            </a>
            <button type="submit" class="btn btn--right">Sign in  </button>
    
          </div>
      </form>
  </div>
</div>  
<script src="js/index.js"></script>
        <%}
    else {
    	
   			response.sendRedirect("topics.jsp");
   %>
<script src="js/index.js"></script>
    	<%
    	    }
    	%>	
    </body>
</html>