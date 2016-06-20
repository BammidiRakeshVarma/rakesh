<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/dropdown.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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
        <title>Introduction to Parallel Computing</title>
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
    <div id="content">
    <p><b>Serial Computing:</b><br>
	Traditionally, software has been written for serial computation:<br>
	A problem is broken into a discrete series of instructions<br>
	Instructions are executed sequentially one after another<br>
	Executed on a single processor<br>
	Only one instruction may execute at any moment in time</p>
	<p><b>Parallel Computing:</b><br>
In the simplest sense, parallel computing is the simultaneous use of multiple compute resources to solve a computational problem<br>
A problem is broken into discrete parts that can be solved concurrently<br>
Each part is further broken down to a series of instructions<br>
Instructions from each part execute simultaneously on different processors<br>
An overall control/coordination mechanism is employed<br>
The computational problem should be able to:<br>
Be broken apart into discrete pieces of work that can be solved simultaneously;<br>
Execute multiple program instructions at any moment in time;<br>
Be solved in less time with multiple compute resources than with a single compute resource.<br>
The compute resources are typically:<br>
A single computer with multiple processors/core"s<br>"
An arbitrary number of such computers connected by a network</p>
<p>
<b>Why Use Parallel Computing?</b>
In the natural world, many complex, interrelated events are happening at the same time, yet within a
temporal sequence.
Compared to serial computing, parallel computing is much better suited for modeling, simulating and
understanding complex, real world phenomena.
<br><br>
Main Reasons:<br>
SAVE TIME AND/OR MONEY<br>
SOLVE LARGER / MORE COMPLEX PROBLEMS<br>
PROVIDE CONCURRENCY</p>
<p><b>Who is Using Parallel Computing?</b><br>
Science and Engineering<br>
Historically, parallel computing has been considered to be "the high end of computing", and has been used to
model difficult problems in many areas of science and engineering:<br>
Atmosphere, Earth, Environment<br>
Physics applied,nuclear, particle, condensed matter, high pressure, fusion, photonics<br>
Bioscience, Biotechnology, Genetics<br>
Chemistry, Molecular Sciences<br>
Geology, Seismology<br>
Mechanical Engineering from prosthetics to spacecraft<br>
Electrical Engineering, Circuit Design,Microelectronics<br>
Computer Science, Mathematics<br>
Defense, Weapon</p>
<p>Industrial and Commercial:
Today, commercial applications provide an equal or greater driving force in the development of faster
computers. These applications require the processing of large amounts of data in sophisticated ways. For
example:<br>
"Big Data", databases, data mining<br>
Oil exploration<br>
Web search engines, web based<br>
business services<br>
Medical imaging and diagnosis<br>
Financial and economic modeling<br>
</p>
</div>
<div id="sidebar">
<div style="position:relative;Top:45px;left:45px;">
<ul style="list-style-type:disc">
  <li>Serial Computating</li><br>
  <li>Parallel Computating</li><br>
  <li>Why Use Parallel Computing</li><br>
  <li>Who is Using Parallel Computing</li><br>
</ul>
</div>
</div>
</div>
</body>
</html>
<%
}
%>