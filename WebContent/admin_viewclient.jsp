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

  <title>E-Serviceman | Admin_viewClient</title>

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
		 <h1 class="text-success a-center">Active Technician</h1>
		 </div>
		 </div>
              <div class="col-md-12 m-auto"> 
				<div class="table" style="overflow-x: auto;">
				
					<table class="table table-hover"> 
						 <thead class="thead-dark"> 
							<tr>
								<th scope="col">clientid</th>
								<th scope="col">clientname</th>
								<th scope="col">clientAddress</th>
								<th scope="col">clientCity</th>
								<th scope="col">Zip</th>
								<th scope="col">client_phone</th>
								<th scope="col">client_email</th>
								<th scope="col">Password</th>
								<th scope="col">client_company</th>
								<th scope="col">Service</th>
								<th scope="col">Photo</th>
								<th scope="col" colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${clientData}">
						<tr>
						<td>${data.cid}</td>
						<td>${data.clientName}</td>
						<td>${data.address}</td>
						<td>${data.city}</td>
						<td>${data.zip}</td>
						<td>${data.clientPhone}</td>
						<td>${data.clientEmail}</td>
						<td>${data.clientPassword}</td>
						<td>${data.clientCompany}</td>
						<td>${data.serviceName}</td>
						<td><img src="img/serviceMan/${data.clientImage}" alt="${data.clientImage}"  width="86" height="86"></td>
						
						<c:if test="${data.status == 1 }">
							<td><button class="btn btn-primary">Approved</button> </td>
						</c:if>
						<c:if test="${data.status == 0 }">
							<td><a href="status?sname=approve&&cid=${data.cid}"><button class="btn btn-success">Approve</button></a></td>
						
					</c:if>
						<td><a href="status?sname=reject&&cid=${data.cid}"><button class="btn btn-danger">Reject</button></a></td>
						
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
     