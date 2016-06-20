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
%><!doctype html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/dropdown.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OpenMP</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>;
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
<div id="sidebar">
<div style="position:relative;Top:45px;left:45px;">
<ul style="list-style-type:disc">
  <li>What is OpenMP?</li><br>
  <li>Goals of OpenMP</li><br>
  <li>OpenMP Programming Model
  <ul>
      <li>Shared Memory Model</li>
      <li>Thread Based Parallelism</li>
      <li>Explicit Parallelism</li>
      <li>Compiler Directive Based</li>
      <li>Fork - Join Model</li>
      </ul>
  </li><br>
  <li>Methods to create threads</li><br>
  <li>Some Basic Commands</li><br>
  <li>Synchronization Constructs</li><br>
  <li><a href="openmp_programs.jsp"><b>OpenMP Programs</b></a></li><br>
</ul>
</div>
</div>
<div id="content">
<p><b>What is OpenMP?</b><br>
An abbreviation for: Open Multi-Processing<br>
An Application Program Interface (API) that may be used to explicitly direct multi-threaded, shared memory parallelism<br>
Comprised of three primary API components:<br>
Compiler Directives<br>
Runtime Library Routines<br>
Environment Variables<br></p>

<p><b>Goals of OpenMP</b><br>
Standardization:<br>
Provide a standard among a variety of shared memory architectures/platforms<br>
Jointly defined and endorsed by a group of major computer hardware and software vendors
Lean and Mean:<br>
Establish a simple and limited set of directives for programming shared memory machines.<br>
Significant parallelism can be implemented by using just 3 or 4 directives.<br>
This goal is becoming less meaningful with each new release, apparently.<br>
Ease of Use:<br>
Provide capability to incrementally parallelize a serial program, unlike message-passing libraries which typically require an all or nothing approach<br>
Provide the capability to implement both coarse-grain and fine-grain parallelism<br>
Portability:<br>
The API is specified for C/C++ and Fortran<br>
Public forum for API and membership<br>
Most major platforms have been implemented including Unix/Linux platforms and Windows<br>
</p>

<p><b>OpenMP Programming Model</b><br>
Shared Memory Model:<br>
	OpenMP is designed for multi-processor/core, shared memory machines.<br>
Thread Based Parallelism:<br>
	OpenMP programs accomplish parallelism exclusively through the use of threads.<br>
A thread of execution is the smallest unit of processing that can be scheduled by an operating system. The idea of a subroutine that can be scheduled to run autonomously might help explain what a thread is.<br>
Threads exist within the resources of a single process. Without the process, they cease to exist.<br>
Typically, the number of threads match the number of machine processors/cores. However, the actual use of threads is up to the application.<br>
OpenMP is an explicit (not automatic) programming model, offering the programmer full control over parallelization.<br>
Parallelization can be as simple as taking a serial program and inserting compiler directive...<br>
Or as complex as inserting subroutines to set multiple levels of parallelism, locks and even nested locks.<br>
Compiler Directive Based:<br>
	Most OpenMP parallelism is specified through the use of compiler directives which are imbedded in C/C++ or Fortran source code.<br>
Fork - Join Model:<br>
	OpenMP uses the fork-join model of parallel execution:<br> 
All OpenMP programs begin as a single process: the master thread. The master thread executes sequentially until the first parallel region construct is encountered.
FORK: the master thread then creates a team of parallel threads.<br>
The statements in the program that are enclosed by the parallel region construct are then executed in parallel among the various team threads.<br>
JOIN: When the team threads complete the statements in the parallel region construct, they synchronize and terminate, leaving only the master thread.<br>
The number of parallel regions and the threads that comprise them are arbitrary.<br>
</p>
<p>
<b>Methods to create threads</b><br>
a)num_thread(num);<br>
b)omp_set_num_thread(num);<br>
c)export OMP_NUM_THREADS=4;<br>
</p>

<p>
<b>Some Basic Commands:</b><br>
OMP_SET_NUM_THREADS			Sets the number of threads that will be used in the next parallel region<br>
OMP_GET_NUM_THREADS			Returns the number of threads that are currently in the team executing the parallel region from which it is called<br>
OMP_GET_MAX_THREADS			Returns the maximum value that can be returned by a call to the OMP_GET_NUM_THREADS function<br>
OMP_GET_THREAD_NUM			Returns the thread number of the thread, within the team, making this call.<br>
OMP_GET_THREAD_LIMIT		Returns the maximum number of OpenMP threads available to a program<br>
OMP_GET_NUM_PROCS			Returns the number of processors that are available to the program<br>
</p>


<p>
<b>Synchronization Constructs</b>
The MASTER directive<br>
	The MASTER directive specifies a region that is to be executed only by the master thread of the team. All other threads on the team skip this section of code<br>
The SINGLE directive<br>
	a)The SINGLE directive specifies that the enclosed code is to be executed by only one thread in the team<br>
	b)May be useful when dealing with sections of code that are not thread safe (such as I/O)<br>
The CRITICAL directive<br>
	The CRITICAL directive specifies a region of code that must be executed by only one thread at a time<br>
	If a thread is currently executing inside a CRITICAL region and another thread reaches that<br>
	CRITICAL region and attempts to execute it, it will block until the first thread exits that CRITICAL region.<br>
</p>
</div>
</div>
</body>
</html>
<%
}
%>