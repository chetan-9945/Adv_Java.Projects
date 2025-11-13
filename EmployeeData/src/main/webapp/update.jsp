<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pojo.UserAccount" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Account</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #6a5af9;
            --secondary-color: #f0f0f0;
            --text-color: #333;
            --light-text-color: #888;
            --white-color: #fff;
            --error-bg: #fce4ec;
            --error-color: #d32f2f;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            flex-direction: column; /* Allow navbar and content to stack */
            align-items: center;
            min-height: 100vh;
            background: var(--secondary-color);
        }

        /* Keep Bootstrap Navbar styles */
        .navbar {
            width: 100%;
        }

        .main-container {
            display: flex;
            width: 950px;
            max-width: 95%;
            margin-top: 40px; /* Space from navbar */
            background: var(--white-color);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* --- Left Side (Form) --- */
        .form-section {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        h1.title {
            font-size: 2.2rem;
            font-weight: 600;
            margin-bottom: 20px;
            position: relative;
            color: var(--text-color);
        }

        h1.title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -5px;
            height: 4px;
            width: 40px;
            background: var(--primary-color);
            border-radius: 2px;
        }

        .input-group {
            position: relative;
            margin-bottom: 20px;
        }

        .input-group i {
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            color: var(--light-text-color);
        }

        .input-group input {
            width: 100%;
            padding: 10px 10px 10px 30px;
            border: none;
            border-bottom: 1.5px solid #ccc;
            outline: none;
            font-size: 1rem;
            color: var(--text-color);
            transition: border-color 0.3s;
        }

        .input-group input:focus {
            border-bottom-color: var(--primary-color);
        }
        
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
        }

        button.btn-save {
            flex-grow: 1; /* Take remaining space */
            margin-left: 15px;
            padding: 12px;
            background: var(--primary-color);
            color: var(--white-color);
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s;
        }

        button.btn-save:hover {
            background: #5243c2;
        }
        
        a.btn-cancel {
            padding: 12px 25px;
            background-color: #6c757d;
            color: var(--white-color);
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: background-color 0.3s;
        }
        a.btn-cancel:hover {
            background-color: #5a6268;
        }

        /* --- Right Side (Info) --- */
        .info-section {
            flex: 1;
            background: linear-gradient(rgba(106, 90, 249, 0.8), rgba(106, 90, 249, 0.8)), url('https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') no-repeat center center/cover;
            color: var(--white-color);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 50px;
        }
        
        .info-section h2 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .info-section p {
            font-size: 1.2rem;
            font-weight: 300;
        }
        
        /* --- Server Messages --- */
        .msg {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 15px;
            text-align: center;
            font-weight: 500;
        }
        .error { color: var(--error-color); background: var(--error-bg); }
        
    </style>
</head>
<body>
<%
    UserAccount user = (UserAccount) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("loginRegister.jsp?msg=Please login first");
        return;
    }

    String exceptionMsg = (String) request.getAttribute("exception");
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="welcome?action=home">
            <i class="fa-solid fa-house-user me-2"></i>User Portal
        </a>
        <a class="btn btn-outline-light" href="welcome?action=logout">
            <i class="fa-solid fa-right-from-bracket me-2"></i>Logout
        </a>
    </div>
</nav>

<div class="main-container">
    <div class="form-section">
        <form action="welcome?action=saveUpdate" method="post">
            <h1 class="title">Update Account</h1>

            <% if (exceptionMsg != null) { %>
                <div class="msg error">
                    ⚠️ <%= exceptionMsg %>
                </div>
            <% } %>

            <div class="input-group">
                <i class="fa-solid fa-user"></i>
                <input type="text" name="name" value="<%= user.getName() %>" required>
            </div>

            <div class="input-group">
                <i class="fa-solid fa-mobile-screen"></i>
                <input type="text" name="mobile" value="<%= user.getMobile() %>" required>
            </div>

            <div class="input-group">
                <i class="fa-solid fa-at"></i>
                <input type="text" name="username" value="<%= user.getUsername() %>" required>
            </div>

            <div class="input-group">
                <i class="fa-solid fa-envelope"></i>
                <input type="email" name="email" value="<%= user.getEmail() %>" required>
            </div>

            <div class="input-group">
                <i class="fa-solid fa-lock"></i>
                <input type="password" name="password" value="<%= user.getPassword() %>" required>
            </div>

            <div class="form-actions">
                <a href="welcome?action=home" class="btn-cancel">Cancel</a>
                <button type="submit" class="btn-save">Save Changes</button>
            </div>
        </form>
    </div>

    <div class="info-section">
        <h2>Keep Your Profile Fresh.</h2>
        <p>Your journey, your details. Make sure they're up to date.</p>
    </div>
</div>
</body>
</html>