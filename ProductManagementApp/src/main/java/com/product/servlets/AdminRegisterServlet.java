package com.product.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.product.bean.AdminBean;
import com.product.dao.AdminRegisterDao;

@WebServlet("/admin_reg")
public class AdminRegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("aname");
		String pass = request.getParameter("pass");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String mid = request.getParameter("mid");
		long phno = Long.parseLong(request.getParameter("phno"));

		AdminBean ab = new AdminBean(name, pass, fname, lname, mid, phno);
		AdminRegisterDao dao = new AdminRegisterDao();
		int k = dao.register(ab);

		if (k > 0) {
			request.setAttribute("message", "Admin Registered Successfully!");
			RequestDispatcher rd = request.getRequestDispatcher("admin_login.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("message", "Registration Failed! Please try again.");
			RequestDispatcher rd = request.getRequestDispatcher("admin_register.jsp");
			rd.forward(request, response);
		}
	}
}
