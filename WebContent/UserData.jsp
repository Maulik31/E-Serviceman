<!DOCTYPE html>
<%
           String email= (String)session.getAttribute("user");
			if(email == null)
			{
				request.setAttribute("error", "Please login first");
				RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
				rd.forward(request, response);
			}

			 %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.CreateConnection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E-Serviceman |User Profile</title>
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
    
    
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <script type="text/javascript">
 $(".hiddenPassword").click(function() {
	    var pw = $(this).children("span").text();
	    $(this).text(pw);
	});
 </script>
 
 <style>
      * {
      box-sizing: border-box;
      }
      body {
      font-family: Roboto, Helvetica, sans-serif;
      }
      /* Fix the button on the left side of the page */
      .open-btn {
      display: flex;
      justify-content: left;
      }
      /* Style and fix the button on the page */
      .open-button {
      background-color: #1c87c9;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      opacity: 0.8;
      position: fixed;
      }
      /* Position the Popup form */
      .login-popup {
      position: relative;
      text-align: center;
      width: 100%;
      }
      /* Hide the Popup form */
      .form-popup {
      display: none;
      position: fixed;
      left: 45%;
      top:5%;
      transform: translate(-45%,5%);
      border: 2px solid #666;
      z-index: 9;
      }
      /* Styles for the form container */
      .form-container {
      max-width: 300px;
      padding: 20px;
      background-color: #fff;
      }
      /* Full-width for input fields */
      .form-container input[type=text], .form-container input[type=password] {
      width: 100%;
      padding: 10px;
      margin: 5px 0 22px 0;
      border: none;
      background: #eee;
      }
      /* When the inputs get focus, do something */
      .form-container input[type=text]:focus, .form-container input[type=password]:focus {
      background-color: #ddd;
      outline: none;
      }
      /* Style submit/login button */
      .form-container .btn {
      background-color: #8ebf42;
      color: #fff;
      padding: 12px 20px;
      border: none;
      cursor: pointer;
      width: 100%;
      margin-bottom:10px;
      opacity: 0.8;
      }
      /* Style cancel button */
      .form-container .cancel {
      background-color: #cc0000;
      }
      /* Hover effects for buttons */
      .form-container .btn:hover, .open-button:hover {
      opacity: 1;
      }
    </style>
 
<style>

.img-circle {
    border-radius: 50%;
    width: 30%
}
b{

font-size: 20px;
}
span{
font-size: 20px;
}
.panel {
    margin-bottom: 18px;
    margin-right: -29%;
    margin-left: 24%;
    background-color: #F4F4F4;
    border: 1px solid transparent;
    border-radius: 2px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);
    box-shadow: 0 1px 1px rgba(0,0,0,0.05);
}
@media only screen and (min-width: 200px) and (max-width: 450px) {
	.panel {
    margin-bottom: 18px;
    margin-right: 0;
    margin-left: 0;
    background-color: #F4F4F4;
    border: 1px solid transparent;
    border-radius: 2px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);
    box-shadow: 0 1px 1px rgba(0,0,0,0.05);
}
}
</style>
<style type="text/css">
#content img {
	    width: 40%;
    height: auto;
}
th {
    background-color: black;
    color: white;
} 
</style>
</head>
<body style="background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);">

<div id="wrapper" class="home-page">
	<!-- start header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- end header -->
	<div class="container">
             <div class="row">
           
			<div class="col-md-8 ">
                
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>User Profile
						<button style="font-size:15px;float: right"  class="btn btn-danger"><a href="userLogout" style="color:white;">Logout</a></button>
						
						<button style="font-size:15px;float: right" class="btn btn-primary"><i class="fa fa-edit"></i>&nbsp;&nbsp;<a href="userupdate?action=userupdate&email=${data.email}" style="color:white; float: right;">Update</a></button>
						  
						</h4>
						 
					</div>
					<div><h4 style=" float: center;">${msg}</h4></div>
					
					<div class="panel-body">

						<div class="box box-info">

							<div class="box-body">
							
								   <c:if test="${udata != null}"> 
								   <form action="userupdate" method="post">
								   <div class="col-sm-6">
									<div align="center">
										<img alt="User Pic"
											src="img/user/${udata.uimage}"
											id="profile-image1" class="img-circle img-responsive"> 

										<input id="profile-image-upload" class="hidden" type="file">
										
										<!--Upload Image Js And Css-->
									</div>
									<br>

								</div>
									<div class="col-sm-6">
										<h4 style="color: #00b1b1;">WelCome , ${udata.email}</h4>
										
									</div>
									
									<div class="clearfix"></div>
									<hr style="margin: 5px 0 5px 0;">
	                                 <div class="col-sm-5 col-xs-6 tital "><b>Email ID:</b></div>
								    <div class="col-sm-7 col-xs-6 "><input type="text" name="emailid" value="${udata.email}" readonly="readonly"></div>
								    <div class="clearfix"></div>
								   <div class="bot-border"></div>
									<div class="col-sm-5 col-xs-6 tital "><b>Name:</b></div>
									<div class="col-sm-7 col-xs-6 "><input type="text" name="fname" value="${udata.name}"></div>
									<div class="clearfix"></div>
									<div class="bot-border"></div>
									
									<div class="col-sm-5 col-xs-6 tital "><b>Address:</b></div>
									<div class="col-sm-7 col-xs-6 "><input type="text" name="address" value="${udata.address}"></div>
									<div class="clearfix"></div>
									<div class="bot-border"></div>
									
									<div class="col-sm-5 col-xs-6 tital "><b>City:</b></div>
									<div class="col-sm-7 col-xs-6 ">
									<select 
										name="city" id="sel1">
										 <option value="0">---Select City---</option> 
										
											<c:forEach var="c" items="${city1}">
												<option value="${c.cid}">${c.cname}</option>
											</c:forEach>
	
									</select>
									
									</div>
									<div class="clearfix"></div>
									<div class="bot-border"></div>
									
									<div class="col-sm-5 col-xs-6 tital "><b>Zip:</b></div>
									<div class="col-sm-7 col-xs-6 "><input type="text" name="zip" value="${udata.zip}"}></div>
									<div class="clearfix"></div>
									<div class="bot-border"></div>
									
									<div class="col-sm-5 col-xs-6 tital "><b>Phone Number:</b></div>
									<div class="col-sm-7 col-xs-6 "><input type="text" name="phone" value="${udata.phone}"}></div>
									<div class="clearfix"></div>
									<div class="bot-border"></div>
									
									
									<div class="col-sm-5 col-xs-6 tital "><b>Password:</b></div>
									<div class="col-sm-7 col-xs-6 "><input type="password" name= "password" value="${udata.password}"}></div>
									<div class="clearfix"></div>
									<div class="bot-border"></div>
									
									<div align="center">
									<td><input type="submit" method="post" align="center" class="btn btn-success"></td>
						           	<td><input type="reset" align="center" class="btn btn-danger"></td>
									
									</div>
									</form>
								</c:if>
								
							<c:if test="${udata == null}">
							<div class="col-sm-6">
									<div align="center">
										<img alt="User Pic"
											src="img/user/${data.uimage}"
											id="profile-image1" class="img-circle img-responsive"> 

										<input id="profile-image-upload" class="hidden" type="file">
										
										<!--Upload Image Js And Css-->
									</div>
									<br>

								</div>
							
							    <div class="col-sm-6">
									<h4 style="color: #00b1b1;">WelCome , ${data.email}</h4>
									
								</div>
								
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">
							
								<div class="col-sm-5 col-xs-6 tital "><b>Name:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.name}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Address:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.address}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>City:</b></div>
								<div class="col-sm-7 col-xs-6 "><span><c:if test="${data.ctid == 1}">Baroda</c:if>
						     <c:if test="${data.ctid == 2}">Surat</c:if>
						     <c:if test="${data.ctid == 3}">Ahmedabad</c:if></span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Zip:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.zip}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Phone Number:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.phone}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								
								<div class="col-sm-5 col-xs-6 tital "><b>Password:</b></div>
								<div class="col-sm-7 col-xs-6 "><span class="hiddenPassword"><span style="display:none">${data.password}</span>*****</span></div>
								
								<div class="clearfix"></div>
								<div class="bot-border"></div>
							    </c:if>
							
							</div>
						</div>
					</div>
				</div>
			</div>
	 </div>
	 <div class="container">
		 <div class="row">
		 
		 
              <div class="col-md-12 m-auto "> 
              <h1 style="color: black" align="center">Your Orders</h1>
				<div class="table" style="overflow-x: auto;">
				
					<table class="table table-hover"> 
						 <thead class="thead-dark"> 
							<tr>
							    <th scope="col">RequestId</th>
								<th scope="col">Username</th>
								<th scope="col">UserAddress</th>
								<th scope="col">UserCity</th>
								<th scope="col">UserZip</th>
								<th scope="col">UserPhone</th>
								<th scope="col">UserEmail</th>
								<th scope="col">ServiceRequested</th>
								<th scope="col">RequestDate</th>
								<th scope="col">ServiceDescription</th>
								<th scope="col">status</th>
							
								
								<th scope="col" >Action</th>
									<th scope="col">Feedback</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${servicedata}">
						<tr>
					   <td>${data.srid}</td>
						<td>${data.userName}</td>
						<td>${data.userAddress}</td>
						<td> 
						     <c:if test="${data.userCity == 1}">Baroda</c:if>
						     <c:if test="${data.userCity == 2}">Surat</c:if>
						     <c:if test="${data.userCity == 3}">Ahmedabad</c:if>
						</td>
						<td>${data.userZip}</td>
						<td>${data.userPhone}</td>
						<td>${data.userEmail}</td>
						<td>
						    <c:if test="${data.serviceRequested == 1}">Plumber</c:if>
						    <c:if test="${data.serviceRequested == 2}">Electrician</c:if>
						    <c:if test="${data.serviceRequested == 3}">Carpenter</c:if>
						</td>
						<td>${data.date}</td>
						<td>${data.serviceDescription}</td>
						<td>
						    <c:if test="${data.sstatus}"><span class="label label-success">Completed</span></c:if>
						    <c:if test="${not data.sstatus}"><span class="label label-danger">Panding</span></c:if> 
						</td>
						
						<td> <c:if test="${not data.sstatus}"><a href="deleteSreq?srid=${data.srid}"><button class="btn btn-danger">Cancle</button></a></c:if></td>
						<td><c:if test="${data.sstatus}"> <button class="btn btn-info" onclick="openForm()"><strong>Feedback</strong></button>
						
					
						<div class="login-popup">
      <div class="form-popup" id="popupForm">
        <form action="feedback" method="post" class="form-container">
    
        <h3>Give your Feedback</h3>
          <label for="serviceId">
          <strong>SERVICE ID</strong>
          </label>
          <input type="text" name="srid" required>
          <label for="Feedback">
          <strong>FEEDBACK</strong>
          </label>
          <input type="text"  id="feedback"name="feedback" required>
          <button type="submit" class="btn">submit</button>
          <button type="button" class="btn cancel" onclick="closeForm()">Close</button>
        </form>
      </div>
    </div>
					</c:if>	
						
						
						</td>
						</tr>
						</c:forEach>
						<!-- </tbody> -->
						
						
					</table>
         		</div>
			</div>
		</div>
		</div>
	
			
			<script>
				$(function() {
					$('#profile-image1').on('click', function() {
						$('#profile-image-upload').click();
					});
				});
			</script>
	
</div>
	
	
 
    

    
    
    
    
    <script>
      function openForm() {
        document.getElementById("popupForm").style.display="block";
      }
      
      function closeForm() {
        document.getElementById("popupForm").style.display="none";
      }
    </script>
	
<jsp:include page="Footer.jsp"></jsp:include>	
	
</body>
</html>