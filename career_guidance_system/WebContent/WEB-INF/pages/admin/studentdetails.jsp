<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Student Details</title>
<script>
		$(document).ready(function()
		{
		  $("#searchbyall").on("keyup", function() 
		  {
		    var value = $(this).val().toLowerCase();
		    $("#myTable tr").filter(function() 
		    {
		      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		    });
		  });
		});

		$(document).ready(function()
		{
		  $("#searchbyregno").on("keyup", function() 
		  {
		    var value = $(this).val();
		    $("table tr").each(function(index) 
		    {
		    	if(index!=0)
		    	{
		    		$row=$(this);
		    		var id=$row.find("td:first").text();
		    		if(id.indexOf(value)!=0)
		    		{
		    			$(this).hide();
		    		}
		    		else
		    		{
		    			$(this).show();
		    		}
		    	}
		    });
		  });
		});	

		$(document).ready(function()
		{
		  $("#searchbycourse").on("keyup", function() 
		  {
		    var value = $(this).val();
		    $("table tr").each(function(index) 
		   {
		    	if(index!=0)
		    	{
		    		$row=$(this);
		    		var id=$row.find("td:nth-child(6)").text();
		    		if(id.indexOf(value)!=0)
		    		{
		    			$(this).hide();
		    		}
		    		else
		    		{
		    			$(this).show();
		    		}
		    	}
		    });
		  });
		});	

		$(document).ready(function()
		{
		  $("#searchbygradmarks").on("keyup", function() 
		  {
		    var value = $(this).val();
		    $("table tr").each(function(index) 
		    {
			  	if(index!=0)
			   	{
			   		$row=$(this);
			   		var id=$row.find("td:nth-child(26)").text();
			   		if(id.indexOf(value)!=0)
			   		{
			   			$(this).hide();
			   		}
			   		else
			   		{
			   			$(this).show();
			   		}
			   	}
			});
		  });
		});	
		$(document).ready(function()
		{
		  $("#searchbyplacement").on("keyup", function() 
		  {
		    var value = $(this).val();
		    $("table tr").each(function(index) 
		    {
		    	if(index!=0)
			   	{
			   		$row=$(this);
			   		var id=$row.find("td:nth-child(9)").text();
			   		if(id.indexOf(value)!=0)
			   		{
			   			$(this).hide();
			   		}
			   		else
			   		{
			   			$(this).show();
			   		}
			   	}
		    });
		  });
		});		

</script>
</head>

<body>
	<h1>STUDENTDETAILS</h1>
	<br> 			
  		<div class="table-responsive">
			<table class = "table table-striped table-bordered table-hover cellpadding-0 cellspacing-0" border="1">
   			<caption>Student Details</caption>
				<thead>
      				<tr>
      					<th>Registration Number</th>
      					<th>Profile Completion Status</th>
      
      					<th>First Name</th>
      					<th>Last Name</th>
      					
      					<th>Courses Opted</th>
      					<th>Registration Date</th>
      					<th>Last Login Time</th>
      					<th>Placement Status</th>
      					
      					<th>Contact Number</th>
      					<th>Email ID</th>
      					<th>Date of Birth(YYYY-MM-DD)</th>
      					<th>Gender</th>
      					
      					<th>Address</th>
      					<th>City</th>
      					<th>District</th>
      					<th>State</th>
      					<th>Country</th>
      					
      					<th>PG Course</th>
      					<th>PG Stream</th>
      					<th>PG Passing Year</th>
      					<th>PG Marks</th>
      					<th>Graduation Course</th>
      					<th>Graduation Stream</th>
      					<th>Graduation Passing Year</th>
      					<th>Graduation Marks</th>
      					<th>HSC Status</th>
      					<th>HSC Passing Year</th>
      					<th>HSC Marks</th>
      					<th>Diploma Stream</th>
      					<th>Diploma Passing Year</th>
      					<th>Diploma Marks</th>
      					<th>SSC Passing Year</th>
      					<th>SSC Marks</th></tr>
            	</thead>
            
   				<tbody id="myTable">   
               		<c:forEach var="s" items="${stud_obj}">
                  		<tr>
                   			<td>${s[1].regno}</td>
                   			<td>${s[1].profilecompleted}
                  
                   			<td>${s[1].fname}</td>
                   			<td>${s[1].lname}</td>
                   			
                   			<td>${s[0]}</td>
                   			<td>${s[1].regdate}</td>
                   			<td>${s[1].lastlogin}</td>
                   			<td><a href="student_placementstatus?regno=${s[1].regno}">${s[1].placed}</a></td>
                   			
                   			<td>${s[1].contact}</td>
                   			<td><a href="mailto:${s[1].email}?subject=Profile%20Completion&body=Please complete your profile ASAP!">${s[1].email}</a></td>
                   			<td>${s[1].dob}</td>
                   			<td>${s[1].gender}</td>
                   			
                   			<td>${s[1].address}</td>
                   			<td>${s[1].city}</td>
                   			<td>${s[1].district}</td>
                   			<td>${s[1].state}</td>
                   			<td>${s[1].country}</td>
                   			
                   			<td>${s[1].pgcourse}</td>
                   			<td>${s[1].pgstream}</td>
                   			<td>${s[1].pgyear}</td>
                   			<td>${s[1].pgpercent}</td>
                   			<td>${s[1].gradcourse}</td>
                   			<td>${s[1].gradstream}</td>
                   			<td>${s[1].gradyear}</td>
                   			<td>${s[1].gradpercent}</td>
                   			<td>${s[1].hsc}</td>
                   			<td>${s[1].hscyear}</td>
                   			<td>${s[1].hscpercent}</td>
                   			<td>${s[1].diplomastream}</td>
                   			<td>${s[1].diplomayear}</td>
                   			<td>${s[1].diplomapercent}</td>
                   			<td>${s[1].sscyear}</td>
                   			<td>${s[1].sscpercent}</td>                   			 
                  		</tr>
               		</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	</body>
</html>

	