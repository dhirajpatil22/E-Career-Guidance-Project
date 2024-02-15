<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<title>Course Details</title>
<script>
/* 		$(document).ready(function()
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
		  $("#searchbycompid").on("keyup", function() 
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
		  $("#searchbycompregno").on("keyup", function() 
		  {
		    var value = $(this).val();
		    $("table tr").each(function(index) 
		   {
		    	if(index!=0)
		    	{
		    		$row=$(this);
		    		var id=$row.find("td:nth-child(2)").text();
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
		  $("#searchbycity").on("keyup", function() 
		  {
		    var value = $(this).val();
		    $("table tr").each(function(index) 
		    {
			  	if(index!=0)
			   	{
			   		$row=$(this);
			   		var id=$row.find("td:nth-child(14)").text();
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
		  $("#searchbycompanyname").on("keyup", function() 
		  {
		    var value = $(this).val();
		    $("table tr").each(function(index) 
		    {
		    	if(index!=0)
			   	{
			   		$row=$(this);
			   		var id=$row.find("td:nth-child(3)").text();
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
		  $("#searchbyrecruitertype").on("keyup", function() 
		  {
		    var value = $(this).val();
		    $("table tr").each(function(index) 
		    {
		    	if(index!=0)
			   	{
			   		$row=$(this);
			   		var id=$row.find("td:nth-child(21)").text();
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
		});	 */	
		
</script>
</head>

<body>
	<h1>COURSESDETAILS</h1>
	<br>
	<div class="container mt-3">	
<!--   	 	<div class="form-group row">
  			<div class="col-xs-1" style="width: 150px">
    			<input class="form-control" type="text" id="searchbyall" placeholder="Search By All">
	  		</div>
  			<div class="col-xs-2" style="width: 210px">
	    		<input class="form-control" type="text" id="searchbycompid" placeholder="Search By Company ID" >
  			</div>
  			<div class="col-xs-3" style="width: 260px">
     			<input class="form-control" type="text" id="searchbycompregno" placeholder="Search By Registration Number">
  			</div>
  			<div class="col-xs-3" style="width: 230px">
	     		<input class="form-control" type="text" id="searchbycompanyname" placeholder="Search By Company Name">
  			</div>
  			<div class="col-xs-1" style="width: 150px">
	     		<input class="form-control" type="text" id="searchbycity" placeholder="Search By City">
  			</div>	
  			<div class="col-xs-1" style="width: 160px">
	     		<input class="form-control" type="text" id="searchbyrecruitertype" placeholder="Search By Type">
  			</div>		
		</div> -->
  			
  		<div class="table-responsive">
			<table class = "table table-striped table-bordered table-hover cellpadding-0 cellspacing-0" border="1">
   			<caption>Course Details</caption>
				<thead>
      				<tr>
            			<th>Course ID</th>
                   		<th>Course Name</th>
                   		<th>Description</th>
            		</tr>
            	</thead>
            
   				<tbody id="myTable">   
               		<c:forEach var="c" items="${course_obj}">
                  		<tr>
                   			<td>${c.courseid}</td>
                   			<td>${c.coursename}</td>
                   			<td>${c.description}</td>
                  		</tr>
               		</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	</body>
</html>