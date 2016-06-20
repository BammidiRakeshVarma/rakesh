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
<head>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/dropdown.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MPI</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
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
	
  <li>What is MPI?</li><br>
  <li>Programming Model</li><br>
  <li>Reasons for using MPI</li><br>
  <li>Environment Management Routines</li><br>
  <li>Point to Point Management Routines</li><br>
  <li>Message Passing Routine Arguments</li><br>
  <li>Collective Communication Routines</li><br>
  <li><a href="mpi_programs.jsp"><b>MPI Programs</b></a></li><br>
</ul>
</div>
</div>
<div id="content">
<p><b>What is MPI?</b><br>
a)M P I = Message Passing Interface<br>
b)MPI is a specification for the developers and users of message passing libraries. 
By itself, it is NOT a library - but rather the specification of what such a library should be.<br>
c)MPI primarily addresses the message-passing parallel programming model: data is moved from the
 address space of one process to that of another process through cooperative operations on each process.<br>
d)Simply stated, the goal of the Message Passing Interface is to provide a widely used standard for writing message passing programs.
The interface attempts to be:<br>
	Practical<br>
	Portable<br>
	Efficient<br>
	Flexible<br>
e)The MPI standard has gone through a number of revisions, with the most recent version being MPI-3.x <br>
f)Interface specifications have been defined for C and Fortran90 language bindings:<br>
	C++ bindings from MPI-1 are removed in MPI-3<br>
	MPI-3 also provides support for Fortran 2003 and 2008 features<br>
g)Actual MPI library implementations differ in which version and features of the MPI standard they support. Developers/users will need to be aware of this.<br>
</p>
<p><b>Programming Model:</b><br>
a)Originally, MPI was designed for distributed memory architectures, which were becoming increasingly popular at that time (1980s - early 1990s).<br>
b)As architecture trends changed, shared memory SMPs were combined over networks creating hybrid distributed memory / shared memory systems.<br>
c)MPI implementors adapted their libraries to handle both types of underlying memory architectures seamlessly. They also adapted/developed ways of handling different interconnects and protocols<br>
d)Today, MPI runs on virtually any hardware platform:<br>
	Distributed Memory<br>
	Shared Memory<br>
	Hybrid<br>
e)The programming model clearly remains a distributed memory model however, regardless of the underlying physical architecture of the machine.<br>
f)All parallelism is explicit: the programmer is responsible for correctly identifying parallelism and implementing parallel algorithms using MPI constructs.<br>
 	</p>
 <p><b>Reasons for Using MPI:</b><br>
Standardization - MPI is the only message passing library that can be considered a standard. It is supported on virtually all HPC platforms. Practically, it has replaced all previous message passing libraries.<br>
Portability - There is little or no need to modify your source code when you port your application to a different platform that supports (and is compliant with) the MPI standard.<br>
Performance Opportunities - Vendor implementations should be able to exploit native hardware features to optimize performance. Any implementation is free to develop optimized algorithms.<br>
Functionality - There are over 430 routines defined in MPI-3, which includes the majority of those in MPI-2 and MPI-1.
	 Most MPI programs can be written using a dozen or less routines<br>
Availability - A variety of implementations are available, both vendor and public domain.<br></p>
<p><b>Getting Started</b><br>
	MPI include file -->program begins -->Initialize MPI Environment-->Do work and make message passing calls-->Terminate MPI Environment-->program ends<br>
 	Header File:<br>
		Required for all programs that make MPI library calls.
		C include file: #include "mpi.h" <br>
	Format of MPI Calls: <br>C names are case sensitive; Fortran names are not.
				Programs must not declare variables or functions with names beginning with the prefix MPI_ or PMPI_ (profiling interface).<br>
	Communicators and Groups:<br>
				MPI uses objects called communicators and groups to define which collection of processes may communicate with each other.
				Most MPI routines require you to specify a communicator as an argument.
				Communicators and groups will be covered in more detail later. For now, simply use MPI_COMM_WORLD whenever a communicator is required - it is the predefined communicator that includes all of your MPI processes.
     Rank:<br>  Within a communicator, every process has its own unique, integer identifier assigned by the system when the process initializes. A rank is sometimes also called a "task ID". Ranks are contiguous and begin at zero.
		Used by the programmer to specify the source and destination of messages. Often used conditionally by the application to control program execution (if rank=0 do this / if rank=1 do that).
</p>
<p><b>Environment Management Routines</b><br>
		This group of routines is used for interrogating and setting the MPI execution environment, and covers an assortment of purposes, such as initializing and terminating the MPI environment, querying a rank's identity, querying the MPI library's version, etc. 
		Most of the commonly used ones are described below.
		<br>
		MPI_Init:<br>Initializes the MPI execution environment. This function must be called in every MPI program, must be called before any other MPI functions and must be called only once in an MPI program. For C programs, MPI_Init may be used to pass the command line arguments to all processes,
		 although this is not required by the standard and is implementation dependent.
				MPI_Init (&argc,&argv) 
		MPI_Comm_size<br>
			Returns the total number of MPI processes in the specified communicator, such as MPI_COMM_WORLD. 
			If the communicator is MPI_COMM_WORLD, then it represents the number of MPI tasks available to your application.
				MPI_Comm_size (comm,&size) 
		MPI_Comm_rank<br>
			Returns the rank of the calling MPI process within the specified communicator. 
			Initially, each process will be assigned a unique integer rank between 0 and number of tasks - 1 within the communicator MPI_COMM_WORLD. 
			This rank is often referred to as a task ID. 
			If a process becomes associated with other communicators, it will have a unique rank within each of these as well.
				MPI_Comm_rank (comm,&rank) 
		MPI_Abort<br>

			Terminates all MPI processes associated with the communicator. In most MPI implementations it terminates ALL processes regardless of the communicator specified.
			MPI_Abort (comm,errorcode)
		MPI_Get_processor_name<br>

		Returns the processor name. Also returns the length of the name. The buffer for "name" must be at least MPI_MAX_PROCESSOR_NAME characters in size. What is returned into "name" is implementation dependent - may not be the same as the output of the "hostname" or "host" shell commands.
			MPI_Get_processor_name (&name,&resultlength)
		MPI_Finalize<br>
			Terminates the MPI execution environment. This function should be the last MPI routine called in every MPI program - no other MPI routines may be called after it.
				MPI_Finalize ()	</p>

<p><b>Point to Point Communication Routines</b><br>
		Types of Point-to-Point Operations:<br>
	MPI point-to-point operations typically involve message passing between two, and only two, different MPI tasks. One task is performing a send operation and the other task is performing a matching receive operation.
	There are different types of send and receive routines used for different purposes. For example:
		Synchronous send<br>
		Blocking send / blocking receive<br>
		Non-blocking send / non-blocking receive<br>
		Buffered send<br>
		Combined send/receive<br>
		"Ready" send<br>
	Any type of send routine can be paired with any type of receive routine.
	MPI also provides several routines associated with send - receive operations, such as those used to wait for a message's arrival or probe to find out if a message has arrived.<br>

		Blocking vs. Non-blocking:<br>
	Most of the MPI point-to-point routines can be used in either blocking or non-blocking mode.<br>
	Blocking:<br>
		A blocking send routine will only "return" after it is safe to modify the application buffer (your send data) for reuse. Safe means that modifications will not affect the data intended for the receive task. Safe does not imply that the data was actually received - it may very well be sitting in a system buffer.<br>
		A blocking send can be synchronous which means there is handshaking occurring with the receive task to confirm a safe send.<br>
		A blocking send can be asynchronous if a system buffer is used to hold the data for eventual delivery to the receive.<br>
		A blocking receive only "returns" after the data has arrived and is ready for use by the program.<br>
	Non-blocking:<br>
		Non-blocking send and receive routines behave similarly - they will return almost immediately. They do not wait for any communication events to complete, such as message copying from user memory to system buffer space or the actual arrival of message.<br>
		Non-blocking operations simply "request" the MPI library to perform the operation when it is able. The user can not predict when that will happen.
		It is unsafe to modify the application buffer (your variable space) until you know for a fact the requested non-blocking operation was actually performed by the library. There are "wait" routines used to do this.<br>
		Non-blocking communications are primarily used to overlap computation with communication and exploit possible performance gains.</p>
		<p>
					<b>MPI Message Passing Routine Arguments</b><br>
		MPI point-to-point communication routines generally have an argument list that takes one of the following formats:<br>
		Blocking sends	MPI_Send(buffer,count,type,dest,tag,comm)<br>
		Non-blocking sends	MPI_Isend(buffer,count,type,dest,tag,comm,request)<br>
		Blocking receive	MPI_Recv(buffer,count,type,source,tag,comm,status)<br>
		Non-blocking receive	MPI_Irecv(buffer,count,type,source,tag,comm,request)<br>

	Buffer<br>
		Program (application) address space that references the data that is to be sent or received. In most cases, this is simply the variable name that is be sent/received. For C programs, this argument is passed by reference and usually must be prepended with an ampersand: &var1
	Data Count<br>
		Indicates the number of data elements of a particular type to be sent.
	Data Type<br>
		For reasons of portability, MPI predefines its elementary data types. The table below lists those required by the standard.

	Destination<br>
		An argument to send routines that indicates the process where a message should be delivered. Specified as the rank of the receiving process.
	Source<br>
		An argument to receive routines that indicates the originating process of the message. Specified as the rank of the sending process. This may be set to the wild card MPI_ANY_SOURCE to receive a message from any task.
	Tag<br>
		Arbitrary non-negative integer assigned by the programmer to uniquely identify a message. Send and receive operations should match message tags. For a receive operation, the wild card MPI_ANY_TAG can be used to receive any message regardless of its tag. The MPI standard guarantees that integers 0-32767 can be used as tags, but most implementations allow a much larger range than this.
	Communicator<br>
		Indicates the communication context, or set of processes for which the source or destination fields are valid. Unless the programmer is explicitly creating new communicators, the predefined communicator MPI_COMM_WORLD is usually used.
	Status<br>
		For a receive operation, indicates the source of the message and the tag of the message. In C, this argument is a pointer to a predefined structure MPI_Status (ex. stat.MPI_SOURCE stat.MPI_TAG). In Fortran, it is an integer array of size MPI_STATUS_SIZE (ex. stat(MPI_SOURCE) stat(MPI_TAG)). Additionally, the actual number of bytes received is obtainable from Status via the MPI_Get_count routine.
	Request<br>
		Used by non-blocking send and receive operations. Since non-blocking operations may return before the requested system buffer space is obtained, the system issues a unique "request number". The programmer uses this system assigned "handle" later (in a WAIT type routine) to determine completion of the non-blocking operation. In C, this argument is a pointer to a predefined structure MPI_Request. In Fortran, it is an integer.
</p>
<p>
<b>Collective Communication Routines</b><br>
		Types of Collective Operations: <br>

		Synchronization - processes wait until all members of the group have reached the synchronization point.<br>
		Data Movement - broadcast, scatter/gather, all to all.<br>
		Collective Computation (reductions) - one member of the group collects data from the other members and performs an operation (min, max, add, multiply, etc.) on that data.<br>
 		Scope:<br>

		Collective communication routines must involve all processes within the scope of a communicator.
		All processes are by default, members in the communicator MPI_COMM_WORLD.
		Additional communicators can be defined by the programmer. See the Group and Communicator Management Routines section for details.
		Unexpected behavior, including program failure, can occur if even one task in the communicator doesn't participate.
		It is the programmer's responsibility to ensure that all processes within a communicator participate in any collective operations.
		 Programming Considerations and Restrictions:<br>
		Collective communication routines do not take message tag arguments.
		Collective operations within subsets of processes are accomplished by first partitioning the subsets into new groups and then attaching the new groups to new communicators (discussed in the Group and Communicator Management Routines section).
		Can only be used with MPI predefined datatypes - not with MPI Derived Data Types.
		MPI-2 extended most collective operations to allow data movement between intercommunicators (not covered here).
		With MPI-3, collective operations can be blocking or non-blocking. Only blocking operations are covered in this tutorial.<br>

		MPI_Barrier<br>

			Synchronization operation. Creates a barrier synchronization in a group. Each task, when reaching the MPI_Barrier call, blocks until all tasks in the group reach the same MPI_Barrier call. Then all tasks are free to proceed.
				MPI_Barrier (comm)

		MPI_Bcast<br>

			Data movement operation. Broadcasts (sends) a message from the process with rank "root" to all other processes in the group. 
				MPI_Bcast (&buffer,count,datatype,root,comm)
		MPI_Scatter<br>

			Data movement operation. Distributes distinct messages from a single source task to each task in the group. 
					MPI_Scatter (&sendbuf,sendcnt,sendtype,&recvbuf, recvcnt,recvtype,root,comm) 

		MPI_Gather<br>

		Data movement operation. Gathers distinct messages from each task in the group to a single destination task. This routine is the reverse operation of MPI_Scatter. <br>
			MPI_Gather (&sendbuf,sendcnt,sendtype,&recvbuf, recvcount,recvtype,root,comm) 
		MPI_Allgather<br>

			Data movement operation. Concatenation of data to all tasks in a group. Each task in the group, in effect, performs a one-to-all broadcasting operation within the group. 
				MPI_Allgather (&sendbuf,sendcount,sendtype,&recvbuf, recvcount,recvtype,comm) 
		
		MPI_Reduce<br>

		Collective computation operation. Applies a reduction operation on all tasks in the group and places the result in one task. 
			MPI_Reduce (&sendbuf,&recvbuf,count,datatype,op,root,comm) 

		MPI_Allreduce<br>

		Collective computation operation + data movement. Applies a reduction operation and places the result in all tasks in the group. This is equivalent to an MPI_Reduce followed by an MPI_Bcast.
			MPI_Allreduce (&sendbuf,&recvbuf,count,datatype,op,comm) 
		MPI_Reduce_scatter<br>

			Collective computation operation + data movement. First does an element-wise reduction on a vector across all tasks in the group. Next, the result vector is split into disjoint segments and distributed across the tasks. This is equivalent to an MPI_Reduce followed by an MPI_Scatter operation. 
				MPI_Reduce_scatter (&sendbuf,&recvbuf,recvcount,datatype, op,comm)


		MPI_Alltoall<br>

			Data movement operation. Each task in a group performs a scatter operation, sending a distinct message to all the tasks in the group in order by index. 
				MPI_Alltoall (&sendbuf,sendcount,sendtype,&recvbuf, recvcnt,recvtype,comm) 

		MPI_Scan<br>

			Performs a scan operation with respect to a reduction operation across a task group. 
					MPI_Scan (&sendbuf,&recvbuf,count,datatype,op,comm) 

</p>
</div>
</div>

</body>
</html>
<%
    }
%>