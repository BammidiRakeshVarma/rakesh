<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
<script>
$(document).ready(function() {
	$('#submit').attr('disabled', 'disabled');
	$('input[type=password]').keyup(function() {
		var pswd = $(this).val();
		
		if ( pswd.length < 8 ) {
		    $('#length').removeClass('valid').addClass('invalid');
		} else {
		    $('#length').removeClass('invalid').addClass('valid');
		}
		
		if ( pswd.match(/[A-z]/) ) {
		    $('#letter').removeClass('invalid').addClass('valid');
		} else {
		    $('#letter').removeClass('valid').addClass('invalid');
		}

		//validate capital letter
		if ( pswd.match(/[A-Z]/) ) {
		    $('#capital').removeClass('invalid').addClass('valid');
		} else {
		    $('#capital').removeClass('valid').addClass('invalid');
		}

		//validate number
		if ( pswd.match(/\d/) ) {
		    $('#number').removeClass('invalid').addClass('valid');
		} else {
		    $('#number').removeClass('valid').addClass('invalid');
		}
		var sn=$('#number').hasClass('valid');
		var sl=$('#length').hasClass('valid');
		var sc=$('#capital').hasClass('valid');
		var slt=$('#letter').hasClass('valid');
		var sts=$('#status').hasClass('val');
		if(sn && sl && sc && slt && sts){
			$('#submit').removeAttr('disabled');
			$('#submit').removeClass('disabled').addClass('enabled');
		}
		if(!sn || !sl || !sc || !slt || !sts){
			$('#submit').attr('disabled', 'disabled');
			$('#submit').removeClass('enabled').addClass('disabled');
			}
		
	}).focus(function() {
	    $('#pswd_info').show();
	}).blur(function() {
	    $('#pswd_info').hide();
	});
	$('#reset').click(function(){
		$('#submit').attr('disabled', 'disabled');
		$('#submit').removeClass('enabled').addClass('disabled');
		$('#number').removeClass('valid').addClass('invalid');
		$('#length').removeClass('valid').addClass('invalid');
		$('#capital').removeClass('valid').addClass('invalid');
		$('#letter').removeClass('valid').addClass('invalid');
		$("#status").removeClass('val').addClass('inval');
		$("#status").html('');
	});
	$("#username").change(function() { 
		$("input[type=passsord]").attr("value","");
		var usr = $("#username").val();

		if(usr.length >= 3)
		{
		$("#status").html('<img src="loader.gif" align="absmiddle">&nbsp;Checking...');

		    $.ajax({  
		    type: "POST",  
		    url: "validateservlet",  
		    data: "uname="+ usr,  
		    success: function(msg){  
		   
		   	if(msg=='OK')
			{ 
		        $("#username").removeClass('object_error'); // if necessary
				$("#username").addClass("object_ok");
				$("#status").html('&nbsp;<img src="tick.gif" style="left:-10px;position:relative" align="absmiddle">&nbsp;<span style="color:green">User ID Available!!</span>');
				$("#status").removeClass('inval').addClass('val');
				
			} 
		   	
			else  
			{  
				$("#username").removeClass('object_ok'); // if necessary
				$("#username").addClass("object_error");
				$("#status").html('&nbsp;<img src="x.png" style="width:16px;height:16px;left:-10px;position:relative" align="absmiddle">'+'<span style="color:red">'+msg+'</span>');
				$("#status").removeClass('val').addClass('inval');
				
			}  
		   
		  

		 } 
		   
		  }); 

		}
		else
			{
			$("#status").html('<font color="red">The User ID should have at least <strong>3</strong> characters.</font>');
			$("#username").removeClass('object_ok'); // if necessary
			$("#username").addClass("object_error");
			}

		});
});
 

</script>
<style>
#pswd_info {
    position:absolute;
    left:53%;
    top:60%;
    width:200px;
    padding:15px;
    background:#fefefe;
    font-size:.875em;
    border-radius:5px;
    box-shadow:0 1px 3px #ccc;
    border:1px solid #ddd;
    display:none;
}
#pswd_info h4 {
    margin:0 0 10px 0;
    padding:0;
    font-weight:normal;
}
#pswd_info::before {
    content: "\25C0";
    position:absolute;
    left:-5%;
    font-size:28px;
    line-height:14px;
    color:#ddd;
    text-shadow:none;
    display:block;
}
.invalid {
    background:url(x.png) no-repeat 0 50%;
    background-size: 16px 16px;
    padding-left:22px;
    line-height:24px;
    color:#ec3f41;
}
.valid {
    background:url(tick.gif) no-repeat 0 50%;
    padding-left:22px;
    line-height:24px;
    color:#3a7d34;
}
ul, li {
    margin:0;
    padding:0;
    list-style-type:none;
}

a:hover{
color:#0033cc;
font-weight: bold;
}
.button,.enabled {
    background-color: #4CAF50; /* Green */
    border: 2px solid white;
    color: white;
    padding: 4px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    font-weight:bold;
    font-family: Papyrus, fantasy;
    border-radius: 4px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button:hover,.enabled:hover{
cursor:pointer;
border:2px solid #4CAF50;
background-color: white; /* Green */
    color: black;

}
.disabled {
    opacity: 0.5;
    cursor: not-allowed;
}
.disabled:hover{
cursor:not-allowed;
background-color: #4CAF50; /* Green */
    border: 2px solid white;
    color:white;
}
body{
background:url('wall.jpg') no-repeat;
}
input{
    padding: 6px;
    border: 1px solid #ccc;
    border-radius: 2px;
    font-size: .9em;
    color: #888;
}
#hd{
    width: 552px;
    height: 37px;
    border: 3px solid #e2e2e2;
    font-size: 26px;
    color: white;
    top: 1px;
    position: relative;
    font-family: Papyrus, fantasy;
    background: darkslategrey;
}
</style>
</head>
<body>
	<form action=regservlet method=POST style="margin-top:-4%">
            <center style="margin-top:10%">
            <div id='hd'><b>Registration Form</b></div> 
            <fieldset style = "width: 530px;background:#fdfbfb;border: 2px solid #e2e2e2">
			 
            <table cellpadding="7px">
                
                <tbody style="font-family: Papyrus, fantasy;font-weight:bold">
                    <tr >
                        <td>First Name</td>
                        <td><input type="text" name="fname" required="required" /></td>
                        <td style="color:red;position:relative;left:-10px">*</td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lname" required="required" /></td>
                        <td style="color:red;position:relative;left:-10px">*</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" required="required" /></td>
                        <td style="color:red;position:relative;left:-10px">*</td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><input type="text" name="address"/></td>
                    </tr>
                    <tr>
                        <td>Mobile No.</td>
                        <td><input type="text" name="mob"  /></td>
                    </tr>
                    <tr>
                        <td>User ID</td>
                        <td><input type="text" name="uname" required="required" id="username"/></td>
                        <td style="color:red;position:relative;left:-10px">*</td>
                        <td width="400" align="left"><div id="status" class='inval'></div></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="pass" required="required" id="pass"/></td>
                        <td style="color:red;position:relative;left:-10px">*</td>
                    </tr>
                    <tr align=center>
                        <td style="left:12%;position:relative"><input type="submit" value="Submit" id="submit" class='button disabled'/></td>
                        <td style="left:7%;position:relative"><input type="reset" value="Reset" id="reset" class='button'/></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;font-size:0.9em">Already registered!! <a href="login.jsp" style="text-decoration:none">Login Here</a></td>
                    </tr>
                </tbody>
            </table>
            </fieldset>
            </center>
        </form>
            <div id="pswd_info">
    <h4><b>Password must meet the following requirements:</b></h4>
    <ul>
        <li id="letter" class="invalid">At least <strong>one letter</strong></li>
        <li id="capital" class="invalid">At least <strong>one capital letter</strong></li>
        <li id="number" class="invalid">At least <strong>one number</strong></li>
        <li id="length" class="invalid">Be at least <strong>8 characters</strong></li>
    </ul>
</div>
            
</body>
</html>
