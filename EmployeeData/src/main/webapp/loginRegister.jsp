<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login & Signup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
        }

        body {
            background: linear-gradient(135deg, #74ABE2, #5563DE);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background: #fff;
            padding: 40px 30px;
            border-radius: 15px;
            width: 380px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
            position: relative;
            overflow: hidden;
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        .input-group {
            margin-bottom: 18px;
            position: relative;
        }

        .input-group i {
            position: absolute;
            top: 50%;
            left: 12px;
            transform: translateY(-50%);
            color: #888;
        }

        .input-group input {
            width: 100%;
            padding: 10px 10px 10px 35px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
        }

        .input-group input:focus {
            border-color: #5563DE;
            box-shadow: 0 0 5px rgba(85, 99, 222, 0.4);
        }

        .btn {
            width: 100%;
            padding: 10px;
            background: #5563DE;
            border: none;
            border-radius: 8px;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #3c4ad4;
        }

        .switch-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .switch-link a {
            color: #5563DE;
            font-weight: 600;
            text-decoration: none;
        }

        .switch-link a:hover {
            text-decoration: underline;
        }

        .msg {
            padding: 8px;
            border-radius: 6px;
            text-align: center;
            font-size: 14px;
            margin-bottom: 10px;
            opacity: 0;
            transform: translateY(-10px);
            transition: all 0.4s ease;
        }

        .msg.show {
            opacity: 1;
            transform: translateY(0);
        }

        .msg.error { background: #f8d7da; color: #721c24; }
        .msg.success { background: #d4edda; color: #155724; }

        /* Animation styles */
        .form {
            transition: all 0.5s ease;
        }

        .form.hidden {
            opacity: 0;
            transform: translateY(-30px);
            pointer-events: none;
            position: absolute;
            top: 0;
            width: 100%;
        }

        .form.active {
            opacity: 1;
            transform: translateY(0);
            pointer-events: all;
            position: relative;
        }
    </style>
</head>
<body>

<div class="form-container">
    <% 
       String errorMsg = (String) request.getAttribute("errorMsg");
       String successMsg = (String) request.getAttribute("successMsg");
       boolean showSignup = "signup".equals(request.getAttribute("showForm"));
    %>

    <!-- Login Form -->
    <form action="login" method="post" class="form <%= showSignup ? "hidden" : "active" %>" id="loginForm">
        <h1>Login</h1>
        <% if (errorMsg != null && !showSignup) { %>
            <div class="msg error show"><%= errorMsg %></div>
        <% } %>
        <% if (successMsg != null && !showSignup) { %>
            <div class="msg success show"><%= successMsg %></div>
        <% } %>

        <div class="input-group">
            <i class="fa-solid fa-user"></i>
            <input type="text" name="username" placeholder="Enter Username" required>
        </div>
        <div class="input-group">
            <i class="fa-solid fa-lock"></i>
            <input type="password" name="password" placeholder="Enter Password" required>
        </div>
        <button type="submit" class="btn">Login</button>
        <div class="switch-link">Don't have an account? 
            <a href="#" id="showSignup">Signup now</a>
        </div>
    </form>

    <!-- Signup Form -->
    <form action="register" method="post" class="form <%= showSignup ? "active" : "hidden" %>" id="signupForm">
        <h1>Signup</h1>
        <% if (errorMsg != null && showSignup) { %>
            <div class="msg error show"><%= errorMsg %></div>
        <% } %>
        <% if (successMsg != null && showSignup) { %>
            <div class="msg success show"><%= successMsg %></div>
        <% } %>

        <div class="input-group">
            <i class="fa-solid fa-user"></i>
            <input type="text" name="name" placeholder="Full Name" required>
        </div>
        <div class="input-group">
            <i class="fa-solid fa-mobile-screen"></i>
            <input type="text" name="mobile" placeholder="Mobile (10 digits)" required>
        </div>
        <div class="input-group">
            <i class="fa-solid fa-at"></i>
            <input type="text" name="username" placeholder="Username" required>
        </div>
        <div class="input-group">
            <i class="fa-solid fa-envelope"></i>
            <input type="email" name="email" placeholder="Email Address" required>
        </div>
        <div class="input-group">
            <i class="fa-solid fa-lock"></i>
            <input type="password" name="password" placeholder="Create Password" required>
        </div>
        <button type="submit" class="btn">Signup</button>
        <div class="switch-link">Already have an account? 
            <a href="#" id="showLogin">Login now</a>
        </div>
    </form>
</div>

<script>
    const loginForm = document.getElementById('loginForm');
    const signupForm = document.getElementById('signupForm');
    const showSignup = document.getElementById('showSignup');
    const showLogin = document.getElementById('showLogin');

    showSignup.addEventListener('click', (e) => {
        e.preventDefault();
        loginForm.classList.remove('active');
        loginForm.classList.add('hidden');
        signupForm.classList.remove('hidden');
        signupForm.classList.add('active');
    });

    showLogin.addEventListener('click', (e) => {
        e.preventDefault();
        signupForm.classList.remove('active');
        signupForm.classList.add('hidden');
        loginForm.classList.remove('hidden');
        loginForm.classList.add('active');
    });
</script>

</body>
</html>
