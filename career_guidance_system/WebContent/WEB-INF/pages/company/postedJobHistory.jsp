<%@page import="org.aspectj.lang.annotation.After"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<jsp:useBean id="now" class="java.util.Date"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
<body>

	
	<h1 style="margin-left: 50px;">${history_jobs}</h1>
	<hr style="height: 12px;
    	border: 0;
    	box-shadow: inset 0 12px 12px -12px rgba(0, 0, 0, 0.5);">	
	
	<c:forEach var="job" items="${his_jobs}">
			<br>
			<fieldset style="border:1px solid #999; box-shadow:0 0 8px #999;padding:6px; width: 92%; margin-left: 50px;">	
				<div class="row" >
					<div class="col-sm-3 col-md-6 col-lg-4" style="font-size: 20px;background-color: #D3D3D3; width: 20%">
						${job.jobTitle}
					</div>
					<div class="col-sm-9 col-md-6 col-lg-8" style="font-size: 14px; width: 25%">
						<label>Job posted date : </label> ${job.jobPostedDate}<br>
						<label>Last date to apply: </label> ${job.lastDateToApply}<br>
						<label>Interview date : </label> ${job.interviewDate}
					</div>				
					<div class="column" style="float:left; font-size: 14px;width: 35%">
						<label>Interview Location : </label> ${job.interviewLocation}<br>
						<label>Vacancies : </label> ${job.vacancies}<br>
						<c:choose>
    						<c:when test="${job.lastDateToApply lt now}">
        						<b>Active</b> : No <br>
    						</c:when>    
    						<c:otherwise>
        						<b>Active</b> : Yes<br>
    						</c:otherwise>
						</c:choose>
					</div>
					<div class="column" style="float:left; font-size: 14px;  width: 20">
						<p><a href="editJob/${job.jobId}" >Edit Job</a></p>
					</div>
				</div>
			</fieldset>
	</c:forEach>

</body>
</html>