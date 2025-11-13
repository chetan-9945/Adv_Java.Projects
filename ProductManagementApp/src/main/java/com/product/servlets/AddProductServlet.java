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

@WebServlet("/add_Product")
public class AddProductServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		if(hs!=null)
		{
		ProductBean pb=new ProductBean
				(Integer.parseInt(request.getParameter("pid")), request.getParameter("pname"), Double.parseDouble(request.getParameter("price")), Integer.parseInt(request.getParameter("qty")));
	   int k = new ProductDao().addProduct(pb);
	   if(k>0)
	   {
		   request.setAttribute("add", "Product Added SuccessFully....");
		   request.getRequestDispatcher("add_success.jsp").forward(request, response);
	   }
		}
		else {
			request.setAttribute("msg", "Session has been Expired.....");
			request.getRequestDispatcher("session.jsp").forward(request, response);
		}
	}

}
