 <%
			String uname= (String)session.getAttribute("admin");
			if(uname == null)
			{
				request.setAttribute("error", "Please login first");
				RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
				rd.forward(request, response);
			}
		%>
 
 <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Toggle Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item">
            	<h3 class="text-success"> Welcome,${admin} </h3>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="adminlogout"><button class="btn btn-danger">Logout</button></a>
            </li>
            
          </ul>
        </div>
      </nav>