<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.CreateConnection"%>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta charset="utf-8">
<title>E-Serviceman | New User</title>
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
		<h1 class="well" align="center" style="background-color: #ffc02a">User Registration Form</h1>
			<div class="row">
				<form action="ureg" method="post" enctype="multipart/form-data">
					<div class="col-sm-12">
						<div id="row">
							<span class="text-success">${msg}</span>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Name</label> <input type="text" name="fname"
									placeholder="Enter  Name Here.." class="form-control" pattern="[A-z]{1,}" title="only character is allowed" required="required">
							</div>
							<!-- <div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input type="text" placeholder="Enter Last Name Here.." class="form-control">
							</div> -->
						</div>
						<div class="form-group">
							<label>Address</label>
							<textarea placeholder="Enter Address Here.." rows="3"
								name="address" class="form-control" required="required"></textarea>
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
							<!-- <div class="col-sm-4 form-group">
								<label>State</label> <input type="text"
									placeholder="Enter State Name Here.." class="form-control">
							</div> -->
							<div class="col-sm-4 form-group">
								<label>Zip</label> <input type="text" name="zip"
									placeholder="Enter Zip Code Here.." class="form-control"pattern="[0-9]{6}" title="six number zip code" required="required">
							</div>
						</div>

						<div class="form-group">

							<label>Phone Number</label> <input type="text" name="phone"
								placeholder="Enter Phone Number Here.." class="form-control"pattern="[7-9]{1}[0-9]{9}" 
       title="Phone number with 7-9 and remaing 9 digit with 0-9" required="required">
						</div>
						<div class="form-group">
							<label>Email Address</label> <input type="text" name="email"
								placeholder="Enter Email Address Here.." class="form-control"pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="enter valid email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="enter valid email" required >
						</div>
						<div class="form-group">
							<label>Password</label> <input type="password" name="password"
								placeholder="create your password" class="form-control" required="required">
						</div>
						

						<div class="form-group">
							<label>Client Image</label> <input type="file" name="uimage" required="required">
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<button type="submit" class="btn btn-lg btn-info" name="submit">Submit</button>
							</div>
							<div class="form-group">
								<div class="col-sm-6 form-group">
									<p>
										Already Registered with us? <a href="userLogin.jsp"
											class="btn btn-lg btn-success"> Login Now!</a>
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