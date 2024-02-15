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
		
</script>
</head>

<body>
	<h1>#NUSTASHORTLISTEDSTUDENTDETAILS</h1>
	<br>
	<div class="container mt-3">	
  	 	<div class="form-group row">
  			<div class="col-xs-1" style="width: 170px">
    			<input class="form-control" type="text" id="searchbyall" placeholder="Search By All">
	  		</div>
  			<div class="col-xs-3" style="width: 270px">
	    		<input class="form-control" type="text" id="searchbyregno" placeholder="Search By Registration Number" >
  			</div>
  			
  			<div class="col-xs-3" style="width: 250px">
	     		<input class="form-control" type="text" id="searchbygradmarks" placeholder="Search By Graduation Marks">
  			</div>
  			 			
		</div>
  			
  		<b>Company Name: ${companyname}</b><br>
      	<b>Job ID: ${jobid}</b><br>
      	<b>Company Email ID: ${emailid}</b>
  		<div class="table-responsive">
			<table class = "table table-striped table-bordered table-hover cellpadding-0 cellspacing-0" border="1">
   			<caption>Shortlisted Students: </caption>
				<thead>
      				<tr>
      					<th>Registration Number</th>
      					
      					<th>First Name</th>
      					<th>Last Name</th>
      					
      					<th>Contact Number</th>
      					<th>Email ID</th>
      					<th>Date of Birth</th>
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
               		<c:forEach var="s" items="${shortliststudent_obj}">
                  		<tr>
                   			<td>${s.regno}</td>
                   			
                   			<td>${s.fname}</td>
                   			<td>${s.lname}</td>
                   
                   			<td>${s.contact}</td>
                   			<td><a href="mailto:${s.email}?subject=Shortlisted&body=You have been shortlisted for ${companyname}. Job Id: ${jobid}">${s.email}</a></td>
                   			<td>${s.dob}</td>
                   			<td>${s.gender}</td>
                   			
                   			<td>${s.address}</td>
                   			<td>${s.city}</td>
                   			<td>${s.district}</td>
                   			<td>${s.state}</td>
                   			<td>${s.country}</td>
                   			
                   			<td>${s.pgcourse}</td>
                   			<td>${s.pgstream}</td>
                   			<td>${s.pgyear}</td>
                   			<td>${s.pgpercent}</td>
                   			<td>${s.gradcourse}</td>
                   			<td>${s.gradstream}</td>
                   			<td>${s.gradyear}</td>
                   			<td>${s.gradpercent}</td>
                   			<td>${s.hsc}</td>
                   			<td>${s.hscyear}</td>
                   			<td>${s.hscpercent}</td>
                   			<td>${s.diplomastream}</td>
                   			<td>${s.diplomayear}</td>
                   			<td>${s.diplomapercent}</td>
                   			<td>${s.sscyear}</td>
                   			<td>${s.sscpercent}</td>                   			 
                  		</tr>
               		</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	</body>
</html>

	