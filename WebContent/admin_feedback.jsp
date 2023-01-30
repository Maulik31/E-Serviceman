<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>

	 <%-- <%
			String uname= (String)session.getAttribute("username");
			if(uname == null)
			{
				request.setAttribute("msg", "Please login first");
				RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
				rd.forward(request, response);
			}
		%>  --%>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>E-Serviceman | Feedback</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/simple-sidebar.css" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
</head>

<body style="background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);" data-spy="scroll" data-target=".navbar" data-offset="50">

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
   <jsp:include page="admin_sidebar.jsp"></jsp:include>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

     <jsp:include page="admin_nav.jsp"></jsp:include>

     <div class="container-fluid">
		 <div class="row">
		 <div class="col-md-4 m-auto"> 
		 <h1 class="text-success a-center">Feedback</h1>
		 </div>
		 </div>
              <div class="col-md-12 m-auto"> 
				<div class="table" style="overflow-x: auto;">
				
					<table class="table table-hover"> 
						 <thead class="thead-dark"> 
							<tr>
								<th scope="col">Orderid</th>
								<th scope="col">Username</th>								
								<th scope="col">UserCity</th>						
								<th scope="col">phone</th>
								<th scope="col">email</th>
								<th scope="col">ServiceReq</th>
								<th scope="col">ServiceDescp</th>
								<th scope="col">AssignedId</th>
								<th scope="col">Date</th>
								<th scope="col">feedback</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${orders}">
						<tr>
						<td>${data.srid}</td>
						<td>${data.userName}</td>
						
						<td>${data.userCity}</td>
					
						<td>${data.userPhone}</td>
						<td>${data.userEmail}</td>
						<td>${data.serviceRequested}</td>
						<td>${data.serviceDescription}</td>
						<td>${data.assignedId}</td>
						<td>${data.date}</td>
						<td>${data.feedback}</td>
			
						</tr>
						</c:forEach>
						</tbody>
						
						
					</table>
         		</div>
			</div>
		</div>
	</div>

    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Menu Toggle Script -->
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>

</body>

</html>
     