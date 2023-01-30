<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Model.City"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.CreateConnection"%>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8">
<title>E-Serviceman | Hire</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://webthemez.com" />
<!-- css -->
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="simple-line-icons/css/simple-line-icons.css">
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="css/flexslider.css" rel="stylesheet" />
<link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
 
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<style type="text/css">
#content img {
	    width: 40%;
    height: auto;
}
</style>
<script type="text/javascript">
	function validation() 
	{
		var name = document.getElementById("name").value;
		var address=  document.getElementById("address").value;
		var email =  document.getElementById("email").value;
		var zip=  document.getElementById("zip").value;
		var phoneno=  document.getElementById("phoneno").value;
		
		
		var nameerror = document.getElementById("nameerror");
		var addresserror = document.getElementById("addresserror");
		var emailerror = document.getElementById("emailerror");
		var ziperror = document.getElementById("ziperror");
		var phonenoerror = document.getElementById("phonenoerror");
		
		var nameEXP = /^[a-zA-Z0-9] $/
		var emailExp = /^[a-z0-9_.-]+@[a-z0-9]+\.[a-z.]{2,5}$/;
		
		if(name == "")
		{
			nameerror.innerHTML="**Required Name";
			return false;
		}
		else if(!nameExp.test(name))
		{
			nameerror.innerHTML="**Invalid Format";
			return false;
		}
		else
		{
			nameerror.innerHTML="";
		}
		
		if(address == "")
		{
			addresserror.innerHTML="**Required address";
			return false;
		}
		else
		{
			addresserror.innerHTML="";	
		}
		
		if(zip == "")
		{
			ziperror.innerHTML="**Required Pass";
			return false;
		}
		else
		{
			ziperror.innerHTML="";	
		}
		
		if(phoneno == "")
		{
			phonenoerror.innerHTML="**Required Pass";
			return false;
		}
		else
		{
			phonenoerror.innerHTML="";	
		}
		
		if(email == "")
		{
			emailerror.innerHTML="**Required Email";
			return false;
		}
		else if(!emailExp.test(email))
		{
			emailerror.innerHTML="**Invalid Format";
			return false;
		}
		else
		{
			emailerror.innerHTML="";
		}
		
	
	
    }


</script>
</head>
<body style="background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);">
<div id="wrapper" class="home-page">
	<!-- start header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- end header -->
	<br>
	<br>
	<div class="container">
	
		
		<div class="col-lg-2 "></div>
		<div class="col-lg-8 well ">
		<h1 class="well" align="center" style="background-color: #ffc02a">Service Request Form</h1>
			<div class="row">
				<form action="sreq" method="post" onsubmit="return validation()">
					<div class="col-sm-12">
						<div id="row">
							<span class="text-success">${msg}</span>
							<span class="text-success">${msg5}</span>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
							<label for="serv1" >Service Requested</label>
								<select class="form-control" name="servicereq" id="serv1">
								
								<c:forEach var="s" items="${service}">
											<option value="${s.sid}">${s.sname}</option>
								</c:forEach>
								</select> 
							</div>
							 
							<div class="col-sm-6 form-group">
								<label>Name</label> <input type="text" name="fname" id="name"
									placeholder="Enter First Name Here.." class="form-control" required>
									<span class="text-danger" id="nameerror"></span>
							</div>
							
						</div>
						<div class="form-group">
							<label>Address</label>
							<textarea placeholder="Enter Address Here.." rows="3"
								name="address" id="address" class="form-control"required></textarea>
								<span class="text-danger" id="addresserror"></span>
								
						</div>
						<div class="row">
							<div class="col-sm-4 form-group">
								<label for="sel1">City</label> 
								<select class="form-control"
									name="city" id="sel1">
									 <option value="0">---Select City---</option> 
									
										<c:forEach var="c" items="${city}">
											<option value="${c.cid}">${c.cname}</option>
										</c:forEach>

								</select>
							</div>
							
							<div class="col-sm-4 form-group">
								<label>Zip</label> <input type="text" name="zip" id="zip"
									placeholder="Enter Zip Code Here.." class="form-control" required>
									<span class="text-danger" id="ziperror"></span>
							</div>
						</div>

						<div class="form-group">

							<label>Phone Number</label> <input type="text" name="phone" id="phoneno"
								placeholder="Enter Phone Number Here.." class="form-control"required>
								<span class="text-danger" id="phonenoerror"></span>
						</div>
						
						<div class="form-group">
							<label>Email Address</label> <input type="text" name="email" id="email"
								placeholder="Enter Email Address Here.." class="form-control"required>
								<span class="text-danger" id="emailerror"></span>
						</div>
						
						<div class="form-group">
							<label>Describe Issue</label>
							<textarea placeholder="Provide Details about Problem Here.." rows="3"
								name="problem" class="form-control"required></textarea>
						</div>
						<div class="row">
							<div class=" col-sm-4 form-group">
								<button type="submit" class="btn btn-info" name="submit">Cash on Delivery</button>
								
							</div>
							<a href="payment.html" class="btn btn-info">online payment</a>
							
							</div>
						</div>
					</form>
					</div>
						</div>
						
							</div>
				
			</div>
	
	
	<jsp:include page="Footer.jsp"></jsp:include>
</div>

</body>
</html>