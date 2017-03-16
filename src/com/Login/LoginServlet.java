package com.Login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("textfield");
		String password = request.getParameter("textfield1");
		
		LoginDAO logObj = new LoginDAO();
		boolean result = logObj.check(email,password);
		
		if (result)
		{
			try {
			User user = logObj.getUser();
			request.getSession().setAttribute("user",user);
			request.getSession().setAttribute("token_user", "true");
			request.getSession().setAttribute("token", "value");
			}
			catch(Exception e){}
			response.sendRedirect("home.jsp");
		}
		else {
			response.sendRedirect("Login.jsp");
		}
	}

}
