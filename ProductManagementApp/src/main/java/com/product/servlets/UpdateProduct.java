package com.product.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.product.dao.ProductDao;

@WebServlet("/product_edit")
public class UpdateProduct extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		if(hs!=null)
		{
			int k=new ProductDao().update
					(Integer.parseInt(request.getParameter("pid")),Double.parseDouble(request.getParameter("price")),Integer.parseInt(request.getParameter("qty")));
		if(k>0)
		{
			request.setAttribute("msg", "Product Updated SuccessFully");
			request.getRequestDispatcher("update_success.jsp").forward(request, response);
		}
		}
		else {
			request.setAttribute("msg", "Session has been Expired.....");
			request.getRequestDispatcher("session.jsp").forward(request, response);
		}
	}

}
