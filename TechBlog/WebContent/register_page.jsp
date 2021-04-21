<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>


 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet"  type="text/css" href="CSS/mystyle.css">          

</head>

<body>
<!-navbar-  -->

<%@include file="navbar.jsp"%>

	<main class="primary-background p-5 banner-background">
	<div class="container">
		<div class="col-md-6 offset-md-3">
			<div class="card">
			<div class="card-header text-center  primary-background text-white">
			  <span class="fa fa-3x fa-user-circle "></span>
			  <br>
                Register here
			</div>

				<div class="card-body">
					<form action="RegisterServlet" id ="reg-form" method="post" >
					
					<div class="form-group">
							<label for="User_Name" >User Name</label> <input
								type="text" name="user_name" class="form-control" id="user_name"
								aria-describedby="emailHelp" placeholder="Enter your name" required>
							
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label> <input
								type="email"  name="user_email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" placeholder="Enter email" required>
							<small id="emailHelp" class="form-text text-muted">We'll
								never share your email with anyone else.</small>
						</div>
						
						
						
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								type="password"  name="user_password" class="form-control" id="exampleInputPassword1"
								placeholder="Password" required>
						</div>
						
						<div class="form-group">
							<label for="gender">Select Gender</label>
							<br> 
							<input type="radio"  id="gender"  value="male" name="user_gender"  required>Male
							<input type="radio"  id="gender" value="female" name="user_gender">Female
								
						</div>
						
						<div class="form-check">
							<input type="checkbox"  name="check" class="form-check-input"
								id="exampleCheck1" required> <label class="form-check-label"
								for="exampleCheck1" >Agree Terms &  Conditions</label>
						</div>
						<br>
						<div class="container text-center id="loader" style="display:none">
						<span class="fa fa-refresh fa-spin fa-4x"></span>
						<h4>Please wait......</h4>
						</div>
						<button id="submit-id" type="submit" class="btn btn-primary">Submit</button>
					</form>
				</div>

				
		</div>
	</div>
	</main>




	<!--JavaScipt  -->
<script src="JS/myjs.js"  type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous"></script>
   <script>
   
   $(document).ready(function(){
	   console.log("loaded..................")
	   
	   $('#reg-form').on('submit', function(event) {
		   
		   event.preventDefault();
		   
		   
		   let form =new FormData(this);
		   
		   $('#submit-btn').hide();
		   $('#loader').show();
		   
		   $.ajax({
			  url: "RegisterServlet",
			  type:'Post',
			  data: form,
			  success: function(data,textSatatus,jqXHR){
				  console.log(data)
				  
				  $('#submit-btn').show();
				   $('#loader').hide();
				   
				   if(data.trim() ==='done'){
				   swal("Register successfully.....")
				   then((value) =>  {
				      window.location= "login_page.jsp"
				   });
				   }else{
					   swal(data)
					   }
				   
			  },
			  error: function(jqXHR,textStatus,errorThrown){
				
				  
				  $('#submit-btn').show();
				   $('#loader').hide();
				   
				  swal("Soemthing went wrong.....")
				  
				     	
				  // $('#loader').hide();
		
			  },
			  processData :false,
			  contentType :false
		 
	   });
	   
   });
	   
   });
   
   </script>           


</body>
</html>