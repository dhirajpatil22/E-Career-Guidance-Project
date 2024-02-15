<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<title>Cureer Guidence </title>
</head>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
	  
  }
  
</style>
<body style="background:linear-gradient(to right,#7BCCB5,#43C6DB,#81D8D0)">
	<nav class="navbar navbar-default">
  <div style="background:linear-gradient(to right,#7BCCB5,#43C6DB,#81D8D0)" class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button> 
      <a class="navbar-brand" href="#">Brand</a> </div>
    
    <!-- Collect the nav links, forms, and other content for toggling -->  
    
    <nav class="navbar navbar-inverse">
  <div style="background-color: #504A4B" class="container-fluid">
<div style="background-color: #504A4B" class="navbar-header">
<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span> 
</button>
<a class="navbar-brand" href="#">CareerGuidance</a>
</div>
<div style="background-color: #504A4B"  class="collapse navbar-collapse" id="myNavbar">
<ul class="nav navbar-nav">
<li><a href="#">Home</a></li>
<li><a href="#aboutus">About Us</a></li>
<li><a href="#feedback">Rate Us</a></li>
</ul>
<ul class="nav navbar-nav navbar-right">
<li class="dropdown">
<a id="signup" class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"></span>Sign Up <span class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href='<c:url value="student/register" />'>Student</a></li>
<li><a href="company/register">Company</a></li>
</ul></li>
<li class="dropdown">
<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-log-in"></span>Log In<span class="caret"></span></a>
<ul class="dropdown-menu">
<li><a href='<c:url value="student/login" />'>Student</a></li>
<li><a href="company/">Company</a></li>
<li><a href="admin/">Admin</a></li>
</ul>
</li>
</ul>
</div>
</div>
</nav>

      <!-- /.navbar-collapse --> 
  </div>
  <!-- /.container-fluid --> 
</nav>

<!-- HEADER -->
<header>
  <div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->	
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="<c:url value='/images/img8.jpg' />" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
          <h3>Our Motive</h3>
          <p>To Give Job To Students.</p>
        </div>
      </div>

      <div class="item">
        <img src="<c:url value='/images/img5.jpg' />" alt="Chania" width="460" height="345">
        <div class="carousel-caption">
          <h3>Our Motive</h3>
          <p>TO Give Proper Guidance To Students.</p>
        </div>
      </div>
    
      <div class="item">
        <img src="<c:url value='/images/img3.jpg' />" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
          <h3>Our Motive</h3>
          <p>To Give Job To Students.</p>
        </div>
      </div>

      <div class="item">
        <img src="<c:url value='/images/img2.jpg' />" alt="Flower" width="460" height="345">
        <div class="carousel-caption">
         <h3>Our Motive</h3>
          <p>TO Give Proper Guidance To Students.</p>
        </div>
      </div>
  
    </div>    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>



</header>

<section >
  <div class="row">
    <div class="col-lg-12 page-header text-center" id="page2">
      <h2>OUR TEAM</h2>
    </div>
  </div>
  <div class="container ">
    <div class="row">
      <div class="col-lg-4 col-sm-12 text-center"> <img class="img-circle" alt="140x140" style="width: 140px; height: 140px;" src="images/akash.jpg" data-holder-rendered="true">
        <h3>Akash Kolte</h3>
        <h5><b>Team Lead and Backend Developer</b></h5>
        <p>Strive for Progress,Not Perfection</p>
      </div>
      <div class="col-lg-4 col-sm-12 text-center"><img class="img-circle" alt="140x140" style="width: 140px; height: 140px;" src="images/dhiraj.jpeg" data-holder-rendered="true">
        <h3>Dhiraj Patil</h3>
        <h5><b>UI Developer</b></h5>
        <p>There are no shortcuts to any place worth going</p>
      </div>
       <div class="col-lg-4 col-sm-12 text-center"><img class="img-circle" alt="140x140" style="width: 140px; height: 140px;" src="images/sir.jpg" data-holder-rendered="true">
        <h3>Kashinath Patil Sir</h3>
        <h5><b>Project Guide</b></h5>
      </div>
    </div>
   <div class="row">
      <div class="col-lg-12 page-header text-center">
        <h2>Our Courses</h2>
      </div>
    </div>
    <div class="row">
    	<c:forEach items="${courses}" var="course">
    		<div class="col-6 col-lg-6">
        	<blockquote>
          		<p>${course.coursename}</p>
          	<small>${course.description}</small> </blockquote>
      		</div>
    	</c:forEach>
    
      <%-- <div class="col-6 col-lg-6">
        <blockquote>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
          <small>Someone famous in <cite title="Source Title">Source Title</cite></small> </blockquote>
      </div>
      <div class="col-6 col-lg-6">
        <blockquote>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
          <small>Someone famous in <cite title="Source Title">Source Title</cite></small> </blockquote>
      </div> --%>
    </div>
    
  </div>
  <div class="jumbotron">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-9 col-lg-9">
          <p class="lead">If you have no clue of what to do after graduation,you have landed at correct page.Follow us and Set your future in IT</p>
        </div>
        <div class=" text-center col-sm-6 col-lg-3 col-sm-offset-3 col-md-3 col-xs-offset-4 col-xs-5 col-lg-offset-0"> 
        	<a class="btn  btn-block btn-lg btn-success" href="#signup" title="">Sign up now!</a> 
        </div>
      </div>
    </div>
  </div>
  
  <!-- /container -->
  
  <div class="container" id="aboutus">
    <div class="row">
      <div class="col-lg-12 page-header text-center">
        <h2>ABOUT US</h2>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-6 col-lg-6">
        <h3>E-Learning</h3>
        <p> <i class="icon-desktop " >We envision a world where anyone, anywhere can transform their life by accessing the world’s best learning experience</i></p>
        <p><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#learndetails">View Details »</button></p>
      </div>
       

  <!-- Modal -->
  <div class="modal fade" id="learndetails" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">E-learning Details</h4>
        </div>
        <div style="background-color: yellow;color: red;font-family: sans-serif;font-size: 16px" class="modal-body">
        	1.Register With Us<br>
        	2.Complete Your Profile<br>
        	3.Explore our Courses<br>
        	4.Get Started with any of the Courses<br>
        	5.Complete your Daily Task with help of provided material<br>
        	6.Give Test at end of each module to be eligible for recruitment<br>
          <%-- <img src="<c:url value='images/elearn.png'/>" height="750px" width="550px"/> --%>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> 
      <div class="col-xs-6 col-lg-6">
        <h3>Company Recruitment</h3>
        <p> <i class="icon-desktop ">we envision a scalable, equitable, merit driven labor market providing credibility and access to talent and opportunity.Our mission is to establish one scientific and credible approach to measuring talent and matching it to opportunity.</i></p>
        <p><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#companydetails">View Details »</button></p>
      </div>
      <!-- Modal -->
  <div class="modal fade" id="companydetails" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Recruitment Details</h4>
        </div>
        <div  style="background-color: yellow;color: red;font-family: sans-serif;font-size: 16px" class="modal-body" class="modal-body">
        	1.Companies coming for Recruitment,first have to register with us<br>
        	2.Companies will Post their Job Requirements on our portal<br>
        	3.We will filter student profiles based on company requirements<br>4.Then we will share student profiles with company<br>
        	5.Company will conduct Recruitment based on their schedule<br>
        	6.And Students will directly get Mail regarding Results<br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> 
    </div>
  </div>
  <!-- / CONTAINER--> 
</section>
<div class="well"> </div>

<!-- FOOTER -->
<div class="container" id="feedback">
  <div class="row">
    <div class="col-lg-offset-3 col-xs-12 col-lg-6">
      <div class="jumbotron">
        <div class="row text-center">
          <div class="text-center col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <h2>Give feedback about us!</h2>
          </div>
          <div class="text-center col-lg-12"> 
            <!-- CONTACT FORM https://github.com/jonmbake/bootstrap3-contact-form -->
            <form role="form" id="feedbackForm" class="text-center">
              <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                <span class="help-block" style="display: none;">Please enter your name.</span></div>
              <div class="form-group">
                <label for="email">E-Mail</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email Address">
                <span class="help-block" style="display: none;">Please enter a valid e-mail address.</span></div>
              <div class="form-group">
                <label for="message">Message</label>
                <textarea rows="10" cols="100" class="form-control" id="message" name="message" placeholder="Message"></textarea>
                <span class="help-block" style="display: none;">Please enter a message.</span></div>
              <span class="help-block" style="display: none;">Please enter a the security code.</span>
              <button type="submit" id="feedbackSubmit" class="btn btn-primary btn-lg" style=" margin-top: 10px;"> Send</button>
            </form>
            <!-- END CONTACT FORM --> 
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="text-center">
  <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <p>Copyright © Career Guidance System. All rights reserved.</p>
      </div>
    </div>
  </div>
</footer>

<!-- / FOOTER --> 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.3.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.js"></script>
</body>
</html>
