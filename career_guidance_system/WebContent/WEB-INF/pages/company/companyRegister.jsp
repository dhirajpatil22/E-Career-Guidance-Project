<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
		border-color: black}
	
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
	        	contactPersonName: {
	                validators: {
	                        stringLength: {
	                        min: 2,
	                        max: 20
	                    },
	                        notEmpty: {
	                        message: 'Please enter contact perSON NAME'
	                    }
	                }
	            },
	            pincode: {
	                validators: {
	                        stringLength: {
	                        min: 6,
	                        max: 6
	                    },
	                        notEmpty: {
	                        message: 'Please enter pincode'
	                    }
	                }
	            },
	            city: {
	                validators: {
	                        notEmpty: {
	                        	message: 'Please enter city'
	                    }
	                }
	            },
	            state: {
	                validators: {
	                        notEmpty: {
	                        	message: 'Please enter state'
	                    }
	                }
	            },
	            companyName: {
	                validators: {
	                        stringLength: {
	                        min: 4,
	                        max: 256
	                    },
	                        notEmpty: {
	                        message: 'Please enter company name'
	                    }
	                }
	            },
	            recruiterType: {
	                validators: {
	                    notEmpty: {
	                        message: 'choose company type'
	                              }
	                            }
	                      }, 
	                      gstStatus: {
	      	        validators: {
	      	            notEmpty: {
	      	                message: 'choose GST ststus'
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
	            alternateEmail: {
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

<body style="background:linear-gradient(to right,#2980b9,#2c3e50)">
	<div class="container" style="width: 60%">
	<fieldset>
	<legend style="text-align: center;color: white">Register as a Recruiter</legend>
	<form:form action="register"  method="POST" modelAttribute="register" cssClass="well form-horizontal" id="register_form">
	
	
			<div class="form-group">
  			<label class="col-md-4 control-label">Email Id</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  				<form:input path="email" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			
			<div class="form-group">
  			<label class="col-md-4 control-label">Alternate Email Id</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  				<form:input path="alternateEmail" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			
			<div class="form-group">
  			<label class="col-md-4 control-label">Password</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
  				<form:password path="password" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			
			<div class="form-group">
  			<label class="col-md-4 control-label">Company Name</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-briefcase"></i></span>
  				<form:input path="companyName" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
	 		
			<div class="form-group">  
			<label class="col-md-4 control-label">Recruiter Type</label>  
			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<form:radiobutton path="recruiterType" value="company" label="Company"/>&nbsp;&nbsp;&nbsp;
  				<form:radiobutton path="recruiterType" value="consultancy" label="Consultancy"/>
    			</div>
 		 	</div>
 		 	</div>
 		 	
 		 	<div class="form-group">  
			<label class="col-md-4 control-label">GST Status</label>  
			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<form:radiobutton path="gstStatus" value="true" label="Verified"/>&nbsp;&nbsp;&nbsp;
  				<form:radiobutton path="gstStatus" value="false" label="Not Verified"/>
    			</div>
 		 	</div>
 		 	</div>
 		 	
 		 	<div class="form-group">  
			<label class="col-md-4 control-label">Company Establishment Date (dd/mm/yyyy)</label>  
			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  				<form:input path="CompanyEstablishmentDate" cssClass="form-control"/>
    			</div>
 		 	</div>
 		 	</div>
 		 	
 		 	<div class="form-group">  
			<label class="col-md-4 control-label">Company Registration Number</label>  
			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-menu-hamburger"></i></span>
  				<form:input path="companyRegistrationNumber" cssClass="form-control"/>
    			</div>
 		 	</div>
 		 	</div>
 	 
 		 	<div class="form-group">
  			<label class="col-md-4 control-label">Company Description</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
  				<form:textarea path="description" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
 	 			 	
 		 	<div class="form-group">
  			<label class="col-md-4 control-label">Contact Person Name</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="contactPersonName" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			
			<div class="form-group">
  			<label class="col-md-4 control-label">Contact Person Designation</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="contactPersonDesignation" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>	
			
			<div class="form-group">
  			<label class="col-md-4 control-label">Office Address</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-text-background"></i></span>
  				<form:textarea path="address" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			
			<div class="form-group">  
			<label class="col-md-4 control-label"></label>
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<form:input path="pincode" cssClass="form-control" placeholder="Pincode"/>
  				<form:input path="city" cssClass="form-control" placeholder="City"/>
  				<form:input path="state" cssClass="form-control" placeholder="State"/>
  				<form:input path="country" cssClass="form-control" placeholder="Country"/>
    			</div>
 		 	</div>
			</div>
			
			<div class="form-group">
  			<label class="col-md-4 control-label">Landline</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
  				<form:input path="telephoneNo" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			
			<div class="form-group">
  			<label class="col-md-4 control-label">Mobile Number</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  				<form:input path="mobNo" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
		
			<div class="form-group">
  			<label class="col-md-4 control-label">Fax Number</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  				<form:input path="faxNo" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
 		 	
 		 	<div class="form-group">
  			<label class="col-md-4 control-label">Company Web Site</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-link"></i></span>
  				<form:input path="website" cssClass="form-control"/>
    			</div>
 		 	</div>
			</div>
			 
			<div class="form-group" >
  			<label class="col-md-4 control-label"></label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				
  				<input type="submit" value="register"/>
    			</div>
 		 	</div>
			</div>
	</form:form>
	</fieldset>	 
  </div> 

	
	
</body>
</html>
