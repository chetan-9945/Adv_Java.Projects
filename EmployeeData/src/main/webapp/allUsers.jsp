<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.UserAccount" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Gradient background with animation */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(-45deg, #ff9a9e, #fad0c4, #a1c4fd, #c2e9fb);
            background-size: 400% 400%;
            animation: gradientBG 12s ease infinite;
        }
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Navbar */
        .navbar {
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
            animation: navFade 1s ease-in-out;
        }
        @keyframes navFade {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Content */
        .content {
            animation: fadeInUp 1.2s ease-in-out;
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Heading */
        h3 {
            font-weight: bold;
            text-align: center;
            color: #333;
            text-shadow: 2px 2px 5px rgba(0,0,0,0.2);
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            border-radius: 12px;
            overflow: hidden;
        }
        .table thead {
            background: linear-gradient(90deg, #6a11cb, #2575fc);
            color: white;
            font-size: 16px;
            text-align: center;
        }
        .table-hover tbody tr:hover {
            background: rgba(106, 17, 203, 0.1);
            transform: scale(1.01);
            transition: all 0.3s ease-in-out;
            cursor: pointer;
        }
        .table td, .table th {
            text-align: center;
            vertical-align: middle;
            padding: 15px;
        }

        /* Card container */
        .table-container {
            background: #fff;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        /* Search Bar */
        #searchInput {
            width: 100%;
            max-width: 350px;
            margin: 0 auto 20px auto;
            padding: 12px 15px;
            border: 2px solid #2575fc;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
            display: block;
        }
        #searchInput:focus {
            border-color: #6a11cb;
            box-shadow: 0 0 8px rgba(106, 17, 203, 0.4);
            outline: none;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#">🌐 User Portal</a>
            <div>
                <a class="btn btn-light me-2" href="welcome?action=home">Home</a>
                <a class="btn btn-light me-2" href="welcome?action=allUsers">All Users</a>
                <a class="btn btn-light me-2" href="welcome?action=userDetails">My Details</a>
                <a class="btn btn-danger" href="welcome?action=logout">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Content -->
    <div class="container mt-5 content">
        <h3>👥 All Registered Users</h3>

        <!-- Search Bar -->
        <input type="text" id="searchInput" placeholder="🔍 Search by username or email...">

        <div class="table-container">
        <%
            List<UserAccount> users = (List<UserAccount>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
        %>
            <table class="table table-bordered table-hover shadow-sm" id="usersTable">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                <% for (UserAccount u : users) { %>
                    <tr>
                        <td><%= u.getUsername() %></td>
                        <td><%= u.getEmail()%></td>
                    </tr>
                <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div class="alert alert-warning text-center fs-5">⚠️ No users found.</div>
        <% } %>
        </div>
    </div>

    <!-- JS for search filter -->
    <script>
        document.getElementById("searchInput").addEventListener("keyup", function () {
            let filter = this.value.toLowerCase();
            let rows = document.querySelectorAll("#usersTable tbody tr");

            rows.forEach(row => {
                let text = row.innerText.toLowerCase();
                row.style.display = text.includes(filter) ? "" : "none";
            });
        });
    </script>
</body>
</html>
