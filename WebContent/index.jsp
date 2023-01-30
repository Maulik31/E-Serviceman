<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.CreateConnection"%>
<html lang="en">
<head>
<meta charset="utf-8">
<title>E-Serviceman | Home</title>
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
<body>
<div id="wrapper" class="home-page">
	<!-- start header -->
	<jsp:include page="header.jsp"></jsp:include>
	<!-- end header -->
	  <span>${msg5}</span>
	<%--  <div class="alert alert-warning alert-dismissible fade show" role="alert">
	  <span>${msg5}</span>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div> --%>
	
	<section id="banner">

	<!-- Slider -->
	
        <div id="main-slider" class="flexslider">
            <ul class="slides">
              <li>
                <img src="img/slides/1.jpg" alt="flexslider" /> 
                <div class="flex-caption">
                    <h3>Home Services</h3> 
					<p>Live Your Life To The Fullest.</p>  
                </div> 
              </li>
              <li>
                <img src="img/slides/2.jpg" alt="flexslider" /> 
                <div class="flex-caption">
                    <h3>Affordable Services</h3> 
					<p>Let Us Handel The Home Repair Concerns</p>  
                </div> 
              </li>
            </ul>
        </div>
		
	<!-- end slider -->
 
	</section>
	<section class="jumbobox">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div><h1>Services</h1>
			</div>
		</div>
	</div>
	</section>
	
	<section id="content">
	
		    <div class="container">
		      <div class="row">
	      
	<div class="skill-home"> 
			<div class="skill-home-solid clearfix"> 
	<%
		CreateConnection con = new CreateConnection();
		Connection cn = con.DoConnection();
		Statement st = cn.createStatement();
		ResultSet rs = st.executeQuery("select * from servicedetails");
		
		while(rs.next())
		{ %>	
			
			<div class="col-md-3 text-center" style=" margin-bottom: 2%;">
			<div class="box"> 
			<span class="icons c1"><img alt="unavailable" src="img/service/<%=rs.getString(4)%>" > </span> <div class="box-area">
			<h3><%=rs.getString(2) %></h3>
			<div type="hidden" name="sid"></div>
			<%--  <h5><%=rs.getString(3) %></h5>  --%>
			<p><a href="ServiceController?sid=<%=rs.getString(1)%>">Learn More</a></p></div>
			</div>
			</div>	
			
		<% }
	
	%>
	
	</div>
			</div>
		</div>
		    </div> 
		    </section>	 
		<section class="aboutUs">
	<div class="container">
		<div class="row">
		<div class="col-md-6"><img src="img/img1.png" class="img-center" alt="" /></div>
			<div class="col-md-6">
				<div><h2>Our Team</h2>
				<p>In any industry where the people behind a company are as important as the company itself.A dream doesnt become reality through magic; it takes sweat, determination and hard work.</p>
				<p>All growth depends upon activity. There is no development physically or intellectually without effort, and effort means work.Patience can be bitter but her fruit is always sweet.If you try and lose then it isnt your fault. But if you dont try and we lose, then its all your fault</p>
				</div>
				<br/>
			</div>
		</div> 
	
	</div>
	</section> 
	<!--  <section class="clients">
	 <div class="container">
	 	<div class="clients-slider">
				<h3 class="header-title">Our Clients</h3>
				<div class="clients-control pull-right">
					<a class="prev btn btn-gray btn-xs"><i class="fa fa-angle-left fa-2x"></i></a>
					<a class="next btn btn-gray btn-xs"><i class="fa fa-angle-right fa-2x"></i></a>
				</div>
				<span class="line"></span>
				<div id="clients-slider" class="owl-carousel">
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/amazon-grey.png">
						<img alt="Our Client" src="img/OurClients/amazon.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/cisco_grey.png">
						<img alt="Our Client" src="img/OurClients/cisco.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/cityairline-grey.png">
						<img alt="Our Client" src="img/OurClients/cityairline.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/dell-grey.png">
						<img alt="Our Client" src="img/OurClients/dell.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/ebay-grey.png">
						<img alt="Our Client" src="img/OurClients/ebay.png" class="colored">
						</a>
					</div> 
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/google-grey.png">
						<img alt="Our Client" src="img/OurClients/google.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/hp_grey.png">
						<img alt="Our Client" src="img/OurClients/hp.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/igneus_grey.png">
						<img alt="Our Client" src="img/OurClients/igneus.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/natural_grey.png">
						<img alt="Our Client" src="img/OurClients/natural.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/shell_grey.png">
						<img alt="Our Client" src="img/OurClients/shell.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/vadafone_grey.png">
						<img alt="Our Client" src="img/OurClients/vadafone.png" class="colored">
						</a>
					</div>
					<div class="item">
						<a href="#">
						<img alt="Our Client" src="img/OurClients/walmart_grey.png">
						<img alt="Our Client" src="img/OurClients/walmart.png" class="colored">
						</a>
					</div>
				</div>
				<div class="fullwidth margin-bottom-20">
				</div>
			</div>
		 </div>
	 </section> -->
	
</div>
<jsp:include page="Footer.jsp"></jsp:include>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script> 
<script src="js/portfolio/jquery.quicksand.js"></script>
<script src="js/portfolio/setting.js"></script>
<script src="js/jquery.flexslider.js"></script>
<script src="js/animate.js"></script>
<script src="js/custom.js"></script>
<script src="js/owl-carousel/owl.carousel.js"></script>
</body>
</html>