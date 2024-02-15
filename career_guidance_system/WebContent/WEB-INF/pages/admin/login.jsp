<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
<style>
/* Bordered form */

/* CSS used here will be applied after bootstrap.css */

body { 
 background: url('/assets/example/bg_suburb.jpg') no-repeat center center fixed; 
 -webkit-background-size: cover;
 -moz-background-size: cover;
 -o-background-size: cover;
 background-size: cover;
}

.panel-default {
 opacity: 0.9;
 margin-top:30px;
}
.form-group.last {
 margin-bottom:0px;
}


</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-7">
            <div class="panel panel-default">
                <div class="panel-heading"> <strong class="">Login</strong>

                </div>
                <div class="panel-body">
                    <form class="form-horizontal" role="form" method="post">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-3 control-label">Username</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputEmail3" placeholder="Username" required name="username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-3 control-label">Password</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="inputPassword3" placeholder="Password" required name="password">
                            </div>
                        </div>
                        <div class="form-group last">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-success btn-sm">Login</button>
                                <button type="reset" class="btn btn-default btn-sm">Reset</button>
                            </div>
                        </div>
                    </form>
                </div>
				<div><h4>${requestScope.msg}</h4></div>
            </div>
        </div>
    </div>
</div> --%> 
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

<title>Admin Login</title>
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
		margin-top: 50px;
		border-color: black} */
	 .mywell{ 
		 background:linear-gradient(to right,#7BCCB5,#43C6DB,#81D8D0);
		 border: 1px solid black;
		 width: 45%;
		 margin-left: 24%;
		 margin-top: 20%;
		 /* padding-top: 15%; */
		 
	} 
	
	
	</style>
	
</head>
<body style="background: linear-gradient(to right,#7BCCB5,#43C6DB,#81D8D0)">
		<div class="container mywell"  style="opacity: 0.8">
		<!-- <fieldset> -->	
				<h2 style="padding-left: 39%">Login</h2>
		
		<form:form modelAttribute="student" cssClass="form-horizontal" action="form" method="POST">
		<div style="margin-bottom: 15%">
			<div class="form-group">
  			<label class="col-md-4 control-label">Email</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="inputEmail3" cssClass="form-control" style="width:100%"/>
    			</div>
 		 	</div>
			</div>
			<div class="form-group">
  			<label class="col-md-4 control-label">Password</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:password path="inputPassword3" cssClass="form-control" style="width:100%"/>
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