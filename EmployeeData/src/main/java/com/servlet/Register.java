package com.servlet;

import java.io.IOException;

import com.dao.UserDAO;
import com.pojo.UserAccount;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserAccount user = new UserAccount();
        user.setName(name);
        user.setMobile(mobile);
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);

        boolean isRegistered = userDAO.registerUser(user);

        if (isRegistered) {
            request.setAttribute("successMsg", "Registration Successful");
        } else {
            request.setAttribute("errorMsg", "Registration Failed");
        }

        RequestDispatcher rd = request.getRequestDispatcher("loginRegister.jsp");
        rd.forward(request, response);
    }
}
