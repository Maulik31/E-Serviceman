<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<title>Login</title>
<script type="text/javascript">

	function validation() 
	{
		var email =  document.getElementById("email").value;
		var pass =  document.getElementById("pass").value;
		
		var emailerror = document.getElementById("emailerror");
		var passerror = document.getElementById("passerror");
		
		var emailExp = /^[a-z0-9_.-]+@[a-z0-9]+\.[a-z.]{2,5}$/;
		
		
		if(email == "")
		{
			emailerror.innerHTML="**Required Email";
			return false;
		}
		else if(!emailExp.test(email))
		{
			emailerror.innerHTML="**Invalid Format";
			return false;
		}
		else
		{
			emailerror.innerHTML="";
		}
		
		
		if(pass == "")
		{
			passerror.innerHTML="**Required Pass";
			return false;
		}
		else
		{
			passerror.innerHTML="";	
		}
		
		
		
	}


</script>
</head>
<body style="background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);">

	<div class="container">
		<div class="row">
			<div class="col-md-4 m-auto card">

				<form action="adminlogin" method="post" onclick="return validation()">
					<h1 class="text-success">ADMINISTRATOR</h1>
					<h3 class="text-danger">${error}</h3>
					<h3 class="text-danger">${msg}</h3>
					<div class="form-group">

						<label>Email</label> <input type="text" id="email" name="email"
							class="form-control">
							<span class="text-danger" id="emailerror"></span>

					</div>
					<div class="form-group">

						<label>Password</label> <input type="password" id="pass" name="password"
							class="form-control">
								<span class="text-danger" id="passerror"></span>

					</div>

					<div class="form-group">

						<input type="submit" name="submit" class="btn btn-success">
						<input type="reset" name="reset" class="btn btn-primary">
						<!-- <a href="register.jsp" class="btn btn-success">New
							Registration</a> -->
					</div>
				</form>

			</div>
		</div>
	</div>
</body>
</html>