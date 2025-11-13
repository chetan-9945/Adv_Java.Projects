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
        background: #f4f7fa;
    }

    /* Sidebar */
    .sidebar {
        width: 220px;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        background: #2c3e50;
        padding-top: 30px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .sidebar h2 {
        color: white;
        margin-bottom: 40px;
        font-size: 22px;
    }
    .sidebar a {
        display: block;
        width: 160px;
        margin: 10px 0;
        padding: 12px;
        background: #3498db;
        color: white;
        text-align: center;
        border-radius: 8px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s;
    }
    .sidebar a:hover {
        background: #2980b9;
        transform: scale(1.05);
    }

    /* Main content */
    .main {
        margin-left: 220px;
        padding: 30px;
    }
    .welcome {
        background: #3498db;
        color: white;
        padding: 20px;
        border-radius: 8px;
        font-size: 20px;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .welcome span {
        font-weight: bold;
    }
    .msg {
        background: #ecf0f1;
        border-left: 6px solid #27ae60;
        padding: 15px;
        margin-bottom: 20px;
        font-size: 16px;
        border-radius: 6px;
    }

    footer {
        margin-top: 40px;
        text-align: center;
        color: #555;
        font-size: 14px;
    }
</style>
</head>
<body>

<%
  AdminBean ab = (AdminBean)session.getAttribute("bean");
  String msg = (String)request.getAttribute("msg");
%>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="product.jsp">➕ Add Product</a>
    <a href="viewProduct">📦 View Products</a>
    <a href="logout">🚪 Logout</a>
</div>

<!-- Main Content -->
<div class="main">
    <div class="welcome">
        <div>👋 Welcome, <span><%= ab.getName() %></span></div>
    </div>

    <% if(msg != null) { %>
    <div class="msg"><%= msg %></div>
    <% } %>

    <footer>
        &copy; 2025 Product Management System | Admin Dashboard
    </footer>
</div>

</body>
</html>
