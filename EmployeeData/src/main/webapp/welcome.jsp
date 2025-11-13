<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pojo.UserAccount" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
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
            --danger-color: #dc3545;
            --warning-color: #ffc107;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background: var(--secondary-color);
        }

        /* Navbar */
        .navbar {
            width: 100%;
            background-color: var(--primary-color) !important;
        }
         .navbar-brand {
            font-weight: bold;
        }

        .main-container {
            display: flex;
            width: 950px;
            max-width: 95%;
            margin-top: 40px;
            background: var(--white-color);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* --- Left Side (Content) --- */
        .content-section {
            flex: 1;
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }

        .welcome-title {
            font-size: 2.5rem;
            font-weight: 600;
            color: var(--text-color);
            line-height: 1.2;
        }

        .welcome-title span {
            color: var(--primary-color);
            font-weight: 700;
        }
        
        .welcome-subtitle {
            font-size: 1.1rem;
            color: var(--light-text-color);
            margin-top: 10px;
            margin-bottom: 30px;
        }

        .action-buttons {
            display: flex;
            flex-direction: column;
            gap: 15px;
            align-items: center;
        }

        .action-buttons .btn {
            width: 80%;
            padding: 12px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 8px;
        }
        
        .btn.btn-details {
            background: transparent;
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
        }
        .btn.btn-details:hover {
            background: var(--primary-color);
            color: var(--white-color);
        }

        .btn.btn-update {
            background: var(--warning-color);
            color: var(--text-color);
            border: 2px solid var(--warning-color);
        }
        .btn.btn-update:hover {
            background: #e0a800;
            border-color: #e0a800;
        }

        .btn.btn-delete {
            background: transparent;
            border: 2px solid var(--danger-color);
            color: var(--danger-color);
        }
        .btn.btn-delete:hover {
            background: var(--danger-color);
            color: var(--white-color);
        }

        /* --- Right Side (Info) --- */
        .info-section {
            flex: 1;
            background: linear-gradient(rgba(106, 90, 249, 0.85), rgba(106, 90, 249, 0.85)), url('https://images.pexels.com/photos/3184423/pexels-photo-3184423.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') no-repeat center center/cover;
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
        
    </style>
</head>
<body>
   <%
    UserAccount user = (UserAccount) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("loginRegister.jsp");
        return;
    }
%>

    <nav class="navbar navbar-expand-lg navbar-dark shadow-sm">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><i class="fa-solid fa-house-user me-2"></i>User Portal</a>
            <div>
                <a class="btn btn-outline-light me-2" href="welcome?action=home">Home</a>
                <a class="btn btn-outline-light me-2" href="welcome?action=allUsers">All Users</a>
                <a class="btn btn-outline-light me-2" href="welcome?action=userDetails">My Details</a>
                <a class="btn btn-light" href="welcome?action=logout"><i class="fa-solid fa-right-from-bracket me-1"></i>Logout</a>
            </div>
        </div>
    </nav>

    <div class="main-container">
        <div class="content-section">
            <h1 class="welcome-title">
                Welcome Back, <br><span><%= user.getName() %>!</span> 🎉
            </h1>
            <p class="welcome-subtitle">Manage your account and explore features from your central hub.</p>

            <div class="action-buttons">
                 <a href="welcome?action=userDetails" class="btn btn-details">
                    <i class="fa-solid fa-circle-user"></i> View My Details
                </a>

                <a href="welcome?action=updateUser&id=<%= user.getUsername() %>" class="btn btn-update">
                   <i class="fa-solid fa-user-pen"></i> Update Account
                </a>

                <a href="welcome?action=deleteUser&id=<%= user.getUsername() %>" 
                   class="btn btn-delete"
                   onclick="return confirm('Are you sure you want to delete your account? This cannot be undone.');">
                   <i class="fa-solid fa-user-slash"></i> Delete Account
                </a>
            </div>
        </div>

        <div class="info-section">
            <h2>Your Central Hub</h2>
            <p>Everything you need, all in one place. Your journey starts here.</p>
        </div>
    </div>
</body>
</html>