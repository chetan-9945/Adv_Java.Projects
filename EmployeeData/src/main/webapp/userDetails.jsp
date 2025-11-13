<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pojo.UserAccount" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Account Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.15);
            transition: transform 0.3s ease;
        }
        .card:hover {
            transform: scale(1.02);
        }
        .btn-primary, .btn-warning, .btn-danger {
            transition: all 0.3s ease-in-out;
        }
        .btn-primary:hover {
            background-color: #004085;
            transform: translateY(-3px);
        }
        .btn-warning:hover {
            background-color: #856404;
            transform: translateY(-3px);
        }
        .btn-danger:hover {
            background-color: #c82333;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
<%
    UserAccount user = (UserAccount) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("loginRegister.jsp?msg=Please login first");
        return;
    }

    String msg = (String) request.getAttribute("msg");
    String exceptionMsg = (String) request.getAttribute("exception");
%>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="welcome?action=home">User Portal</a>
        <div>
            <a class="btn btn-light me-2" href="welcome?action=home">Home</a>
            <a class="btn btn-light me-2" href="welcome?action=allUsers">All Users</a>
            <a class="btn btn-warning me-2" href="welcome?action=updateUser&id=<%= user.getUsername() %>">Update Account</a>
            <a class="btn btn-danger" href="welcome?action=deleteUser&id=<%= user.getUsername() %>" 
               onclick="return confirm('Are you sure you want to delete your account?');">Delete Account</a>
            <a class="btn btn-danger" href="welcome?action=logout">Logout</a>
        </div>
    </div>
</nav>

<!-- Content -->
<div class="container mt-5">
    <div class="card mx-auto p-4" style="max-width: 32rem;">
        <h3 class="text-center text-primary mb-3">My Account Details</h3>

        <% if (msg != null) { %>
            <div class="alert alert-success text-center"><%= msg %></div>
        <% } %>

        <% if (exceptionMsg != null) { %>
            <div class="alert alert-danger text-center">
                ⚠️ An error occurred: <%= exceptionMsg %>
            </div>
        <% } %>

        <ul class="list-group list-group-flush">
            <li class="list-group-item"><strong>Full Name:</strong> <%= user.getName() %></li>
            <li class="list-group-item"><strong>Mobile:</strong> <%= user.getMobile() %></li>
            <li class="list-group-item"><strong>Username:</strong> <%= user.getUsername() %></li>
            <li class="list-group-item"><strong>Email:</strong> <%= user.getEmail() %></li>
            <li class="list-group-item"><strong>Password:</strong> <%= user.getPassword() %></li>
        </ul>

        <div class="mt-4 d-flex justify-content-between">
            <a href="welcome?action=updateUser&id=<%= user.getUsername() %>" class="btn btn-warning">Update</a>
            <a href="welcome?action=home" class="btn btn-primary">Back to Home</a>
        </div>
    </div>
</div>
</body>
</html>
