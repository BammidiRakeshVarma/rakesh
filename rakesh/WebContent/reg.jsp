<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader("Expires",0);
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration form </title>
        <link rel="stylesheet" href="css/reset.css">
        <link rel="stylesheet" href="css/style.css">
    <script src="ra.js">
         </script>
    </head>
    <body>
        <div class="container">
  <div class="login">
  	<h1 class="login-heading">
      <strong>Welcome.</strong> Please Register.</h1>
     <form method="post" action=registration>
     <input type="text" placeholder="FirstName" required="required" class="input-txt" name="fname" value="" onblur="fnamecheck(this.value) "/>
		  <div id="fname"></div>
		  <input type="text" placeholder="LastName" required="required" class="input-txt" name="lname" value="" onblur="lnamecheck(this.value) "/>
		  <div id="lname"></div>
		  <input type="text"  placeholder="Username" required="required" class="input-txt" name="uname" value=""onblur="unamecheck(this.value) "/>
		  <div id="unameu"></div>
          <input type="password" placeholder="Password" required="required" class="input-txt" name="pass" value="" onblur="passlen(this.value) "/>
		  <div id="passw"></div>
		  <input type="text" placeholder="Email" required="required" class="input-txt" name="email" value="" onblur="emailcheck(this.value) "/>
		  <div id="emailc"></div>
		  <input type="text" placeholder="City" required="required" class="input-txt" name="city" value="" onblur="cnamecheck(this.value) "/>
		  <div id="cname"></div>
		  <input type="text" placeholder="Phone" required="required" class="input-txt" name="phone" value="" onblur="phonecheck(this.value) "/>
		  <div id="phone"></div>
          <div class="login-footer">
          <button type="submit" class="btn btn--right">Sign up </button>
          </div>
      </form>
  </div>
</div>
        <script src="js/index.js"></script>
    </body>
</html>