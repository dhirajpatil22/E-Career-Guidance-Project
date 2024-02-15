<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" %>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="refresh" content="10">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>

<title>Career Guidance</title>
<!-- <SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT> -->
<style>
body {
    font-family: "Lato", sans-serif;
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: navajowhite;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: purple;
    background-color: white;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

#main {
    transition: margin-left .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

.myPar{
  	font-size: 24px;
  	font-family: sans-serif;
  }
</style>

</head>
<body style="background-color: cyan">
  <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a class="glyphicon glyphicon-home" href="#">&nbsp;Home</a>
  <a class="glyphicon glyphicon-user" href="profilecomplete">&nbsp;Profile</a>
  <a class="glyphicon glyphicon-education" href="course">&nbsp;MyCourses</a>
  <!-- <a class="glyphicon glyphicon-info-sign" href="#">&nbsp;MyTests</a> -->
  <a class="glyphicon glyphicon-tasks" href="todaystask">&nbsp;Today'sTask</a>
  <a class="glyphicon glyphicon-calendar" href="todaystest">&nbsp;Today'sTest</a>
  <a class="glyphicon glyphicon-off" href="logout">&nbsp;Logout</a>
</div>

<div id="main">
  <h2>Welcome ${sessionScope.student.fname}</h2>
  <span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; open</span>
</div>

<div class="container-fluid">
	<div class="col-md-2 "></div>
	<c:if test="${sessionScope.student.course.courseid > 0}"><div class="col-md-6"><b><h2><i>You Need to Visit Today's Task and Complete it.</i></h2></b></div></c:if>
	<div class="col-md-1"><b><i><span>${sessionScope.testwarnmsg}</span></i></b></div>
	<div class="col-md-1"><b><i><span class="text-danger">${sessionScope.profileerrmsg}</span></i></b></div>
	<%-- <div class="col-md-6"><img width="70%" src="<c:url value='/images/pl.png'></c:url>"></img></div> --%>
	<div class="col-md-1">
<%-- 	<h2>${sessionScope.student.course.courseid}</h2>
 --%>	
	</div>
  	<div class="col-md-4 myPar"><h1>Registered Course</h1><hr>
  	<c:if test="${sessionScope.student.course.courseid > 0}">
  	<h3>${sessionScope.student.course.coursename}</h3>
	<img alt="img" width="70%" src="<c:url value='${sessionScope.student.course.courseimg}'/>" />
	<br><p>${sessionScope.student.course.description}</p><br>
	<span class="text-warning"><b>${sessionScope.regcou}</b></span>
  	</c:if>
	</div>
</div>

<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
}
</script>
	
</body>
</html>