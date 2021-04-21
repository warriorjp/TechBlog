package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("email");
		String userpassword=request.getParameter("password");
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User u=dao.getUserByEmailAndPassword(username,userpassword);
		PrintWriter out=response.getWriter();
		if(u ==null) {
		//out.print("Invalid details...try again");
			Message msg= new Message("Inavalid Details ! try with another"," error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg",msg);
			response.sendRedirect("login_page.jsp");
		}else {
			HttpSession s=request.getSession();
			s.setAttribute("currentUser",u);
			response.sendRedirect("profile.jsp");
		
		}
	}

}
