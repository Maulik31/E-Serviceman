<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="ISO-8859-1">
<title>E-Serviceman |User Login</title>
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
		<h1 class="well" align="center" style="background-color:#ffc02a">User Login</h1>
			<div class="row">
				<form  action="ulogin" method="post">
					<div class="col-sm-12">
						<div id="row">
							<h3 class="text-danger">${error}</h3>
							<h3 class="text-danger">${msg}</h3>
							<h3 class="text-danger">${msg3}</h3>
							<h3 class="text-danger">${msg4}</h3>
						</div>
						
							
						<div class=" form-group">
							<label>Email Address</label> <input type="text" name="email"
								placeholder="Enter Email Address Here.."pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="enter valid email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="enter valid email" required>
						</div>
						
						<br>
						
						<div class=" form-group">
							<label>Password</label> <input type="password" name="password"
								placeholder="create your password" class="form-control" required>
						</div>
						<br>
						<br>
						<div class="row">
							<div class=" form-group">
								<button type="submit"  class="btn btn-primary center-block" name="submit">Submit</button>
							</div>
							<div class=" form-group">
								<button type="submit" value="Forgot Password"  class="btn btn-primary center-block" name="submit">Forgot Password</button>
							</div>
							
							<div class="form-group">
								<div class="form-group">
									<p>
										 <a href="ulogin"><p style="text-align:center">New User Register Here!!</a> 
									</p>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="Footer.jsp"></jsp:include>
</div>
</body>
</html>