<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Registration</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #12c2e9, #c471ed, #f64f59);
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .register-container {
    background: #fff;
    padding: 35px;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
    width: 420px;
    text-align: center;
  }
  .register-container h2 {
    margin-bottom: 20px;
    color: #333;
  }
  .register-container input[type="text"],
  .register-container input[type="password"],
  .register-container input[type="email"] {
    width: 100%;
    padding: 12px;
    margin: 8px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
    font-size: 15px;
  }
  .register-container input[type="submit"] {
    width: 100%;
    padding: 12px;
    background: linear-gradient(to right, #06beb6, #48b1bf);
    border: none;
    border-radius: 8px;
    color: #fff;
    font-size: 18px;
    cursor: pointer;
    margin-top: 12px;
    transition: background 0.3s ease;
  }
  .register-container input[type="submit"]:hover {
    background: linear-gradient(to right, #48b1bf, #06beb6);
  }
  .register-container .links {
    margin-top: 15px;
  }
  .register-container .links a {
    text-decoration: none;
    color: #2980b9;
    font-weight: bold;
    margin: 0 8px;
    transition: color 0.3s ease;
  }
  .register-container .links a:hover {
    color: #8e44ad;
  }
  .success {
    background: #e8f9f1;
    color: #2e7d32;
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 15px;
    border: 1px solid #b2dfdb;
    font-weight: bold;
  }
</style>
</head>
<body>
  <div class="register-container">
    <h2>Admin Registration</h2>
    <%
      String msg = (String) request.getAttribute("msg");
      if (msg != null) {
    %>
      <div class="success"><%= msg %></div>
      <div class="links">
        <a href="admin_login.jsp">Go to Admin Login</a>
      </div>
    <% } else { %>
    <form action="admin_reg" method="post">
      <input type="text" name="aname" placeholder="Admin Name" required>
      <input type="password" name="pass" placeholder="Password" required>
      <input type="text" name="fname" placeholder="First Name" required>
      <input type="text" name="lname" placeholder="Last Name" required>
      <input type="email" name="mid" placeholder="Email Address" required>
      <input type="text" name="phno" placeholder="Phone Number" required>
      <input type="submit" value="Register">
    </form>
    <div class="links">
      <a href="admin_login.jsp">Already Registered? Login</a> |
      <a href="home.jsp">Back</a>
    </div>
    <% } %>
  </div>
</body>
</html>
