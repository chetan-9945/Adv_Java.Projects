package com.product.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.product.bean.BuyProductBean;

@WebServlet("/buy_p")
public class BuyProductServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pId = Integer.parseInt(request.getParameter("pid"));
	    String pName = request.getParameter("pname");
	    double price = Double.parseDouble(request.getParameter("price"));
	    int qty = Integer.parseInt(request.getParameter("qty"));
	    int rQty = Integer.parseInt(request.getParameter("rqty"));
	    double totalBill=price*rQty;
	   BuyProductBean bean=new BuyProductBean(pId, rQty, price, totalBill, pName);
	    request.setAttribute("pbean", bean);
	    request.getRequestDispatcher("bill.jsp").forward(request, response);
	}

}
