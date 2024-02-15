<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Courses</title>
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

<style>
  body {
      position: relative; 
  }
  
  .myPar{
  	font-size: 24px;
  	font-family: sans-serif;
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
  #section1 {padding-top:50px;height:500px;color: #fff; background-color: #1E88E5;}
  #section2 {padding-top:50px;height:500px;color: #fff; background-color: #673ab7;}
  #section3 {padding-top:50px;height:500px;color: #fff; background-color: #ff9800;}
  #section4 {padding-top:50px;height:500px;color: #fff; background-color: #00bcd4;}
  </style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Our Courses</a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="#section1">${courses[0].coursename}</a></li>
          <li><a href="#section2">${courses[1].coursename}</a></li>
          <li><a href="#section3">${courses[2].coursename}</a></li>
          <li><a href="#section4">${courses[3].coursename}</a></li>
        </ul>
      </div>
    </div>
  </div>
</nav>    

<%-- <div id="section1" style="background:<c:url value='/images/webdev.jpeg'></c:url> " class="container-fluid">
  <h1 style="font-size: 22px">${courses[0].coursename}</h1>
  <div>
  <img style="float:left;width:50%" src="<c:url value='/images/webdev.jpeg'></c:url>"></img>
  
  <p style="font-size: 20px">&nbsp;&nbsp;${courses[0].description}</p>
  </div>
  </div>
 --%>
 <div id="section1" class="container-fluid">
	<h1>${courses[0].coursename}</h1>
	<div class="col-md-6"><img width="70%" src="<c:url value='${courses[0].courseimg}'></c:url>"></img></div>
	<div class="col-md-2"><a class="button" style="float: inherit;" href="registerCourse?courseid=${courses[0].courseid}"><span>Get Started</span></a></div>
  	<div class="col-md-4 myPar"><p>${courses[0].description}</p></div>
</div>
 
 <div id="section2" class="container-fluid">
	<h1>${courses[1].coursename}</h1>
	<div class="col-md-6"><img width="70%" src="<c:url value='${courses[1].courseimg}'></c:url>"></img></div>
	<div class="col-md-2"><a class="button" style="float: inherit;" href="registerCourse?courseid=${courses[1].courseid}"><span>Get Started</span></a></div>
  	<div class="col-md-4 myPar"><p>${courses[1].description}</p></div>
</div>
<div id="section3" class="container-fluid">
  <h1>${courses[2].coursename}</h1>
  <div class="col-md-6"><img width="70%" src="<c:url value='${courses[2].courseimg}'></c:url>"></img></div>
  <div class="col-md-2"><a class="button" style="float: inherit;" href="registerCourse?courseid=${courses[2].courseid}"><span>Get Started</span></a></div>
  <div class="col-md-4 myPar"><p>${courses[2].description}</p></div>
</div>
<div id="section4" class="container-fluid">
  <h1>${courses[3].coursename}</h1>
  <div class="col-md-6"><img width="70%" src="<c:url value='${courses[3].courseimg}'></c:url>"></img></div>
  <div class="col-md-2"><a class="button" style="float: inherit;" href="registerCourse?courseid=${courses[3].courseid}"><span>Get Started</span></a></div>
  <div class="col-md-4 myPar"><p>${courses[3].description}</p></div>
</div>


</body>
</html>