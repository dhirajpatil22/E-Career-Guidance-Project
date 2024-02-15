<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>

<style type="text/css">
caption{
	text-align: center;
	display: table-caption;
	color: black;
	font-size: 16px;
}
table, th, td {
    border: 1px solid black;
}
 .button {
  border-radius: 4px;
  background-color: green;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

</style>
</head>
<body>

<div class="container">
<c:if test="${sessionScope.student.course.courseid > 0}">
<table class="table table-hover">
<caption><b>Today's Task</b></caption>
<tr><th>ChapterName</th><th>Description</th><th>Links for Studying</th></tr>
<c:forEach var="task" items="${sessionScope.task}">
	<tr>
	<td>${task.chaptername}</td>
	<td>${task.description}</td>
	<td><a href="${task.websitelinks}">${task.websitelinks}</a></td>
	</tr>
	<c:set var="tid" value="${task.testid.testid}"/>
</c:forEach>
</table>
<a class="button" href="taskcomplete?testid=${tid}"><span>TaskCompleted>></span></a>
</c:if>	
<a class="button" href="http://localhost:7070/CareerGuidance/student/profile"><span>Back</span></a>
</div>
</body>
</html>