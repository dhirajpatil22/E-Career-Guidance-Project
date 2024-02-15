<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Student Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
  <style type="text/css">
	/* fieldset {
		font-family: verdana, arial, helvetica, sans-serif; 
		color: black;
		border: black;
		height: 50%;
			}
	legend {
		margin-top: 30px;
		border-color: black} */
	 .mywell{ 
		 background:linear-gradient(to right,#7BCCB5,#43C6DB,#81D8D0);
		 border: 1px solid black;
		 width: 45%;
		 margin-left: 24%;
		 margin-top: 10%;
		 /* padding-top: 15%; */
		 
	} 
	
	
	</style>
	
</head>
<body style="background: linear-gradient(to right,#7BCCB5,#43C6DB,#81D8D0)">
		<div class="container mywell"  style="opacity: 0.8">
		<!-- <fieldset> -->	
				<h2 style="padding-left: 39%">Login</h2>
		
		<form:form modelAttribute="student" cssClass="form-horizontal" action="login" method="POST">
		<div style="margin-bottom: 15%">
			<div class="form-group">
  			<label class="col-md-4 control-label">Email</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="email" cssClass="form-control" style="width:100%"/>
    			</div>
 		 	</div>
			</div>
			<div class="form-group">
  			<label class="col-md-4 control-label">Password</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:password path="password" cssClass="form-control" style="width:100%"/>
    			</div>
 		 	</div>
 		 	</div>
 		 	<div class="form-group">
  			<label class="col-md-4 control-label"></label>
  			<div class="col-md-4">
    		<button style="width: 100%" type="submit" class="btn btn-success" >Login<span class="glyphicon glyphicon-send"></span></button>
    		<br><br>
    		<a style="width: 100%" class="btn btn-success" href="/CareerGuidance/">Back</a>
    		<span style="color: red;text-align: right;">${errormessage}</span>
    		
  			</div>
  			</div>
  			</div>
		</form:form>
		<!-- </fieldset> -->
		</div>	
</body>
</html>