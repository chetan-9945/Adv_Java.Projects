<%@page import="com.product.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Welcome Page</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }
    .container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 16px;
      padding: 40px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
      max-width: 480px;
      width: 100%;
    }
    h2 {
      margin-bottom: 20px;
      font-size: 24px;
      font-weight: 600;
    }
    .message {
      margin-bottom: 16px;
      font-size: 16px;
      background: rgba(255,255,255,0.15);
      padding: 10px 14px;
      border-radius: 8px;
    }
    .links {
      margin-top: 20px;
      display: flex;
      gap: 16px;
      justify-content: center;
    }
    a {
      text-decoration: none;
      background: #fff;
      color: #2575fc;
      padding: 10px 18px;
      border-radius: 8px;
      font-weight: 600;
      transition: all 0.3s ease;
    }
    a:hover {
      background: #2575fc;
      color: #fff;
      transform: translateY(-2px);
    }
  </style>
</head>
<body>
  <%
    String result = (String) request.getAttribute("result");
    CustomerBean cb = (CustomerBean) session.getAttribute("cbean");
  %>
  <div class="container">
    <div class="message"><%= result %></div>
    <h2>Welcome, <%= cb.getUserName() %> 👋</h2>
    <div class="links">
      <a href="viewProduct">View Products</a>
      <a href="logout">Logout</a>
    </div>
  </div>
</body>
</html>
