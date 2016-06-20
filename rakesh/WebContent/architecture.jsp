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
</head>
<body>
<div id="container">
<div id="header">
<span style="font-size: 2.5em;color:white;position:relative;top:50px;left:80px;"><a href="index.jsp"  style="color: #ffffff;text-decoration:none">SUPERCOMPUTING</a></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:500px;">Welcome  <%=session.getAttribute("userid")%></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:550px;"><a href="profile.jsp" style="color: #ffffff;text-decoration:none">Profile</a></span>
<span style="font-size:1.0em;color:white;position:relative;top:50px;left:600px;"><a href="logout.jsp" style="color: #ffffff;text-decoration:none">Logout</a></span>
</div>
<div id="sidebar">
<div style="position:relative;Top:45px;left:45px;">
<ul style="list-style-type:disc">
  <li>Shared Memory
  <ul>
      <li>General Characterstics</li>
      <li>Uniform Memory Access</li>
      <li>Non-Uniform Memory Access</li>
      <li>Advantages</li>
      <li>Disadvantages</li>
      </ul>
  </li><br>
  <li>Disributed Memory
  <ul>
      <li>General Characterstics</li>
      <li>Advantages</li>
      <li>Disadvantages</li>
      </ul>
  </li><br>
 
</ul>
</div>
</div>
<div id="content">
<A NAME=MemoryArch> <BR><BR> </A>
<A NAME=SharedMemory> </A>
<H2>Shared Memory</H2>
<SPAN CLASS=heading3>General Characteristics:</SPAN>
<P>
<TABLE CELLPADDING=0 CELLSPACING=0>
<TR VALIGN=top>
<TD><UL>
<LI>Shared memory parallel computers vary widely, but generally have in common 
    the ability for all processors to access all memory as global address space. 
<P>
<LI>Multiple processors can operate independently but share the same memory 
    resources.
<P>
<LI>Changes in a memory location effected by one processor are visible to all
    other processors.
<P>
<LI>Historically, shared memory machines have been classified as  
    <B><I>UMA</I></B> and <B><I>NUMA</I></B>, based upon memory access times.
<P>
</UL>
<P>


<SPAN CLASS=heading3>Uniform Memory Access (UMA):</SPAN>
    <UL>
    <LI>Most commonly represented today by <B><I>Symmetric Multiprocessor 
       (SMP)</I></B> machines
    <LI>Identical processors 
    <LI>Equal access and access times to memory 
    <LI>Sometimes called CC-UMA - Cache Coherent UMA.
        Cache coherent means if one processor updates a location in shared 
        memory, all 
        the other processors know about the update.  Cache coherency is 
        accomplished at the hardware level. 
    </UL>
<P>

<SPAN CLASS=heading3>Non-Uniform Memory Access (NUMA):</SPAN>
    <UL>
    <LI>Often made by physically linking two or more SMPs 
    <LI>One SMP can directly access memory of another SMP 
    <LI>Not all processors have equal access time to all memories 
    <LI>Memory access across link is slower
    <LI>If cache coherency is maintained, then may also be called CC-NUMA - 
        Cache Coherent NUMA 
    </UL>
<P>
<SPAN CLASS=heading3>Advantages:</SPAN>
    <UL>
    <LI>Global address space provides a user-friendly programming perspective 
        to memory
    <LI>Data sharing between tasks is both fast and uniform due to the proximity 
        of memory to CPUs
    </UL>
</TD>

</TR></TABLE>
<P>


<SPAN CLASS=heading3>Disadvantages:</SPAN>
<UL>
<LI>Primary disadvantage is the lack of scalability between memory and CPUs.
    Adding more CPUs can geometrically increases traffic on the shared
    memory-CPU path, and for cache coherent systems, geometrically increase 
    traffic associated with cache/memory management. 
<LI>Programmer responsibility for synchronization constructs that ensure
    "correct" access of global memory. 
</UL>


<!--========================================================================-->
<P>
<A NAME=DistributedMemory> <BR><BR> </A>
<H2>Distributed Memory</H2>


<SPAN CLASS=heading3>General Characteristics:</SPAN>
<UL>
<P>
<LI>Like shared memory systems, distributed memory systems vary widely but 
    share a common characteristic. Distributed memory systems require a 
    communication network to connect inter-processor memory.
<P>

<P>
<LI>Processors have their own local memory.  Memory addresses in one 
    processor do not map to another processor, so there is no concept of
    global address space across all processors.
<P>
<LI>Because each processor has its own local memory, it operates 
    independently. Changes it makes to its local memory have no effect
    on the memory of other processors.  Hence, the concept of cache
    coherency does not apply.
<P>
<LI>When a processor needs access to data in another processor, it is 
    usually the task of the programmer to explicitly define how and when
    data is communicated.  Synchronization between tasks is likewise the
    programmer's responsibility.
<P>
<LI>The network "fabric" used for data transfer varies widely, though it can
    be as simple as Ethernet.
</UL>
<P>


<SPAN CLASS=heading3>Advantages:</SPAN>
    <UL>
    <LI>Memory is scalable with the number of processors. Increase the number of    
        processors and the size of memory increases proportionately. 
    <LI>Each processor can rapidly access its own memory without interference
        and without the overhead incurred with trying to maintain global cache
        coherency.
    <LI>Cost effectiveness: can use commodity, off-the-shelf processors and
        networking.
    </UL>
<P>


<SPAN CLASS=heading3>Disadvantages:</SPAN>
    <UL>
    <LI>The programmer is responsible for many of the details associated with
        data communication between processors. 
    <LI>It may be difficult to map existing data structures, based on global
        memory, to this memory organization. 
    <LI>Non-uniform memory access times - data residing on a remote node
        takes longer to access than node local data.
    </UL>
</UL>
</div>
</div>
</body>
</html>
<%
}
%>