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
        background: linear-gradient(to right, #4facfe, #00f2fe);
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
        width: 400px;
    }

    h1 {
        color: #333;
        margin-bottom: 10px;
    }

    .welcome {
        font-size: 20px;
        font-weight: bold;
        color: #555;
        margin-bottom: 30px;
    }

    .nav-links {
        display: flex;
        justify-content: space-around;
        margin-top: 20px;
    }

    .nav-links a {
        text-decoration: none;
        background: #4facfe;
        color: white;
        padding: 12px 20px;
        border-radius: 8px;
        transition: 0.3s ease;
        font-weight: bold;
    }

    .nav-links a:hover {
        background: #00c6ff;
        transform: scale(1.05);
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }
</style>
</head>
<body>
<%
AdminBean ab = (AdminBean)request.getAttribute("bean");
%>
<div class="container">
    <h1>Login Successful 🎉</h1>
    <div class="welcome">Welcome, <%= ab.getName() %></div>

    <div class="nav-links">
        <a href="product.jsp">➕ Add Product</a>
        <a href="viewProduct">📦 View Products</a>
        <a href="logout">🚪 Log Out</a>
    </div>
</div>
</body>
</html>
