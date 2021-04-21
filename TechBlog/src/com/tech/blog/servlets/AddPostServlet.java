package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;


@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     PrintWriter out=response.getWriter();
		  int cid=Integer.parseInt(request.getParameter("cid"));
		  String pTitle =request.getParameter("pTitle");
		  String pContent=request.getParameter("pContent");
		  String pCode=request.getParameter("pCode");
		  javax.servlet.http.Part part=request.getPart("pic");
		  
		  HttpSession session = request.getSession();
		  User user = (User) session.getAttribute("currentUser");
		  
        Post p= new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
		
		PostDao dao =new PostDao(ConnectionProvider.getConnection());
		System.out.println("hii"+dao);
		if(dao.savePost(p)) {
			out.println("done");			
			String path=request.getRealPath("/")+"blog_pic"+File.separator+part.getSubmittedFileName();
			/*F:\WelcomeAgain\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TechBlog*/
			com.tech.blog.helper.Helper.savaFile(part.getInputStream(), path);
		}else {
			out.println("error");
		}
	}

}
