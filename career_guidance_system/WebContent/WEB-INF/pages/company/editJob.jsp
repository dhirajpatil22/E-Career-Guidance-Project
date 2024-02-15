<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
table {
    border-collapse: collapse;
    width:50%;
    background-color:#d9d9d9;
    margin-left:350px;
    margin-top:10px;  
    top:25%;
    left:25%;
}

input,textarea{
	width: 200px;
	height: 25px;
}



td {
    text-align: center;
    padding: 8px;
}

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
  float: right;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>

<title>Insert title here</title>
</head>
<body style="background:linear-gradient(to right,#2980b9,#2c3e50)">
	
	<form:form method="post" action ="/CareerGuidance/company/editJob" modelAttribute="job_edit">
		<div>
			
			<table>
				<tr>
					<td>
						<form:label path="">Job Id</form:label>
					</td>
					<td>
						<p><form:input path="jobId" readonly="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Job Title</form:label>
					</td>
					<td>
						<p><form:input path="jobTitle"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Job Type</form:label>
					</td>
					<td>
						<p><form:input path="jobType"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Job Description</form:label>
					</td>
					<td>
						<p><form:textarea path="jobDescription" rows="4" /></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Vacancies</form:label>
					</td>
					<td>
						<p><form:input path="vacancies"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Job Location</form:label>
					</td>
					<td>
						<p><form:input path="jobLocation"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Interview Location</form:label>
					</td>
					<td>
						<p><form:input path="interviewLocation"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Salary Offered</form:label>
					</td>
					<td>
						<p><form:input path="salary"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Required Skills</form:label>
					</td>
					<td>
						<p><form:textarea path="requiredSkills" rows="4"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Interview Date</form:label>
					</td>
					<td>
						<p><form:input path="interviewDate" rows="4"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Last Date to Apply</form:label>
					</td>
					<td>
						<p><form:input path="lastDateToApply" rows="4"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Job Posted Date</form:label>
					</td>
					<td>
						<p><form:input path="jobPostedDate" rows="4" readonly="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Required SSC Percentage</form:label>
					</td>
					<td>
						<p><form:input path="jobEligibilityCriteria.sscPercentage"  readonly="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Required HSC Percentage</form:label>
					</td>
					<td>
						<p><form:input path="jobEligibilityCriteria.hscPercentage"  readonly="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Required Diploma Percentage</form:label>
					</td>
					<td>
						<p><form:input path="jobEligibilityCriteria.diplomaPercentage"  readonly="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Required Graduation Percentage</form:label>
					</td>
					<td>
						<p><form:input path="jobEligibilityCriteria.gradPercentage"  readonly="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Required Post Graduation Percentage</form:label>
					</td>
					<td>
						<p><form:input path="jobEligibilityCriteria.postGradPercentage"  readonly="true"/></p>
					</td>
				</tr>
				
				<tr >
					<td style="column-span: 2">
						<form:button value="Update" >Update</form:button>
					</td>
					<td></td>
				</tr>
				
			
			</table>
			
		</div>				
	</form:form>
	
</body>
</html>