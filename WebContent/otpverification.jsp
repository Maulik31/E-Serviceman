<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="ISO-8859-1">
<title>E-Serviceman | Service Otp</title>
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="simple-line-icons/css/simple-line-icons.css">
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="css/flexslider.css" rel="stylesheet" />
<link href="js/owl-carousel/owl.carousel.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<style>
.well {
    min-height: 20px;
    padding: 19px;
    margin-bottom: 20px;
    background-color: #f1f1f1;
    border: 1px solid #101010;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.05);
}
@media only screen and (min-width: 200px) and (max-width: 450px) {
	.panel {
    margin-bottom: 18px;
    margin-right: 0;
    margin-left: 0;
    background-color:#b9f1e9;
    border: 1px solid transparent;
    border-radius: 2px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);
    box-shadow: 0 1px 1px rgba(0,0,0,0.05);
}
</style>
</head>
<body style="background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);">
<div id="wrapper" class="home-page">
	<!-- start header -->
	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<br>
	<!-- end header -->
	<div class="container">
	
		
		<div class="col-lg-4 "></div>
		<div class="col-lg-4 well">
		<h1 class="well" align="center" style="background-color:#ffc02a"> Otp Verification</h1>
			<div class="row">
				<form  action="otp" method="post">
					<div class="col-sm-12">
						<div id="row">
							<h3 class="text-danger">${error}</h3>
							<h3 class="text-danger">${msg}</h3>
							<h3 class="text-danger">${msg3}</h3>
							<h3 class="text-danger">${msg4}</h3>
								<h3 class="text-danger">${otp}</h3>
					
						</div>
						<div class=" form-group">
							<span>Enter Otp Received on Phno ${phone}</span>
						</div>
							
						<div class=" form-group">
							<label>Enter Otp</label> <input type="text" name="otp" id="otp"
								placeholder="Enter otp here..." class="form-control">
						</div>
						
						
						<div class="row">
							<div class=" form-group">
								<button type="submit"  value="Login" class="btn btn-primary center-block">Submit</button>
							</div>
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