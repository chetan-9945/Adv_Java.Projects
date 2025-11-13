<%@page import="com.product.bean.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #ff9966, #ff5e62);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background: #fff;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        text-align: center;
        width: 420px;
    }

    h2 {
        color: #333;
        margin-bottom: 15px;
    }

    .welcome {
        font-size: 18px;
        font-weight: bold;
        color: #444;
        margin-bottom: 20px;
    }

    .message {
        background: #e8f9f1;
        color: #2e7d32;
        padding: 12px;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 500;
        margin-bottom: 25px;
        border: 1px solid #b2dfdb;
    }

    .nav-links {
        display: flex;
        justify-content: space-around;
    }

    .nav-links a {
        text-decoration: none;
        background: #ff5e62;
        color: white;
        padding: 12px 18px;
        border-radius: 8px;
        transition: 0.3s ease;
        font-weight: bold;
    }

    .nav-links a:hover {
        background: #ff3d47;
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }
</style>
</head>
<body>
<%
AdminBean ab = (AdminBean)session.getAttribute("bean");
if(ab == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
String msg = (String)request.getAttribute("add");
%>
<div class="container">
    <h2>Welcome, <%= ab.getName() %> 🎉</h2>
    <% if(msg != null) { %>
        <div class="message"><%= msg %></div>
    <% } %>

    <div class="nav-links">
        <a href="viewProduct">📦 View All Products</a>
        <a href="logout">🚪 Log Out</a>
    </div>
</div>
</body>
</html>