<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.CreateConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E-Serviceman | Services</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://webthemez.com" />
 
<link href="css/bootstrap.min.css" rel="stylesheet" />
<link href="css/fancybox/jquery.fancybox.css" rel="stylesheet"> 
<link href="css/flexslider.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
 
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<style type="text/css">
.glyphicon {  margin-bottom: 10px;margin-right: 10px;}

small {
display: block;
line-height: 1.428571429;
color: #999;
}
.hg{
       background: gainsboro;
    padding: 31px;
    box-shadow: 2px 2px 5px #7b7777;
    margin-bottom: 4%;
    margin-left: 6%;
        height: 162px;
}
</style>
</head>
<body>
<div id="wrapper" class="home-page">
	<!-- start header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- end header -->
	
	<section id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h2 class="pageTitle">Services</h2>
			</div>
		</div>
	</div>
	</section>
	<br>
	<h1 align="center">${sdata.sname}</h1>
	<div class="container">
	<div class="row">
	<div class="col-lg-3">
				<img alt="" src="img/service/${sdata.simage}" width="100%">
			</div>
			<div class="col-lg-9">
				<p>${sdata.sdetails}</p>
				</div>
				</div>
				</div>
	<br>
	<div class="container">
	<h1 align="center" style="color: green">Technician</h1>
	  <!-- template -->
	
			
			<div class="row">
			<c:forEach var="cdt" items="${cdata}">
			<div class="col-lg-5 hg">
			<div class="col-lg-6"><center><img src="img/serviceMan/${cdt.clientImage}"alt="NA" class="icons c1" width="50%" /></center></div>			
            <div class="col-lg-6"><h4>
                        	${cdt.clientName}
                           </h4>
            <i class="glyphicon glyphicon-envelope"></i>
            </div>            
            </div>
           
                   </c:forEach>
                  </div>          
      		
	
		<a href="sreq?serviceid=${sdata.sid}"><button  type="button" class="btn btn-primary btn-lg btn-block" type="submit" value="hire">Hire Now!!</button>
		<br>  
			
						
	
	</div>
	</div>
	
	
	<form action="service" method="post">
	
	
	
	</form>
	<jsp:include page="Footer.jsp"></jsp:include>


</body>
</html>