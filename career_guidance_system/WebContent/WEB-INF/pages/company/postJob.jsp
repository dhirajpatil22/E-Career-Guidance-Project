<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</head>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
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

input,textarea {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid,textarea.invalid {
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

<form id="regForm" method="post" action="/CareerGuidance/company/postJobProcess" modelAttribute="post_job">
  
  <h1>Post New Job</h1>
  <!-- One "tab" for each step in the form: -->
   
  <div class="tab">
     <p>Company Id : <input value=${sessionScope.company.companyId} readonly="readonly" oninput="this.className = ''" name="cId" ></p> 
     <p><input placeholder="Job Title" oninput="this.className = ''" name="jobTitle"></p>
    <p><textarea placeholder="Job Description" oninput="this.className = ''" name="jobDescription"></textarea></p>
  </div>
 
    <div class="tab">
    <p><input placeholder="Vacancies" oninput="this.className = ''" name="vacancies"></p>
    <p><input placeholder="Job Location" oninput="this.className = ''" name="jobLocation"></p>
    <p><input placeholder="Job Type (Marketing/Developer/Tester)" oninput="this.className = ''" name="jobType"></p>
  </div>
    
  <div class="tab">
    <p><input placeholder="Salary" oninput="this.className = ''" name="salary"></p>
    <p><input placeholder="Interview Location" oninput="this.className = ''" name="interviewLocation"></p>
  </div>
  
  <div class="tab">
     <p>Interview Date <input type="date" data-date-inline-picker="false" data-date-open-on-focus="true" name="interviewDate" oninput="this.className = ''"/></p>
 	 <p>Last Date to Apply <input type="date" data-date-inline-picker="false" data-date-open-on-focus="true" name="lastDateToApply" oninput="this.className = ''"/></p>
     <p><input placeholder="Skills Required" oninput="this.className = ''" name="requiredSkills" type="requiredSkills"></p>
  </div>
  
  <div class="tab">Eligibility Criteria:
     <p>SSC Percentage <input name="sscPercentage" oninput="this.className = ''"/></p>
 	 <p>HSC Percentage <input name="hscPercentage" oninput="this.className = ''"/></p>
 	 <p>Diploma Percentage <input name="diplomaPercentage" oninput="this.className = ''"/></p>
 	 <p>Graduation Percentage <input name="gradPercentage" oninput="this.className = ''"/></p>
 	 <p> Post Graduation Percentage <input name="postGradPercentage" oninput="this.className = ''"/></p>
  </div>
       
  
  <div style="overflow:auto;">
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
  </div>
</form>

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
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
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
    document.getElementById("regForm").submit();
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
</script>

</body>
</html>
