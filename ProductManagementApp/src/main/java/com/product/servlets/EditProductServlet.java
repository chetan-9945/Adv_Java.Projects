package com.product.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.product.bean.ProductBean;
import com.product.dao.ProductDao;

@WebServlet("/editproduct")
public class EditProductServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		if(hs!=null)
		{
			ProductBean pb = new ProductDao().getById(Integer.parseInt(request.getParameter("id")));
		    request.setAttribute("pb", pb);
		    request.getRequestDispatcher("editProduct.jsp").forward(request, response);
		}
		else {

			request.setAttribute("msg", "Session has been Expired.....");
			request.getRequestDispatcher("session.jsp").forward(request, response);
		}
	}
}


