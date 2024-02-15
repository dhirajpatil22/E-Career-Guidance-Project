 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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

	 .mywell{ 
		 background:linear-gradient(to right,#7BCCB5,#43C6DB,#81D8D0);
		 border: 1px solid black;
		  height: 600px;
          width: 400%; 
		   margin: auto;
         border: 3px solid #73AD21;
         padding: 10px;
		 
	} 
	
.center {
  margin-left: auto;
  margin-right: auto;
}	

.panel-default {
 opacity: 0.8;
 margin: auto;
  
}
.form-group.last {

margin-right: 100px;
  
}


</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container mywell">
    <div class="center" >
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
                                <button type="submit" class="btn btn-success">Login</button>
                                <a style="width: 25%" class="btn btn-success" href="/CareerGuidance/">Back</a>
                               
                            </div>
                        </div>
                    </form>
                </div>
				<div><h4>${requestScope.msg}</h4></div>
            </div>
        </div>
    </div>
</div> 
