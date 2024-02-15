<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Home Page</title>
</head>
<style>
	.menu{
		width: 20%;
		min-height: 800px;
		float: left;
		background:linear-gradient(to right,#2b5876,#2b5876)
	}
	
	.display{
		width: 80%;
		min-height: 800px;
		float: left;
		background:linear-gradient(to right,#757f9a,#d7dde8)
	}
	
	.navbar{
		width: 100%;
		min-height: 50px;
		background:linear-gradient(to right,#2b5876,#2b5876)
	}
	
	.registerbtn {
	    background-color: #4CAF50;
	    color: white;
	    padding: 16px 20px;
	    margin: 8px 0;
	    border: none;
	    cursor: pointer;
	    
	    opacity: 0.9;
	}

	.registerbtn:hover {
    	opacity: 1;
	}
	
	#companyName{
		text-align: center;
		color: white;
		font-family: Verdana;
		float: center;
	}
</style>
<body class="navbar">
	<h1>HOME PAGE</h1>
	<h3>${sessionScope.msg}</h3>
	
	<form method="get" action="company_details">
		<input class="registerbtn" type="submit" value="View Company Details">
	</form>
	
	<form  method="get" action="posted_jobs">
		<input class="registerbtn" type="submit" value="View Posted Job Details">
	</form>
	
	<form method="get" action="student_details">
		<input class="registerbtn" type="submit" value="View Student Details">
	</form>
	
	<form method="get" action="get_coursedetails">
		<input class="registerbtn" type="submit" value="View Course Details">
	</form>
	
	<form method="post" action="add_newcourse">
		<input class="registerbtn" type="submit" value="Add New Course">
	</form>
	
	
	
</body>
</html>