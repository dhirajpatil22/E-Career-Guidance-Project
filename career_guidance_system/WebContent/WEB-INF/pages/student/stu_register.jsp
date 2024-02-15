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
	<!-- <link rel="stylesheet" href="css/bootstrap.css"> -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
  
<title>Register</title>
	<style type="text/css">
	fieldset {
		font-family: verdana, arial, helvetica, sans-serif; 
		color: black;
		
			}
	legend {
		margin-top: 50px;
		border-color: black}
	 .mywell{
		  background:yellow; 
		 /* background:linear-gradient(to right,rgba(255,0,0,0),rgba(255,0,0,1)); */
	} 
	
	
	</style>
	<script>
	$(document).ready(function() {
	    $('#register_form').bootstrapValidator({
	        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	            fname: {
	                validators: {
	                        stringLength: {
	                        min: 2,
	                    },
	                        notEmpty: {
	                        message: 'Please supply your first name'
	                    }
	                }
	            },
	             lname: {
	                validators: {
	                     stringLength: {
	                        min: 2,
	                    },
	                    notEmpty: {
	                        message: 'Please supply your last name'
	                    }
	                }
	            },
	            email: {
	                validators: {
	                    notEmpty: {
	                        message: 'Please supply your email address'
	                    },
	                    emailAddress: {
	                        message: 'Please supply a valid email address'
	                    }
	                    
	                }
	            },
	            password:{
					validators:{
						notEmpty:{
							message: 'Please supply your password'
							},
						stringLength:{
							min:8,
							},
						regexp:{
							regexp :  "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})",
							message: 'Password must contain atleast 1 lowercase,1 uppercase,1 numeric,1 special character:'
							}
							
						}
		            }
	            }
	        })});
	</script>
</head>

<body style="background:cyan">
	<div class="container" style="background:yellow;margin:18%">
	<fieldset >
	<legend>Register With Us Today!</legend>
	<form:form modelAttribute="student" cssClass="well mywell form-horizontal" id="register_form"  action="register" method="POST">
			<div class="form-group">
  			<label class="col-md-4 control-label">First Name</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="fname" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			<div class="form-group">
  			<label class="col-md-4 control-label">Last Name</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="lname" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			<div class="form-group">
  			<label class="col-md-4 control-label">Email</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  				<form:input path="email" cssClass="form-control"/>
  				<span style="color:red">${emailmsg}</span>
    			</div>
 		 	</div>
 		 	</div>
 		 	<div class="form-group">
  			<label class="col-md-4 control-label">Password</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:password path="password" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			<div class="form-group">
  			<label class="col-md-4 control-label"></label>
  			<div class="col-md-4">
    		<button type="submit" class="btn btn-success" >Register<span class="glyphicon glyphicon-send"></span></button>
  </div>
</div>			
		</div>
	</form:form>
	</fieldset>
	</div>
</body>
</html>