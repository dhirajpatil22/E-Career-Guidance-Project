<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" session="true" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

<title>Insert title here</title>
</head>
<body style="background:linear-gradient(to right,#2980b9,#2c3e50)">

	<h2 style="text-align: center;color: white;"> Edit Company Profile </h2>
	
	<form:form method="post" modelAttribute="register">
		<div>
			
			<table>
				<tr>
					<td>
						<form:label path="">Company Id</form:label>
					</td>
					<td>
						<p><form:input path="companyId" readonly="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="email">Email Id</form:label>
					</td>
					<td>
						<p><form:input path="email"/></p>
					</td>
				</tr>
		 		
				<tr>
					<td>
						<form:label path="">Alternate Email Id</form:label>
					</td>
					<td>
						<p><form:input path="alternateEmail"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Password</form:label>
					</td>
					<td>
						<p><form:textarea path="password" rows="4" /></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Company Name</form:label>
					</td>
					<td>
						<p><form:input path="companyName"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Company type</form:label>
					</td>
					<td>
						<form:radiobutton path="recruiterType" value="consultancy" label="Consultancy"/><br>
						<form:radiobutton path="recruiterType" value="company" label="Company"/>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">GST Status</form:label>
					</td>
					<td>
						<form:radiobutton path="gstStatus" value="true" label="Verified"/><br>
  						<form:radiobutton path="gstStatus" value="false" label="Not Verified"/>
					</td>
				</tr>
				
				<%-- <tr>
					<td>
						<form:label path="">Company Establishment Date (dd/mm/yyyy)</form:label>
					</td>
					<td>
						<p><form:input path="CompanyEstablishmentDate"/></p>
					</td>
				</tr>
				 --%>
				<tr>
					<td>
						<form:label path="">Company Registration Number</form:label>
					</td>
					<td>
						<p><form:textarea path="companyRegistrationNumber" rows="4"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Company Description</form:label>
					</td>
					<td>
						<p><form:input path="description" rows="4"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Contact Person Name</form:label>
					</td>
					<td>
						<p><form:input path="contactPersonName" rows="4"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Contact Person Designation</form:label>
					</td>
					<td>
						<p><form:input path="contactPersonDesignation" rows="4" readonly="true"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Company Address</form:label>
					</td>
					<td>
						<p><form:textarea path="address"  rows="4"/></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path=""></form:label>
					</td>
					<td>
						<form:input path="pincode" cssClass="form-control" placeholder="Pincode"/><br>
		  				<form:input path="city" cssClass="form-control" placeholder="City"/><br>
		  				<form:input path="state" cssClass="form-control" placeholder="State"/><br>
		  				<form:input path="country" cssClass="form-control" placeholder="Country"/>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Telephone Number</form:label>
					</td>
					<td>
						<p><form:input path="telephoneNo"  /></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Mobile Number</form:label>
					</td>
					<td>
						<p><form:input path="mobNo" /></p>
					</td>
				</tr>
				
				<tr>
					<td>
						<form:label path="">Fax Number</form:label>
					</td>
					<td>
						<p><form:input path="faxNo"  readonly="true"/></p>
					</td>
				</tr> 
				
				<tr>
					<td>
						<form:label path="">Website</form:label>
					</td>
					<td>
						<p><form:input path="website"  /></p>
					</td>
				</tr> 
				
				<tr >
					<td style="column-span: 2">
						<form:button value="Update" >Update</form:button>
					</td>
					<td></td>
				</tr>
				
			
			</table>
			
		</div>				
	</form:form>
	
</body>
</html>