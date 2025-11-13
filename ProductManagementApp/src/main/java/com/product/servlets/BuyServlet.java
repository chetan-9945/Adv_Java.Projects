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

@WebServlet("/buyservlet")
public class BuyServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		if(hs!=null)
		{
		int id = Integer.parseInt(request.getParameter("id"));
	    ProductBean pb = new ProductDao().buy(id);
	     if(pb!=null)
	     {
	    	 request.setAttribute("pbean", pb);
	    	 request.getRequestDispatcher("buyProduct.jsp").forward(request, response);
	     }
		}
		else {
			request.setAttribute("msg", "Session has been Expired.....");
			request.getRequestDispatcher("session.jsp").forward(request, response);
		}
	}

}
