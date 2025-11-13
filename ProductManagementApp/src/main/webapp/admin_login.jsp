<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background: linear-gradient(120deg, #2980b9, #8e44ad);
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .login-container {
    background: #fff;
    padding: 40px;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
    width: 350px;
    text-align: center;
  }
  .login-container h2 {
    margin-bottom: 15px;
    color: #333;
  }
  .message {
    color: red;
    font-weight: bold;
    margin-bottom: 15px;
  }
  .login-container input[type="text"],
  .login-container input[type="password"] {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 16px;
  }
  .login-container button {
    width: 100%;
    padding: 12px;
    background: linear-gradient(to right, #ff512f, #dd2476);
    border: none;
    border-radius: 8px;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
    margin-top: 15px;
    transition: background 0.3s ease;
  }
  .login-container button:hover {
    background: linear-gradient(to right, #dd2476, #ff512f);
  }
  .login-container .links {
    margin-top: 20px;
  }
  .login-container .links a {
    margin: 0 10px;
    text-decoration: none;
    color: #2980b9;
    font-weight: bold;
    transition: color 0.3s ease;
  }
  .login-container .links a:hover {
    color: #8e44ad;
  }
</style>
</head>
<body>

  <div class="login-container">
    <h2>Admin Login</h2>
    
    <!-- Display servlet message -->
    <%
      String msg = (String) request.getAttribute("message");
      if (msg != null) {
    %>
        <div class="message"><%= msg %></div>
    <%
      }
    %>
    
    <form action="admin_login" method="post">
      <input type="text" name="aname" placeholder="Enter Admin Name" required>
      <input type="password" name="pword" placeholder="Enter Password" required>
      <button type="submit">Login</button>
    </form>
    
    <div class="links">
      <a href="admin_register.jsp">New Admin</a> |
      <a href="home.jsp">Back</a>
    </div>
  </div>
</body>
</html>
