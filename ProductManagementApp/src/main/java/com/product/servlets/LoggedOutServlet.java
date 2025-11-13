package com.product.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/logout")
public class LoggedOutServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		if(hs!=null)
		{
			hs.removeAttribute("bean");
			hs.invalidate();
			request.setAttribute("msg", "LoggedOut SuccessFully.....");
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
	}

}
