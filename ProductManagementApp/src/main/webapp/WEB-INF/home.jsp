<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #fff;
    }
    .container {
      text-align: center;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      padding: 50px;
      border-radius: 20px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
      animation: fadeIn 1.2s ease-in-out;
    }
    h1 {
      font-size: 2.8em;
      margin-bottom: 25px;
      font-weight: bold;
      letter-spacing: 1px;
    }
    .btn {
      display: inline-block;
      margin: 15px;
      padding: 14px 35px;
      font-size: 18px;
      text-decoration: none;
      color: #fff;
      border-radius: 30px;
      background: linear-gradient(45deg, #ff512f, #dd2476);
      transition: all 0.3s ease;
      font-weight: bold;
    }
    .btn:hover {
      transform: translateY(-5px) scale(1.05);
      box-shadow: 0 8px 20px rgba(0,0,0,0.4);
    }
    .msg {
      margin-bottom: 20px;
      font-size: 16px;
      padding: 10px;
      border-radius: 8px;
      background: rgba(255, 255, 255, 0.2);
      color: #fff;
      animation: slideIn 0.8s ease-in-out;
    }

    /* Animations */
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    @keyframes slideIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>
<%
String msg = (String) request.getAttribute(("msg"));
%>
  <div class="container">
    <% if(msg != null) { %>
      <div class="msg"><%= msg %></div>
    <% } %>
    <h1>🌟 Welcome to Our Portal 🌟</h1>
    <a href="admin_login.jsp" class="btn">Admin</a>
    <a href="customer_login.jsp" class="btn">Customer</a>
  </div>
</body>
</html>
