<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

<body>

<div class="navbar" >
	<p id="companyName">${sessionScope.company.companyName}</p>
</div>

<div class="menu" >

	
	<p><a href="/CareerGuidance/company/companyProfile"  class="registerbtn">Edit Profile</a></p><br>
	<p><a href="/CareerGuidance/company/postJob"  class="registerbtn">Post New Job</a></p><br>
	<p><a href="/CareerGuidance/company/postedJobHistory?id=${sessionScope.company.companyId}" class="registerbtn">Posted Job History</a></p><br>
	<p><a href="/CareerGuidance/company/companyLogout" class="registerbtn">Logout</a></p>	

	
	
</div>
<div class="display">
	<p style="color: red">${mesg}</p>
</div>




</body>
</html>