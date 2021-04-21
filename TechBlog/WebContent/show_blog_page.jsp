<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="com.tech.blog.entities.Message"%>
   <%@page import="com.tech.blog.entities.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="error_page.jsp" %>


   <%
   User user=(User)session.getAttribute("currentUser");
   if(user==null){
	   response.sendRedirect("login_page.jsp");
   }

  %>


<%
int postId=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(ConnectionProvider.getConnection());
Post p=d.getPostByPostId(postId);
%>
<html>
<head>
<!--  CSS -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 
<link rel="stylesheet"  type="text/css" href="CSS/mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><%=p.getpTitle()  %></title>
<style>

.post-titile{
font-weight : 100;
font-size:30px;'
}

.post-content{
font-weight : 100;
font-size:25px;'
}
</style>
</head>
<body>
<!-- navbar -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk">Tech Blog</span></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="fa fa-bell-o"></span>Learn Code<span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-navicon"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
       <li class="nav-item"> 
        <a class="nav-link" href="#" ><span class="fa fa-phone"></span>Contact Us</a>
      </li>
      
        <li class="nav-item"> 
        <a class="nav-link" href="profile.jsp" ><span class="fa fa-asterisk"></span>Back</a>
      </li>
      
    
      
    </ul>
    <ul class="navbar-nav mr-right">
     <li class="nav-item">
        <a class="nav-link" href="#!"  data-toggle="modal"  data-target="#profile-modal"> <span class="fa fa-user-circle "></span><%= user.getName() %></a>
      </li>
    
      <li class="nav-item">
        <a class="nav-link" href="Logout_servlet" ><span class="	fa fa-user-plus"></span>Logout</a>
      </li>
    </ul>
  </div>
</nav>

<!-- end-navbar -->

<!-- /main content of body -->
<div class="content">
<div class="row my-4">
<div class="col-md-8 offset-md-2">
<div class="card w-50  mx-auto">
<div class="card-header">
<h4 class="post-title"><%= p.getpTitle() %></h4>
</div>
<div class="card-body">
<img class="card-img-top" src="blog_pic\<%=p.getpPic() %>" alt="Card image cap">

<p class="post-content"><%= p.getpContent() %></p>
<br>
<br>
<div class="post-code">
<pre><%=p.getpCode() %></pre>
</div>
</div>
<div class="card-footer">
<%
LikeDao Id=new LikeDao(ConnectionProvider.getConnection()); 
%>
<a href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= Id.countLikeOnePost(p.getPid()) %></span></a>

<a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i>10</a>

</div>
</div>
</div>
</div>
</div>
<!-- end of main content -->


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white  text-center">
        <h5 class="modal-title " id="prfoile-modal">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
       <img src='pic\<%= user.getProfile() %> ' class="img-fluid" style="border-radius:50%;max-width:150px;">
    
      <%-- <%= user.getProfile() %> --%>
      <br>
        <h5 class="modal-title mt-3" id="prfoile-modal"><%= user.getName() %></h5>
        
        <!-- details -->
        <div id="profile-details">	
        <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%=user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%= user.getGender() %></td>
  
    </tr>
     <tr>
      <th scope="row">Registered On :</th>
      <td><%= user.getDateTime().toString() %></td>
  
    </tr>
  </tbody>
</table>
</div>

      <!-- profile-edit -->
      
      <div id="profile-edit" style="display: none;">
      
      <h3 class="mt-2">Please Edit Carefully</h3>
      <form action="EditServlet" method="post" enctype='multipart/form-data'>
      <table class="table">
      <tr>
      <td>Id:</td>
      <td><%= user.getId() %></td>
      </tr>
      
      <tr>
      <td>Name:</td>
      <td><input type="text"  name="user_name" class="form-control" value="<%=user.getName() %>" ></td>
      </tr>      
      
      
      <tr>
      <td>Email:</td>
      <td><input type="email"  name="user_email" class="form-control" value="<%=user.getEmail() %>" ></td>
      </tr>
      
      <tr>
      <td>Password :</td>
      <td><input type="password"  name="password" class="form-control" value="<%=user.getPassword() %>" ></td>
      </tr>
      
      
      <tr>
      <td>New Profile :</td>
      <td><input type="file"  name="image" class="form-control"  ></td>
      </tr>
      
      </table>
      
      <div class="container">
      <button type="submit" class="btn btn-outline-primary">Save</button>
      </div>
      </form>
      
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button"  id="edit-profile-btn" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>

<!-- end-profile-model -->
<!--JavaScipt  -->
<script src="JS/myjs.js"  type="text/javascript"></script>
<script language="text/javascript" src="JS/myjs.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js</script>

              
<script>
$(document).ready(function(){
	let editStatus=false;
	$('#edit-profile-btn').click(function(){
		
		if(editStatus == false){
			$("#profile-details").hide()
			$("#profile-edit").show();
			editStatus=true;
			$(this).text("Back")
		}else{
		
				$("#profile-details").show()
				$("#profile-edit").hide();
				editStatus=false;
		}
	
	})

});
</script>




</body>
</html>