package com.product.servlets;

import java.io.IOException;

import com.product.bean.AdminBean;
import com.product.dao.AdminLoginDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin_login")
public class AdminLoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminBean ab = new AdminLoginDao().login(request.getParameter("aname"),request.getParameter("pword"));
	    if(ab!=null)
	    {
	    	HttpSession hs=request.getSession();
	    	hs.setAttribute("bean", ab);
	    	request.setAttribute("bean", ab);
	    	request.getRequestDispatcher("login_success.jsp").forward(request, response);
	    }
	    else {
	    	request.setAttribute("msg", "Invalid UserName or Password");
	    	request.getRequestDispatcher("login_failed.jsp").forward(request, response);
	    }
	}

}
