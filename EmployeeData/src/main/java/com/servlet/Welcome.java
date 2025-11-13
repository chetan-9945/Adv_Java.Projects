package com.servlet;

import com.dao.UserDAO;
import com.pojo.UserAccount;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/welcome")
public class Welcome extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "home"; 
        }

        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession(false);
        UserAccount loggedUser = session == null ? null : (UserAccount) session.getAttribute("user");

        String destination = "welcome.jsp"; // default

        switch (action) {
            case "allUsers":
                List<UserAccount> users = dao.getAllUsers();
                request.setAttribute("users", users);
                destination = "allUsers.jsp";
                break;

            case "userDetails":
                if (loggedUser != null) {
                    request.setAttribute("userDetails", loggedUser);
                    destination = "userDetails.jsp";
                } else {
                    response.sendRedirect("loginRegister.jsp");
                    return;
                }
                break;

            case "updateUser":
                if (loggedUser != null) {
                    request.setAttribute("userDetails", loggedUser);
                    destination = "update.jsp";
                } else {
                    response.sendRedirect("loginRegister.jsp");
                    return;
                }
                break;

            case "saveUpdate":
                if (loggedUser != null) {
                    String name = request.getParameter("name");
                    String mobile = request.getParameter("mobile");
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");

                    try {
                        UserAccount updatedUser = new UserAccount(name, mobile, username, email, password);
                        dao.updateUser(updatedUser);
                        // update session
                        session.setAttribute("user", updatedUser);

                        request.setAttribute("msg", "Account updated successfully!");
                        request.setAttribute("userDetails", updatedUser);
                        destination = "userDetails.jsp";
                    } catch (Exception e) {
                        request.setAttribute("exception", e.getMessage());
                        request.setAttribute("userDetails", loggedUser);
                        destination = "userDetails.jsp";
                    }
                } else {
                    response.sendRedirect("loginRegister.jsp");
                    return;
                }
                break;

            case "deleteUser":
                if (loggedUser != null) {
                    String username = request.getParameter("id");
                    dao.deleteUser(username);
                    session.invalidate();
                    request.setAttribute("msg", "Your account has been deleted.");
                    destination = "loginRegister.jsp";
                } else {
                    response.sendRedirect("loginRegister.jsp");
                    return;
                }
                break;

            case "logout":
                if (session != null) session.invalidate();
                destination = "loginRegister.jsp";
                break;

            case "home":
            default:
                destination = "welcome.jsp";
                break;
        }

        RequestDispatcher rd = request.getRequestDispatcher(destination);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
