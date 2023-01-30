<!DOCTYPE html>
<%
           String email= (String)session.getAttribute("client");
			if(email == null)
			{
				request.setAttribute("error", "Please login first");
				RequestDispatcher rd = request.getRequestDispatcher("clientLogin.jsp");
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
<title>E-Serviceman |Client Profile</title>
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

.img-circle {
    border-radius: 50%;
    width: 30%
}
th {
    background-color: blue;
    color: white;
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
						<h4>Client Profile
						<button style="font-size:15px;float: right"  class="btn btn-danger"><a href="clientLogout">Logout</a></button>
						
						<button style="font-size:15px;float: right" class="btn btn-primary"><i class="fa fa-edit"></i><a href="update?action=update&email=${data.clientEmail}">Update</a></button>
						
						</h4>
						 
					</div>
					<div><h4>${msg}</h4></div>
					
					<div class="panel-body">

						<div class="box box-info">

							<div class="box-body">
							
								   <c:if test="${cdata != null}"> 
								   <form action="update" method="post">
								   <div class="col-sm-6">
									<div align="center">
										<img alt="User Pic"
											src="img/user/serviceMan/${cdata.clientImage}"
											id="profile-image1" class="img-circle img-responsive"> 

										<input id="profile-image-upload" class="hidden" type="file">
										
										<!--Upload Image Js And Css-->
									</div>
									<br>
									</div>

								<div class="col-sm-6">
									<h4 style="color: #00b1b1;">WelCome , ${cdata.clientEmail}</h4>
									<span><p>${cdata.serviceName}</p></span>
								</div>
								
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">

                                 <div class="col-sm-5 col-xs-6 tital "><b>Email ID:</b></div>
								<div class="col-sm-7 col-xs-6 "><input type="text" name="emailid" value="${cdata.clientEmail}" readonly="readonly"></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								<div class="col-sm-5 col-xs-6 tital "><b>Name:</b></div>
								<div class="col-sm-7 col-xs-6 "><input type="text" name="fname" value="${cdata.clientName}"></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Address:</b></div>
								<div class="col-sm-7 col-xs-6 "><input type="text" name="address" value="${cdata.address}"></div>
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
								<div class="col-sm-7 col-xs-6 "><input type="text" name="zip" value="${cdata.zip}"}></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Phone Number:</b></div>
								<div class="col-sm-7 col-xs-6 "><input type="text" name="phone" value="${cdata.clientPhone}"}></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								
								<div class="col-sm-5 col-xs-6 tital "><b>Password:</b></div>
								<div class="col-sm-7 col-xs-6 "><input type="password" name= "password" value="${cdata.clientPassword}"}></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Company:</b></div>
								<div class="col-sm-7 col-xs-6 "><input type="text" name= "company" value="${cdata.clientCompany}"}></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Service Name:</b></div>
								<div class="col-sm-7 col-xs-6 ">
								 <select 
										name="service" id="sel1">
										<option value="0">---Select Services---</option>
										<c:forEach var="s" items="${service1}">
											<option value="${s.sid}">${s.sname}</option>
										</c:forEach>

									</select>
								
								
								</div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div align="center">
								<td><input type="submit" method="post" align="center" class="btn btn-success"></td>
					           	<td><input type="reset" align="center" class="btn btn-danger"></td>
								
								</div>
								</form>
								</c:if>
								
							<c:if test="${cdata == null}">
							<div class="col-sm-6">
									<div align="center">
										<img alt="User Pic"
											src="img/serviceMan/${data.clientImage}"
											id="profile-image1" class="img-circle img-responsive"> 

										<input id="profile-image-upload" class="hidden" type="file">
										
										<!--Upload Image Js And Css-->
									</div>
									<br>
									</div>

								  <div class="col-sm-6">
									<h4 style="color: #00b1b1;">WelCome , ${data.clientEmail}</h4>
									<span><p>${data.serviceName}</p></span>
								</div>
							
								
								<div class="clearfix"></div>
								<hr style="margin: 5px 0 5px 0;">
							
								<div class="col-sm-5 col-xs-6 tital "><b>Name:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.clientName}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Address:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.address}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>City:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.city}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Zip:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.zip}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Phone Number:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.clientPhone}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								
								<div class="col-sm-5 col-xs-6 tital "><b>Password:</b></div>
								<div class="col-sm-7 col-xs-6 "></span>*****</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Company:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.clientCompany}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
								
								<div class="col-sm-5 col-xs-6 tital "><b>Service Name:</b></div>
								<div class="col-sm-7 col-xs-6 "><span>${data.serviceName}</span></div>
								<div class="clearfix"></div>
								<div class="bot-border"></div>
							
							</c:if>
							
								<!-- /.box-body -->
							</div>
							
							<!-- /.box -->

						</div>


					</div>
				</div>
			</div>
	
	 </div>
	<div class="container">
		 <div class="row">
		 
		 
              <div class="col-md-12 m-auto"> 
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
								<th scope="col">ServiceDescription</th>
								<th scope="col">Assigned ID</th>
								
								<!-- <th scope="col">ServiceRequested</th> -->
								
								<th scope="col" colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${servicedata}">
						<tr>
						<td>${data.srid}</td>
						<td>${data.userName}</td>
						<td>${data.userAddress}</td>
						<td>${data.userCity}</td>
						<td>${data.userZip}</td>
						<td>${data.userPhone}</td>
						<td>${data.userEmail}</td>
						<td>${data.serviceDescription}</td>
						<td>${data.assignedId}</td>
						
						<td><button class="btn btn-danger" name="finished"><a href="finished?id=${data.assignedId}&&id2=${data.srid}&&phon=${data.userPhone}">Done</a></button> </td>
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
	
</div>	
 
	
<jsp:include page="Footer.jsp"></jsp:include>	

</body>
</html>