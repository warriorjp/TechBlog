package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

/**
 * Servlet implementation class Login_servlet
 */
@WebServlet(name = "Logout_servlet", urlPatterns = { "/Logout_servlet" })
public class Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse   response) throws ServletException, IOException {
   
	
	
	HttpSession s=request.getSession();
	
	s.removeAttribute("currentUser");
	
	Message m=new Message("Logout  Successfuly","success","alert-success");
	s.setAttribute("msg", m);
	response.sendRedirect("login_page.jsp");

	}

}
