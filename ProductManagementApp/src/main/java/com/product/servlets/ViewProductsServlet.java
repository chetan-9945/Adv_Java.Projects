package com.product.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.product.bean.ProductBean;
import com.product.dao.ProductDao;
@WebServlet("/viewProduct")
public class ViewProductsServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		if(hs!=null)
		{
			
			List<ProductBean> list = new ProductDao().viewAllProduct();
			System.out.println(list);
			request.setAttribute("products", list);
		    request.getRequestDispatcher("product_list.jsp").forward(request, response);
		}
		else {
			request.setAttribute("msg", "Session has been Expired.....");
			request.getRequestDispatcher("session.jsp").forward(request, response);
		}
		
	}

}
