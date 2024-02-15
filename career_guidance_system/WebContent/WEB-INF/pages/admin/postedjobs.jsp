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
<title>Posted Jobs Details</title>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});

</script>
</head>

<body>
	<h1>#NUSTAPOSTEDJOBS</h1>
	<div class="container mt-3">
		<div class="table-responsive">
  			<input class="form-control" id="myInput" type="text" placeholder="Search..">
  			<br> 
			<table class = "table table-striped table-bordered table-hover cellpadding-0 cellspacing-0" border="1">
   			<caption>Posted Jobs Details</caption>
				<thead>
      				<tr>
      					<th>Company ID</th>
      					<th>Company Name</th>
            			<th>JobID</th>
            			<th>Job Title</th>
            			<th>Job Location</th>
            			<th>Job Description</th>
            			<th>Job Type</th>
            			<th>Vacancies</th>
            			<th>Salary</th>
            			<th>Interview Location</th>
            			<th>Interview Date</th>
            			<th>Last Date to Apply</th>
            			<th>Required Skills</th>
            			<th>Job Posted Date</th>
            			<th>SSC Marks Criteria</th>
            			<th>HSC Marks Criteria</th>
            			<th>Diploma Marks Criteria</th>
            			<th>Graduation Marks Criteria</th>
            			<th>Post Graduation Marks Criteria</th>
            			<th>Company Email ID</th>
            			<th></th>
            		</tr>
            	</thead>
              
   				<tbody id="myTable">   
               		<c:forEach var="p" items="${postedjobs_obj}">
                  		<tr>    
                   			<td>${p[0]}</td> 
                   			<td>${p[1]}</td>
                   			<td>${p[3].jobId}</td>
                   			<td>${p[3].jobTitle}</td>
                   			<td>${p[3].jobLocation}</td>
                   			<td>${p[3].jobDescription}</td>
                   			<td>${p[3].jobType}</td>
                   			<td>${p[3].vacancies}</td>
                   			<td>${p[3].salary}</td>
                   			<td>${p[3].interviewLocation}</td>
                   			<td>${p[3].interviewDate}</td>
                   			<td>${p[3].lastDateToApply}</td>
                   			<td>${p[3].requiredSkills}</td>
                   			<td>${p[3].jobPostedDate}</td>
                   		  <td>${p[3].jobEligibilityCriteria.sscPercentage}</td>
                   			<td>${p[3].jobEligibilityCriteria.hscPercentage}</td>
                   			<td>${p[3].jobEligibilityCriteria.diplomaPercentage}</td>
                   			<td>${p[3].jobEligibilityCriteria.gradPercentage}</td>
                   			<td>${p[3].jobEligibilityCriteria.postGradPercentage}</td> 
                   			<td>${p[2]}</td>
                   			 <td><a href="shortlist_students?companyName=${p[1]}&jobId=${p[3].jobId}&emailid=${p[2]}&sscmarks=${p[3].jobEligibilityCriteria.sscPercentage}&hscmarks=${p[3].jobEligibilityCriteria.hscPercentage}&diplomamarks=${p[3].jobEligibilityCriteria.hscPercentage}&gradmarks=${p[3].jobEligibilityCriteria.gradPercentage}">ShortlistStudents</a></td>	
							 
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>