<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader("Expires",0);
  %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
 <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo" >
			<h1><a href="#">SUPERCOMPUTING</a></h1>
		</div>
		<div id="menu" >
			<ul>
				<li><a href="#" accesskey="1" title="">Homepage</a></li>
				<li><a href="#random" accesskey="2" title="">About Us</a></li>
				<li><a href="signin.jsp" accesskey="3" title="">Sign In</a></li>
				<li><a href="reg.jsp" accesskey="4" title="">Sign Up</a></li>
				<li><a href="#random" accesskey="5" title="">Contact Us</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="wrapper2">
	<div id="welcome" class="container">
		<div class="title"  >
			<h2>Welcome to our website</h2>
		</div>
		<p>This is a platform to learn about <strong>High Perforamnce Computing(HPC) </strong>, it covers all the major topics related to HPC.The user will get brief knowledge of HPC by completing all the topics present in the website. We have also provided programs on OpenMP and MPI. So just Sign Up and get ready to learn about HPC.
	</div>
</div>
<div id="wrapper3">
<div id="three-column" class="container">
	<div><span class="arrow-down"></span></div>
	<div id="tbox1">
		<div class="title">
			<h2>HPC</h2>
		</div>
		<p>The term HPC refers to any computational activity requiring more than a single computer to execute a task.</p>
		<a href="#" class="button">Learn More</a> </div>
	<div id="tbox2">
		<div class="title">
			<h2>Conferences</h2>
		</div>
		<p> This section updates about the latest conferences and meetings worldwide conducted by various organisations.</p>
		<a href="#" class="button">Learn More</a> </div>
	<div id="tbox3"> 
		<div class="title">
			<h2>Compilers</h2>
		</div>
		<p>This section updates about the latest compilers and technologies which are being used by developers.</p>
		<a href="#" class="button">Learn More</a> </div>
</div>	<div id="portfolio" class="container">
		<div class="title">
			<h2>Other Contents</h2>
			<span class="byline"></span> </div>
		<div class="column1">
			<div class="box"> 
				<h3>Architecture</h3>
				<p>This section illustrates about the memory architectures in HPC</p>
				<a href="#" class="button button-small">Learn More</a> </div>
		</div>
		<div class="column2">
			<div class="box">
				<h3>Computing</h3>
				<p>This section gives information about Serial and Parallel Computing</p>
				<a href="#" class="button button-small">Learn More</a> </div>
		</div>
		<div class="column3">
			<div class="box">
				<h3>Programming</h3>
				<p>Programming languages OpenMP and MPI are explained under this section</p>
				<a href="#" class="button button-small">Learn More</a> </div>
		</div>
		<div class="column4">
			<div class="box">
				<h3>Profiling</h3>
				<p>This section gives techniques to improve the efficiency of code</p>
				<a href="#" class="button button-small">Learn More</a> </div>
		</div>
	</div>
</div>

<div id="random">
<div id="three-column" style="height:200px;">
	<div id="tbox1" style="position:relative;top:-80px;left:100px;">
		<div class="title">
			<h2>About Us</h2>
		</div>
		<p style="position:relative;top:-35px;">This website is developed by <strong>Akash Gupta</strong> and <strong>Rakesh Varma Bammidi</strong> from NIT Silchar under the guidance of <strong>Vishal Sir</strong> CDAC Pune</p>
		</div>
	<div id="tbox2" style="position:relative;top:-80px;left:300px;">
		<div class="title">
			<h2>Contact Us</h2>
		</div>
		<p style="position:relative;top:-35px;"><Strong>Email:</strong><br>akash.gupta4237@gmail.com<br>rakeshvarmabammidi@gmail.com</p>
	 </div>
</div>
<%}
  
    else {%>
    	
    	<div id="header-wrapper">
    	<div id="header" class="container">
    		<div id="logo" >
    			<h1><a href="#">SUPERCOMPUTING</a></h1>
    		</div>
    		<div id="menu" >
    			<ul>
    				<li><a href="#" accesskey="1" title="">Homepage</a></li>
    				<li><a href="#random" accesskey="2" title="">About Us</a></li>
    				<li><a href="logout.jsp" accesskey="3" title="">Log Out</a></li>
    				<li><a href="#random" accesskey="5" title="">Contact Us</a></li>
    			</ul>
    		</div>
    	</div>
    </div>
    <div id="wrapper2">
    	<div id="welcome" class="container">
    		<div class="title"  >
    			<h2>Welcome to our website</h2>
    		</div>
    		<p>This is a platform to learn about <strong>High Perforamnce Computing(HPC) </strong>, it covers all the major topics related to HPC.The user will get brief knowledge of HPC by completing all the topics present in the website. We have also provided programs on OpenMP and MPI. So just Sign Up and get ready to learn about HPC.
    	</div>
    </div>
    <div id="wrapper3">
    <div id="three-column" class="container">
    	<div><span class="arrow-down"></span></div>
    	<div id="tbox1">
    		<div class="title">
    			<h2>HPC</h2>
    		</div>
    		<p>The term HPC refers to any computational activity requiring more than a single computer to execute a task.</p>
    		<a href="#" class="button">Learn More</a> </div>
    	<div id="tbox2">
    		<div class="title">
    			<h2>Conferences</h2>
    		</div>
    		<p> This section updates about the latest conferences and meetings worldwide conducted by various organisations.</p>
    		<a href="#" class="button">Learn More</a> </div>
    	<div id="tbox3"> 
    		<div class="title">
    			<h2>Compilers</h2>
    		</div>
    		<p>This section updates about the latest compilers and technologies which are being used by developers.</p>
    		<a href="#" class="button">Learn More</a> </div>
    </div>	<div id="portfolio" class="container">
    		<div class="title">
    			<h2>Other Contents</h2>
    			<span class="byline"></span> </div>
    		<div class="column1">
    			<div class="box"> 
    				<h3>Architecture</h3>
    				<p>This section illustrates about the memory architectures in HPC</p>
    				<a href="#" class="button button-small">Learn More</a> </div>
    		</div>
    		<div class="column2">
    			<div class="box">
    				<h3>Computing</h3>
    				<p>This section gives information about Serial and Parallel Computing</p>
    				<a href="#" class="button button-small">Learn More</a> </div>
    		</div>
    		<div class="column3">
    			<div class="box">
    				<h3>Programming</h3>
    				<p>Programming languages OpenMP and MPI are explained under this section</p>
    				<a href="#" class="button button-small">Learn More</a> </div>
    		</div>
    		<div class="column4">
    			<div class="box">
    				<h3>Profiling</h3>
    				<p>This section gives techniques to improve the efficiency of code</p>
    				<a href="#" class="button button-small">Learn More</a> </div>
    		</div>
    	</div>
    </div>

    <div id="random">
    <div id="three-column" style="height:200px;">
    	<div id="tbox1" style="position:relative;top:-80px;left:100px;">
    		<div class="title">
    			<h2>About Us</h2>
    		</div>
    		<p style="position:relative;top:-35px;">This website is developed by <strong>Akash Gupta</strong> and <strong>Rakesh Varma Bammidi</strong> from NIT Silchar under the guidance of <strong>Vishal Sir</strong> CDAC Pune</p>
    		</div>
    	<div id="tbox2" style="position:relative;top:-80px;left:300px;">
    		<div class="title">
    			<h2>Contact Us</h2>
    		</div>
    		<p style="position:relative;top:-35px;"><Strong>Email:</strong><br>akash.gupta4237@gmail.com<br>rakeshvarmabammidi@gmail.com</p>
    	 </div>
    </div>
    <%	
    }
   %>
   
   
   
   
</body>
</html>
