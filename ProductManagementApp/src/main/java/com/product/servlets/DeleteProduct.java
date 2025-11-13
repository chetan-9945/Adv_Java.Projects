package com.product.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.product.dao.ProductDao;
@WebServlet("/deleteProduct")
public class DeleteProduct extends HttpServlet {
	
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession hs=request.getSession(false);
		if(hs!=null)
		{
			int k=new ProductDao().delete(Integer.parseInt(request.getParameter("id")));
		    if(k>0)
		    {
		    	request.setAttribute("msg", "Product with id "+Integer.parseInt(request.getParameter("id"))+" deleted SuccessFully");
		        request.getRequestDispatcher("delete.jsp").forward(request, response);
		    }
		}
		else {
			request.setAttribute("msg", "Session has been Expired.....");
			request.getRequestDispatcher("session.jsp").forward(request, response);
		}
		
	}

}
