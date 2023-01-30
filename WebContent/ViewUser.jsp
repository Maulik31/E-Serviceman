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

  <title>E-Serviceman | Admin_viewUser</title>

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
		 <h1 class="text-success a-center">Active Users</h1>
		 </div>
		 </div>
              <div class="col-md-12 m-auto"> 
				<div class="table" style="overflow-x: auto;">
				
					<table class="table table-hover"> 
						 <thead class="thead-dark"> 
							<tr>
								<th scope="col">Userid</th>
								<th scope="col">Username</th>
								<th scope="col">UserAddress</th>
								<th scope="col">UserCity</th>
								<th scope="col">Zip</th>
								<th scope="col">User_phone</th>
								<th scope="col">User_email</th>
								<th scope="col">Password</th>
								<th scope="col">Photo</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="data" items="${UserData}">
						<tr>
						<td>${data.userid}</td>
						<td>${data.name}</td>
						<td>${data.address}</td>
						<td>${data.city}</td>
						<td>${data.zip}</td>
						<td>${data.phone}</td>
						<td>${data.email}</td>
						<td>${data.password}</td>
						<td><img src="img/user/${data.uimage}" alt="${data.uimage}"  width="86" height="86"></td>
						
						
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
     