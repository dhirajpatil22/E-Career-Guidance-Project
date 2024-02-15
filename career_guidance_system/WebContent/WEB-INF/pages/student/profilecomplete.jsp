<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.5.3/js/bootstrapValidator.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
 
  	<script src="<c:url value='/js/countries.js'></c:url>"></script>
  
<title>Regi</title>
<script type="text/javascript">
$(document).ready(
		function(){
$("#dob").on("change",function(){
	var date = new Date();
	var dt = new Date(document.getElementById("dob").value);

	if((date.getFullYear() - dt.getFullYear()) < 18)
		{
			alert("Age must be greater than 18");
			$("#dob").val('');
			$("#dob").focus();
			return false;
		}
	return true;
		
	
});
 $("#phone").on("change",function(){
	var phone = document.getElementById("phone").value;
	 phone = phone.replace(/[^0-9]/g,'');
	 if (phone.length != 10)
		 {
		 alert('Phone number must be 10 digits.');
         $('#phone').val('');
         $('#phone').focus();
		 }
	
});

 
$("#sscyear").on("change",function(){
	console.log('In SSC YEAR');
	x = parseInt(document.getElementById('sscyear').value);
	console.log(x);
	console.log(typeof(x));
	console.log(sscyear==2018);
	if(x > 2014 || x < 1947 || x==0)
	{
		console.log('IN IF');
		$("#sscyearerrmsg").text('you are not eligible');
		alert("Not Eligible")
		$("#sscyear").val('');
		}
});
$("#sscpercent").on("change",function(){
	console.log('In SSC PERCENT');
	y = parseInt(document.getElementById('sscpercent').value);
	if(y > 110 || y < 40 || y==0.0)
	{
		$("#sscpererrmsg").text('you are not eligible');
		alert("Not Eligible");
		$("#sscpercent").val('');
		}
});

$("#hs1").hide();
$("#hs2").hide();

$("#hsc").click(function(){
	if($("#hsc").prop("checked")==true){
		$("#hs1").show();
		$("#hs2").show();
		 $("#hscyear").on("change",function(){
				x = parseInt(document.getElementById('hscyear').value);
				if(x > 2014 || x < 1947)
					{
						$("#hscyearerrmsg").text('you are not eligible');
						$("#hscyear").val('');
					}
			});
			$("#hscpercent").on("change",function(){
				y = parseInt(document.getElementById('hscpercent').value);
				if(y>110 || y < 40)
					{
						$("#hscpererrmsg").text('you are not eligible');
						$("#hscpercent").val('');
					}
			});
					
	}
	else
		{
		$("#hscyear").val('0');
		$("#hscpercent").val('0.0');
		$("#hs1").hide();
		$("#hs2").hide();
								
		}
		});
	/* $("#hs1").toggle(this.checked);
	$("#hs2").toggle(this.checked); *//* 
}); */

$('input[type="checkbox"]').click(function(){
    if($(this).prop("checked") == true){
        
        $("#my").show();
              
        $("#diplomayear").val("");
        $("#diplomastream").val("");
        $("#diplomapercent").val("");
        
        $("#diplomayear").on("blur",function(){
        if($("#diplomayear").val()=="")
        	{
        $("#diplomayearerror").text("pls enter this filled");
        	}
        else
        	{
        	$("#diplomayearerror").text("");}
    });
        
    
        $("#diplomastream").on("blur",function(){
            if($("#diplomastream").val()=="")
            	{
            $("#diplomastreamerror").text("pls enter this filled");
            	}
            else
            	{
            	$("#diplomastreamerror").text("");}
        });
        
        
        
        $("#diplomapercent").on("blur",function(){
            if($("#diplomapercent").val()=="")
            	{
            $("#diplomapercenterror").text("pls enter this filled");
            	}
            else
            	{
            	$("#diplomapercenterror").text("");}
        });
        
    
    
    }
    else
    	{
    	 $("#diplomayear").val("0");
         $("#diplomastream").val("NA");
         $("#diplomapercent").val("0.00");
        $("#my").hide();
    	}
     });
   
     if($("#hsc").prop("checked")==false)
         {
			$("#diploma").attr("required",true);
         }

     $("#gradyear").val("");
     $("#gradstream").val("");
     $("#gradpercent").val("");


     $("#gradyear").on("blur",function(){
     if($("#gradyear").val()<1947)
     	{
     	$("#gradyear").val("");
     	$("#gradyearerror").text("pls enter year gretter than 1947");
         
     	}else
     		{
     		$("#gradyearerror").text("");
     	    	
     		}
     });




     $("#gradpercent").on("blur",function(){
     	if($("#gradpercent").val()=="")
     		{
     		
     		$("#gradpercenterror").text("pls enter filled");
     	    
     		
     		}else
     			{
     			$("#gradpercenterror").text("");
     		    	
     			}
     	});



     $("#gradstream").on("blur",function(){
     	if($("#gradstream").val()=="")
     		{
     	
     		$("#gradstreamerror").text("pls enter stream");
     	    
     		
     		}else
     			{
     			$("#gradstreamerror").text("");
     		    	
     			}
     	});


     $("#gradcourse").on("blur",function(){
     	if($("#gradcourse").val()=="")
     		{
     	
     		$("#gradcourseerror").text("pls enter course");
     	    
     		
     		}else
     			{
     			$("#gradcourseerror").text("");
     		    	
     			}
     	});

     $("#postgradyear").val("0");
     $("#postgradstream").val("NA");
     $("#postgradpercent").val("0.00");
     $("#postgradcourse").val("NA");


     $('#pg').click(function(){
         if($(this).prop("checked") == true){
             
             $("#mypg").show();
                   
             $("#postgradyear").val("");
             $("#postgradstream").val("");
             $("#postgradpercent").val("");
             $("#postgradcourse").val("");
             
             $("#postgradyear").on("blur",function(){
             if($("#postgradyear").val()=="")
             	{
             $("#postgradyearerror").text("pls enter this filled");
             	}
             else
             	{
             	$("#postgradyearerror").text("");}
         });
             
         
             $("#postgradstream").on("blur",function(){
                 if($("#postgradstream").val()=="")
                 	{
                 $("#postgradstreamerror").text("pls enter this filled");
                 	}
                 else
                 	{
                 	$("#postgradstreamerror").text("");}
             });
             
             
             
             $("#postgradpercent").on("blur",function(){
                 if($("#postgradpercent").val()=="")
                 	{
                 $("#postgradpercenterror").text("pls enter this filled");
                 	}
                 else
                 	{
                 	$("#postgradpercenterror").text("");}
             });
             
             $("#postgradcourse").on("blur",function(){
                 if($("#postgradpercent").val()=="")
                 	{
                 $("#postgradcourseerror").text("pls enter this filled");
                 	}
                 else
                 	{
                 	$("#postgradcourseerror").text("");}
             });
             
         }
         else
         	{
         	 $("#postgradyear").val("0");
              $("#postgradstream").val("NA");
              $("#postgradpercent").val("0.00");
              $("#postgradcourse").val("NA");
              $("#mypg").hide();
         	}
                });

        	

          
});
</script>

<style>
* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
}

#regForm {
  background-color: #ffffff;
  margin: 100px auto;
  font-family: Raleway;
  padding: 40px;
  width: 70%;
  min-width: 300px;
}

h1 {
  text-align: center;  
}

input,select {
  padding: 10px;
  width: 500%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;  
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #4CAF50;
}
</style>
<body>

<%-- <form id="regForm" action="/action_page.php">
 --%>  <h1>Complete Your Profile:</h1>
  <!-- One "tab" for each step in the form: -->
  <div class="container">
	<form:form modelAttribute="student" cssClass="form-horizontal" id="proform" method="POST">  
	
  <div class="tab form-group col-md-4 control-label"><b style="font-size: 20px">Personal Details</b>:
  <hr>
 	<div class="form-group">
  			<label class="col-md-4 control-label">Reg no</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="regno" readonly="true"/>
    			</div>
 		 	</div>
 	</div>
 	<div class="form-group">
  			<label class="col-md-4 control-label">Email</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="email" readonly="true"/>
    			</div>
 		 	</div>
 	</div>
 	<div class="form-group">
  			<label class="col-md-4 control-label">Fname</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="fname" readonly="true"/>
    			</div>
 		 	</div>
 	</div>
 	<div class="form-group">
  			<label class="col-md-4 control-label">Lname</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input path="lname" readonly="true"/>
    			</div>
 		 	</div>
 	</div>
 	<div class="form-group">
  				<form:hidden path="password" readonly="true"/>
    			</div>
 	
 	
 	
 	<div class="form-group">
  			<label class="col-md-4 control-label">Gender</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  	<form:select path="gender"><form:option value="Male">Male</form:option><form:option value="Female">Female</form:option><form:option value="Other">Other</form:option></form:select>
    			</div>
 		 	</div>
 	</div>
 	 <div class="form-group">
  			<label class="col-md-4 control-label">Date of Birth</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  			<form:input type="date" id="dob" path="dob" cssStyle="width:140%" required="true"/>
    			</div>
 		 	</div>
 	</div> 
 		<div class="form-group">
  			<label class="col-md-4 control-label">Contact</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input id="phone" path="contact" placeholder="phone" required="true"/>
    			</div>
 		 	</div>
 	</div>	
    
    
  </div>
   <div class="tab form-group col-md-4 control-label"><b style="font-size: 20px">Address</b>:
  <hr>
    <div class="form-group">
  			<label class="col-md-4 control-label">Country</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input id="country" path="country" cssStyle="width:400%" required="true" placeholder="enter country"/>
  				<span style="color:red" id="conmsg"></span> 
    			</div>
 		 	</div>
  </div>
  <div class="form-group">
  			<label class="col-md-4 control-label">State</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input id="state" path="state" cssStyle="width:400%" required="true" placeholder="enter state"/>
  				<span style="color:red" id="stamsg"></span>
    			</div>
 		 	</div>
  </div>
  <div class="form-group">
  			<label class="col-md-4 control-label">City</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input id="city" path="city" cssStyle="width:400%" required="true" placeholder="enter city"/>
  				<span style="color:red" id="citmsg"></span>
    			</div>
 		 	</div>
  </div>
  <div class="form-group">
  			<label class="col-md-4 control-label">Address</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input id="address" path="address" placeholder="address"  cssStyle="width:400%" required="true"/>
    			</div>
 		 	</div>
  </div>
  </div>
  <div class="tab form-group col-md-4 control-label"><b style="font-size: 20px">SSC</b>:
  <hr>
  	<div class="form-group">
  			<label class="col-md-4 control-label">SSC Year</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input id="sscyear" value='' path="sscyear" placeholder="ssc passing year"  cssStyle="width:400%" required="true"/>
  				<span style="color:red" id="sscyearerrmsg"></span>
    			</div>
 		 	</div>
  	</div>
  	<div class="form-group">
  			<label class="col-md-4 control-label">SSC Percentage</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  				<form:input id="sscpercent" value='' path="sscpercent" placeholder="ssc percentage"  cssStyle="width:400%" required="true"/>
  				<span style="color:red" id="sscpererrmsg"></span>
    			</div>
 		 	</div>
  	</div>  
  </div>
  <div class="tab form-group col-md-4 control-label"><b style="font-size: 20px">HSC</b>:
  <hr>
  	<div class="form-group">
  			  
  			<div>
  				<label class="col-md-4 control-label">Tick checkbox if you have done your hsc</label>	
  				<form:checkbox path="hsc" id="hsc"/>
 		 	</div>
  	</div>
  	<div id="hs1" class="form-group">
  			<label class="col-md-4 control-label">HSC Year</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<form:input id="hscyear"  path="hscyear"  cssStyle="width:400%" required="true"/>
  				<span style="color:red" id="hscyearerrmsg"></span>
    			</div>
 		 	</div>
  	</div>
  	<div id="hs2" class="form-group">
  			<label class="col-md-4 control-label">HSC Percent</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<form:input id="hscpercent"  path="hscpercent"  cssStyle="width:400%" required="true"/>
  				<span style="color:red" id="hscpererrmsg"></span>
    			</div>
 		 	</div>
  	</div>
  </div>
  <div class="tab">Tick this checkbox if you have done diploma<input type="checkbox"  id="diploma" style="width:50px" />
   <div id="my" hidden="true"> 
   <div class="form-group">
  			<label class="col-md-4 control-label">diploma year</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  				<form:input path="diplomayear" id="diplomayear" placeholder="diploma year"  cssStyle="width:400%" />
  				<span style="color:red" id="diplomayearerror"></span>
    			</div>
 		 	</div>
 		 </div>	
 		 	
 		 	 <div class="form-group">
  			<label class="col-md-4 control-label">diploma stream</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
  				<form:input path="diplomayear" id="diplomastream" placeholder="diploma stream"  cssStyle="width:400%" />
  				<span style="color:red" id="diplomastreamerror"></span>
    			</div>
 		 	</div>
 		 	
 	</div>	
 	
 	 <div class="form-group">
  			<label class="col-md-4 control-label">diploma percentage</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i >%</i></span>
  				<form:input path="diplomapercent" id="diplomapercent" placeholder="diploma percentage"  cssStyle="width:400%" />
  				<span style="color:red" id="diplomapercenterror"></span>
    			</div>
 		 	</div>
    
     	
    </div>
    </div>
    </div>
    <div class="tab form-group col-md-4 control-label">
  		Graduation Details:  
   <div class="form-group">
  			<label class="col-md-4 control-label">graduation year</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  				<form:input path="gradyear" id="gradyear" placeholder="graduation year" required="true"  cssStyle="width:400%" />
  				<span style="color:red" id="gradyearerror"></span>
    			</div>
 		 	</div>
 		 </div>	
 		 	
 		 	 <div class="form-group">
  			<label class="col-md-4 control-label">graduation stream</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
  				<form:input path="gradstream" id="gradstream" placeholder="e.g E&TC,MECH,CS,IT etc" required="true" cssStyle="width:400%" />
  				<span style="color:red" id="gradstreamerror"></span>
    			</div>
 		 	</div>
 		 	
 	</div>	
 	
 	 <div class="form-group">
  			<label class="col-md-4 control-label">graduation percentage</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i >%</i></span>
  				<form:input path="gradpercent" id="gradpercent" placeholder="graduation percentage" required="true"  cssStyle="width:400%" />
  				<span style="color:red" id="gradpercenterror"></span>
    			</div>
 		 	</div>
    
     	
    </div>
  
  
  
   <div class="form-group">
  			<label class="col-md-4 control-label">graduation course</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
  				<form:input path="gradcourse" id="gradcourse" placeholder="e.g B.E/B.TECH/BSC etc" required="true" cssStyle="width:400%" />
  				<span style="color:red" id="gradcourseerror"></span>
    			</div>
 		 	</div>
 		 	
 	</div>
  </div>
  <div class="tab">Postgraduation:<input type="checkbox"  id="pg"   required="true" Style="width:50px%" />
    <div id="mypg" hidden>
   <div class="form-group">
  			<label class="col-md-4 control-label"> postgraduation year</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  				<form:input path="pgyear" id="postgradyear" placeholder=" postgraduation year"  cssStyle="width:100%" />
  				<span style="color:red" id="postgradyearerror"></span>
    			</div>
 		 	</div>
 		 </div>	
 		 	
 		 	 <div class="form-group">
  			<label class="col-md-4 control-label">postgraduation stream</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
  				<form:input path="pgstream" id="postgradstream" placeholder="postgraduation stream"  cssStyle="width:400%" />
  				<span style="color:red" id="postgradstreamerror"></span>
    			</div>
 		 	</div>
 		 	
 	</div>	
 	
 	 <div class="form-group">
  			<label class="col-md-4 control-label">postgraduation percentage</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i >%</i></span>
  				<form:input path="pgpercent" id="postgradpercent" placeholder="post graduation percentage"  cssStyle="width:400%" />
  				<span style="color:red" id="postgradpercenterror"></span>
    			</div>
 		 	</div>
    
     	
    </div>
  
  
  
   <div class="form-group">
  			<label class="col-md-4 control-label">postgraduation course</label>  
  			<div class="col-md-4 inputGroupContainer">
  				<div class="input-group">
  				<span class="input-group-addon"><i class="glyphicon glyphicon-education"></i></span>
  				<form:input path="pgcourse" id="postgradcourse" placeholder="postgraduation course"  cssStyle="width:400%" />
  				<span style="color:red" id="postgradcourseerror"></span>
    			</div>
 		 	</div>
 		 	
 	</div>	
  
  </div>
 </div>
 
<!--   </div>
 -->  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
      <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
    </div>
  </div>
  <!-- Circles which indicates the steps of the form: -->
  <div style="text-align:center;margin-top:40px;">
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span>
    <span class="step"></span> 
  </div>
  </form:form>
  </div>
  <button onclick="history.back();" >Back</button>
<%-- </form> --%>

<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the crurrent tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  if($("#hsc").prop("checked")==false)
  {
		$("#diploma").prop("checked",true);
		//document.getElementById("diploma").required = true;
		$("#diploma").attr("disabled","disabled");
		$("#my").show();
		$("#diplomayear").val('');
		$("#diplomastream").val('');
		$("#diplomagrad").val('');
		
  }
  else{
	  $("#diploma").prop("checked",false);
		//document.getElementById("diploma").required = true;
		$("#diploma").attr("disabled",false);
		$("#my").hide();
		/* $("#diplomayear").val('');
		$("#diplomastream").val('');
		$("#diplomagrad").val('');
		 */

	  }
  //... and run a function that will display the correct step indicator:
  //fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("proform").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
  
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}

function validateDate()
{

var date = new Date();
var dt = new Date(document.getElementById("dob").value);

if((date.getFullYear() - dt.getFullYear()) < 18)
	{
		alert("Age must be greater than 18");
		$("#dob").focus();
	}

	}


</script>

</body>
</html>
