<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.mysql.jdbc.ConnectionProperties"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"  %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>


<!--  CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">


<link rel="stylesheet"  type="text/css" href="CSS/mystyle.css">
</head>
<body>

<!-navbar-  -->



<%@include file="navbar.jsp"%>

<!--  Banner-->

	<div class="container-fiuid p-0 m-0">


		<div class="jumbotron primary-background text-white ">
			<div class="container">
				<h3 class="display-3">Welcome, TechBlog</h3>
				
				<p>Welcome to technical blog, world of technology, A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
				<button class="btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start ! Its Free </button>
				<a href ="login_page.jsp" class="btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span>Login </a>
			</div>
		</div>
		
				
	</div>
<!--Container  -->
	<div class="container">
		<div class="row mb-2">

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">

						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">Java is a powerful general-purpose programming language. It is used to develop desktop and mobile applications, big data processing, embedded systems, and so on.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">

				<div class="card">

					<div class="card-body">

						<h5 class="card-title">Python Programming</h5>
						<p class="card-text">Python is a powerful general-purpose programming language. It is used in web development, data science, creating software prototypes, and so on. Fortunately for beginners, Python has simple easy-to-use syntax. .</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			
			
			<div class="col-md-4">

				<div class="card">

					<div class="card-body">

						<h5 class="card-title">JavaScript Programming</h5>
						<p class="card-text">JavaScript (js) is a light-weight object-oriented programming language which is used by several websites for scripting the webpages. It is an interpreted, full-fledged programming language that enables dynamic interactivity on websites when applied to an HTML document</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			
			

		</div>



<div class="row">

			<div class="col-md-4">

				<div class="card">

					<div class="card-body">

						<h5 class="card-title">PHP Programming</h5>
						<p class="card-text">PHP is an open-source, interpreted, and object-oriented scripting language that can be executed at the server-side. PHP is well suited for web development. Therefore, it is used to develop web applications.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			
			<div class="col-md-4">

				<div class="card">

					<div class="card-body">

						<h5 class="card-title">MySql</h5>
						<p class="card-text">MySQL is currently the most popular database management system software used for managing the relational database. It is open-source database software, which is supported by Oracle Company.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			
			
			<div class="col-md-4">

				<div class="card">

					<div class="card-body">

						<h5 class="card-title">ASP.NET Programming</h5>
						<p class="card-text">ASP.NET is a web framework designed and developed by Microsoft. It is used to develop websites, web applications and web services. It provides fantastic integration of HTML, CSS and JavaScript.</p>
						<a href="#" class="btn primary-background text-white">Read
							more</a>
					</div>
				</div>
			</div>
			
			

		</div>

	</div>








	<!--JavaScipt  -->
<script src="JS/myjs.js"  type="text/javascript"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
              









</body>
</html>