
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import ="java.util.ArrayList"%>
<%@page import ="java.util.List"%>
<div class="row">
<%
User uu=(User)session.getAttribute("currentUser");
PostDao d=new PostDao(ConnectionProvider.getConnection());
int cid=Integer.parseInt(request.getParameter("cid"));
List<Post> posts=null;
if(cid == 0){
	posts=d.getAllPosts();
}else{
	posts=d.getPostsbyCatId(cid);
}
if (posts.size() ==0){
	out.println("<h3 class='display-3 text-center'>No Post In this Category</h3>");
}
for(Post p : posts){

%>
<%
LikeDao Id=new LikeDao(ConnectionProvider.getConnection());
%>
<div class="col-md-6 mt-2"	>
<div class="card">
<img class="card-img-top" src="blog_pic\<%=p.getpPic() %>" alt="Card image cap">
<div class="card-body">


<b><%=p.getpTitle() %></b>
<p><%=p.getpContent() %></p>


</div>

</div>
<div class="card-footer text-center">



<a href="#!"  onclick="doLike(<%= p.getPid() %>,<%= uu.getId() %>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= Id.countLikeOnePost(p.getPid()) %></span></a>

<a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-primary btn-sm">Read More</a>

<a href="#" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i>10</a>

</div>
</div>
	
<%	
}


%>
</div>
