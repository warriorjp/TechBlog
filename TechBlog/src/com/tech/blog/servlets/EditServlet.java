package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;


import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 //fetch all data
		String userEmail =request.getParameter("user_email");
		String userName=request.getParameter("user_name");
		String userPassword =request.getParameter("password");
		javax.servlet.http.Part part =request.getPart("image");
		String imageName=part.getSubmittedFileName();
		
		//get the user from the session...
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
	    String oldFile =user.getProfile();
		user.setProfile(imageName);
		
//update database
		UserDao userDao=new UserDao(ConnectionProvider.getConnection());
		PrintWriter out=response.getWriter();
		boolean ans=userDao.updateUser(user);
		if(ans) {
		out.println("updated to db");
		String path=request.getRealPath("/")+"pic"+File.separator+user.getProfile();
		
			String patholdFile=request.getRealPath("/")+"pic"+File.separator+oldFile;
		
			if(oldFile.equals("default.png")) {
			  com.tech.blog.helper.Helper.deleteFile(patholdFile);
			}
			
				if(com.tech.blog.helper.Helper.savaFile(part.getInputStream(),path)) 
				{
				           
				out.println("profile updated........");	
				       
				 Message msg= new Message("Profile  Details Updated ..."," success","alert-success");
					s.setAttribute("msg",msg);
			
				}else {
					Message msg= new Message("Something went wrong ..."," error","alert-danger");
					s.setAttribute("msg",msg);
				}
			}else {
				Message msg= new Message("Something went wrong ..."," error","alert-danger");
				s.setAttribute("msg",msg);
			}
		response.sendRedirect("profile.jsp");
	
	}

}
