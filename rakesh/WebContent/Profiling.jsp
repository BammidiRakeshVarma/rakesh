<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader("Expires",0);
 %>
<%
    if((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
<%response.sendRedirect("index.jsp");%>
<%} else {
%>
<!doctype html>
<head>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/dropdown.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Profiling</title>
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
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:550px;">Profile</span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:600px;"><a href="logout.jsp" style="color: #ffffff;text-decoration:none">Logout</a></span>
</div>
</div>
<div id="sidebar">
<div style="position:relative;Top:45px;left:45px;">
<ul style="list-style-type:disc">
  <li>The Problem</li><br>
  <li>Extreme Optimization Pitfalls</li><br>
  <li>The Benchmark</li><br>
  <li>Attributes of good benchmark</li><br>
  <li>How to find performance bottlenecks</li><br>
  <li>Performance Tools Overview</li><br>
  <li>Using Optimizing Compilers</li><br>
  <li>Profilers
  <ul>
  <li>GNU gprof</li>
  <li>Using gprof GNU profiler</li>
  <li>Understanding Flat Profile</li>
  <li>How gprof works</li>
  </ul><br>
  <li>Vtune Profiler</li><br>
  </li>
</ul>
</div>
</div>
<div id="content">
<p><b>The Problem</b><br>
        PC speed increased 500 times since 1981, but today’s software is more complex and still hungry for more resources<br>
        How to run faster on same hardware and OS architecture?<br>
        Highly optimized applications run tens times faster than poorly written ones.<br>
        Using efficient algorithms and well-designed implementations  leads to high performance applications</p>

<p><b>Extreme Optimization Pitfalls</b><br>
        Large application’s performance cannot be improved before it runs<br>
        Build the application then see what machine it runs on<br>
        Runs great on my computer…<br>
        Debug versus release builds<br>
        Performance requires assembly language programming<br>
        Code features first then optimize if there is time leftover<br>
        Note:Software optimization doesn’t begin where coding ends –
        It is ongoing process that starts at design stage and continues all the way through development
</p>
<p><b>The Benchmark</b>
    The benchmark is program that used to:<br>
        Objectively evaluate performance of an application<br>
        Provide repeatable application behavior for use with performance analysis tools<br>
    Industry standard benchmarks:<br>
      TPC-C 3D-Winbench <br>
      http://www.specbench.com/<br> 
      Enterprise Services <br>
      Graphics/Applications <br>
      HPC/OMP <br>
      Java Client/Server<br> 
      Mail Servers <br>
      Network File System<br> 
      Web Servers<br></p>
<p><b>Attributes of good benchmark</b><br>
    Repeatable (consistent measurements)<br>
      Remember system tasks , caching issues<br>
      “incoming fax” problem : use minimum performance number<br>
    Representative<br>
      Execution of typical code path, mimic how customer uses the application<br>
      Poor benchmarks : Using QA tests <br>
    Easy to run<br>
    Verifiable <br>
      need QA for benchmark!
    Measure Elapsed Time vs. other number
    Use benchmark to test functionality
      Algorithmic tricks to gain performance may break the application…
      </p>
<p><b>How to find performance bottlenecks</b><br>
    Determine how your system resources, such as memory and processor, are being utilized to identify system-level bottlenecks<br>
    Measure the execution time for each module and function in your application<br>
    Determine how the various modules running on your system affect the performance of each other<br>
    Identify the most time-consuming function calls and call sequences within your application<br>
    Determine how your application is executing at the processor level to identify microarchitecture-level performance problems<br>
</p><p><b>Performance Tools Overview</b>
    Timing mechanisms<br>
      Stopwatch : UNIX time tool<br>
    Optimizing compiler (easy way)
    System load monitors<br>
      vmstat , iostat , perfmon.exe, Vtune Counter
    Software profiler<br>
      Gprof, VTune, Visual C++ Profiler, IBM Quantify
    Memory debugger/profiler<br>
      Valgrind , IBM Purify, Parasoft Insure++
</p>

<p><b>Using Optimizing Compilers</b><br>
    Always use compiler optimization settings to build an application for use with performance tools
    Understanding and using all the features of an optimizing compiler is required for maximum performance with the least effort

<br>Optimizing Compilers: Conclusions<br>
    Some processor-specific options still do not appear to be a major factor in producing fast code
    More optimizations do not guarantee faster code
    Different algorithms are most effective with different optimizations
    Idea : using statistics gathered by profiler as input for compiler/linker

</p>
<p><b>Profilers</b>
    Profiler may show time elapsed in each function and its descendants number of calls , call-graph (some)
    Profilers use  either instrumentation or sampling to identify performance issues<br>
    </p>
GNU gprof<br>
    Instrumenting profiler for every UNIX-like system<br>
<b>Using gprof GNU profiler</b><br>
    Compile and link your program with profiling enabled<br>
      cc -g -c myprog.c utils.c -pg <br>
      cc -o myprog myprog.o utils.o -pg <br>
    Execute your program to generate a profile data file<br>
      Program will run normally (but slower) and will write the profile data into a file called gmon.out just before exiting<br>
      Program should exit using exit() function<br>
    Run gprof to analyze the profile data<br>
      gprof a.out<br>

<b>Understanding Flat Profile</b>
    The flat profile shows the total amount of time your program spent executing each function.<br> 
    If a function was not compiled for profiling, and didn't run long enough to show up on the program counter histogram, it will be indistinguishable from a function that was never called<br><br>
<b>How gprof works</b>
    Instruments program to count calls<br>
    Watches the program running, samples the PC every 0.01 sec<br>
      Statistical inaccuracy :  fast function may take 0 or 1 samples<br>
      Run should be long enough comparing with sampling period<br>
      Combine several gmon.out files into single report<br>
    The output from gprof gives no indication of parts of your program that are limited by I/O or swapping bandwidth. This is because samples of the program counter are taken at fixed intervals of run time<br>
    number-of-calls figures are derived by counting, not sampling. They are completely accurate and will not vary from run to run if your program is deterministic 
    Profiling with inlining and other optimizations needs care<br><br>

<b>VTune performance analyzer</b><br>
    To squeeze every bit of power out of Intel architecture !<br>
<b>VTune Modes/Features</b><br>
    Time- and Event-Based, System-Wide Sampling provides developers with the most accurate representation of their software's actual performance with negligible overhead<br> 
    Call Graph Profiling provides developers with a pictorial view of program flow to quickly identify critical functions and call sequences<br> 

<b>Call Graph Mode</b><br>
    Provides with a pictorial view of program flow to quickly identify critical functions and call sequences<br>
    Call graph profiling reveals: <br>
      Structure of your program on a function level<br>
      Number of times a function is called from a  particular location<br> 
      The time spent in each function <br>
      Functions on a critical path. <br>

<b>VTune Summary</b><br>
    Pros:  Allows to get best possible performance out of Intel architecture<br>
    Cons: Extreme tuning requires deep understanding of processor and OS internals<br>
</div>
</div>
</body>
</html>
<%
}
%>