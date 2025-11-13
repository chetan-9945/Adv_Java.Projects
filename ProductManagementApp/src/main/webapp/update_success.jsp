<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notification</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f6f9;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .message-box {
        background: #fff;
        padding: 30px 40px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        text-align: center;
        width: 400px;
    }
    .message-box h2 {
        color: #333;
        margin-bottom: 20px;
    }
    .message-box p {
        font-size: 16px;
        margin-bottom: 25px;
        color: #555;
    }
    .btn {
        display: inline-block;
        padding: 10px 20px;
        margin: 5px;
        border-radius: 6px;
        text-decoration: none;
        color: white;
        font-weight: bold;
        transition: background 0.3s;
    }
    .view-btn {
        background-color: #007bff;
    }
    .view-btn:hover {
        background-color: #0056b3;
    }
    .logout-btn {
        background-color: #dc3545;
    }
    .logout-btn:hover {
        background-color: #b02a37;
    }
</style>
</head>
<body>
<%
    String msg = (String)request.getAttribute("msg");
%>
<div class="message-box">
    <h2>Notification</h2>
    <p><%= msg %></p>
    <a href="viewProduct" class="btn view-btn">View All Products</a>
    <a href="logout" class="btn logout-btn">Log Out</a>
</div>
</body>
</html>
