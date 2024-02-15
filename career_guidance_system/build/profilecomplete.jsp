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
  
<title>student_profile</title>
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
$("#address").on("change",function(){
	var country = $("#country").val();
	var city = $("#city").val();
	var state = $("#state").val();

	if(country == '--select country--')
		{
			$("#conmsg").text('Please Select Country');
			$("#address").val('');
		}
	else{
		$("#conmsg").text('');
		}
	if(state == '--select state--')
	{
		$("#stamsg").text('Please Select State');
		$("#address").val('');
	}
	else{
		$("#stamsg").text('');
		}
	if(city == '--select city--')
	{
		$("#citmsg").text('Please Select City');
		$("#address").val('');
	}
	else{
		$("#citmsg").text('');
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
				if(x < 2014 || x < 1947)
					{
						$("#hscyearerrmsg").text('you are not eligible');
						$("#hscyear").val('');
					}
			});
			$("#hscpercent").on("change",function(){
				y = parseInt(document.getElementById('hscpercent').value);
				if(y>100 || y < 40)
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
}); 

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

          
});
</script>

<body>
<style>
table {
    border-collapse: collapse;
    width:50%;
    background-color:#d9d9d9;
    margin-left:350px;
    margin-top:10px;  
    top:25%;
    left:25%;
}

input,textarea{
	width: 200px;
	height: 25px;
}



td {
    text-align: center;
    padding: 8px;
}

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
  float: right;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>

<h1>Complete Your Profile:</h1>
</head>
<body style="background:linear-gradient(to right,#2980b9,#2c3e50)">

	<h2 style="text-align: center;color: white;"> Edit Company Profile </h2>
	
	<form:form modelAttribute="student" cssClass="form-horizontal" id="proform" method="POST"> 
		<div>
			
			<table>
				<tr>
					<td>
						<form:label path="">Email Id</form:label>
					</td>
					<td>
						<p><form:input path="email"/></p>
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="">Gender</form:label>
					</td>
					<td>
					<table>
					<tr><td><form:radiobutton path="gender" value="male" label="Male"/></td>					
					<tr><td><form:radiobutton path="gender" value="female" label="Female"/></td></tr>
				   <tr><td><form:radiobutton path="gender" value="other" label="Other"/></td></tr></table>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Date of Birth</form:label>
					</td>
					<td>
						<p><form:input type="date" id="dob" path="dob" required="true"/></p>
					</td>
				</tr>
		 		
				<tr>
					<td>
						<form:label path="">Contact</form:label>
					</td>
					<td>
						<p><form:input id="phone" path="contact" placeholder="phone"  required="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Contry</form:label>
					</td>
					<td>
						<p><form:input id="country" path="country"  required="true"  placeholder="contry name"/></p>
					</td>
				</tr>
				<tr>
					<td>
						<form:label path="">State</form:label>
					</td>
					<td>
						 <p><form:input id="state" path="state"  required="true"  placeholder="state  name"/></p>

					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">City</form:label>
					</td>
					<td>
						 <p><form:input id="city" path="city"  required="true"  placeholder="city name"/></p>

					</td>
				</tr>
				<tr>
					<td>
						<form:label path="">Address</form:label>
					</td>
					<td>
						 <p><form:input id="address" path="address"  required="true"  placeholder="address"/></p>

					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">SSC Year</form:label>
					</td>
					<td>
						<form:input id="sscyear" value='' path="sscyear" placeholder="ssc passing year"   required="true"/>

					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">SSC Percentage</form:label>
					</td>
					<td>
  				<form:input id="sscpercent" value='' path="sscpercent" placeholder="ssc percentage"   required="true"/>
  					
				</tr>
				
					<tr>
					<td>
						<form:label path="">HSC Year</form:label>
					</td>
					<td>
						<form:input id="hscyear" value='' path="hscyear" placeholder="hsc passing year"  />

					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Hsc Percentage</form:label>
					</td>
					<td>
  				<form:input id="hscpercent" value='' path="hscpercent" placeholder="hsc percentage" />
  					
				</tr>
				
					<tr>
					<td>
						<form:label path="">Diploma Year</form:label>
					</td>
					<td>
						<form:input id="diplomayear" value='' path="diplomayear" placeholder="diploma passing year"  />

					</td>
				</tr>
				 <tr>
					<td>
						<form:label path="">Diploma Stream</form:label>
					</td>
					<td>
						<form:input id="diplomastream" value='' path="diplomastream" placeholder="diploma stream" />

					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Diploma Percentage</form:label>
					</td>
					<td>
  				<form:input id="diplomapercent" value='' path="diplomapercent" placeholder="diploma percentage" />
  					
				</tr>
				
						<tr>
					<td>
						<form:label path="">Graduation Year</form:label>
					</td>
					<td>
						<form:input id="Gradyear" value='' path="Gradyear" placeholder="Graduation passing year"/>

					</td>
				</tr>
				 <tr>
					<td>
						<form:label path="">Graduation Stream</form:label>
					</td>
					<td>
						<form:input id="Gradstream" value='' path="Gradstream" placeholder="Graduation stream" />

					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Graduation Percentage</form:label>
					</td>
					<td>
  				<form:input id="Gradpercent" value='' path="Gradpercent" placeholder="Graduation percentage"/>
  					
				</tr>
					<tr>
					<td>
						<form:label path="">Graduation Course</form:label>
					</td>
					<td>
  				<form:input id="Gradcourse" value='' path="Gradcourse" placeholder="Graduation course" />
  					
				</tr>
				
						<tr>
					<td>
						<form:label path="">Post Graduation Year</form:label>
					</td>
					<td>
						<form:input id="pgyear" value='' path="pgyear" placeholder="Post Graduation passing year" />

					</td>
				</tr>
				 <tr>
					<td>
						<form:label path=""> Post Graduation Stream</form:label>
					</td>
					<td>
						<form:input id="pgstream" value='' path="pgstream" placeholder="Post Graduation stream"  />

					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Post Graduation Percentage</form:label>
					</td>
					<td>
  				<form:input id="pgpercent" value='' path="pgpercent" placeholder="Post Graduation percentage" />
  					
				</tr>
					<tr>
					<td>
						<form:label path="">Post Graduation Coarse</form:label>
					</td>
					<td>
  				<form:input id="pgcourse" value='' path="pgcourse" placeholder="Post Graduation course"/>
  					
				</tr>
				
				
				<tr >
					<td style="column-span: 2">
						<form:button value="submit" >Submit</form:button>
					</td>
					<td></td>
				</tr>
				
			
			</table>
			
		</div>				
	</form:form>

</body>
</html>
