<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: light;
    margin: 0;
     padding: 0;
     text-align: center;
}

* {
    box-sizing: border-box;
}

/* Add padding to containers */
.container {
    padding: 16px;
    background-color: white;
    
}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 50%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 50%;
    opacity: 0.9;
}

.registerbtn:hover {
    opacity: 1;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
    background-color: #f1f1f1;
    text-align: center;
    
}
</style>


</head>
<body style="background:linear-gradient(to right,#2980b9,#2c3e50)">

	
	
	<form method="post" modelAttribute="company" action="login">
	  <div class="container" style="background:linear-gradient(to right,#2980b9,#2c3e50)">
	    <h1>Login</h1>
	    <hr style="align:centre;width:50%">
	
	    <!-- <label for="email"><b>Email</b></label><br> -->
	    <input type="text" placeholder="Enter Email" name="email" required>
	<br>
	    <!-- <label for="psw"><b>Password</b></label><br> -->
	    <input type="password" placeholder="Enter Password" name="pass" required>
	
	    <button type="submit" class="registerbtn">Login</button>
	    
	    <hr style="align:centre;width:50%;">
	    <p style="color: red">${mesg}</p>
	  </div>
	  
	   <div class="container signin" style="width: 49%;margin: 0 auto;">
	   		<p>New User?<a href="/CareerGuidance/company/register">Register</a>.</p>
	   </div>
	</form>

</body>

</html>