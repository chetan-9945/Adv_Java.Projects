package com.product.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.product.dao.ProductDao;

//@WebServlet("/bill_servlet")
public class BillServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int k = new ProductDao().updateQty(request.getParameter("pid"), request.getParameter("rqty"));
		if (k > 0) {
			request.setAttribute("result", "Payment Successful");
			request.setAttribute("cbean", request.getSession().getAttribute("cbean"));
			request.getRequestDispatcher("paymentSuccess.jsp").forward(request, response);
		} else {
			request.setAttribute("result", "Payment Failed");
			request.getRequestDispatcher("buyProduct.jsp").forward(request, response);
		}
	}
}
