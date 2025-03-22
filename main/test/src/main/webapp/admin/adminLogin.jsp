<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>

    <!-- Materialize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    
    <style>
        /* Center the login form vertically and horizontally */
        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        
        /* Box for the login card with shadow and padding */
        .card {
            background-color: black; /* Keep black background for the card */
            width: 100%;
            max-width: 600px; /* Increased the card width */
            border-radius: 15px;
            display: flex;
            flex-direction: row;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        
        /* Style for the image side of the card */
        .card-image {
            flex: 1;
            margin-right: 20px;
        }

        .card-image img {
            width: 100%;
            border-radius: 10px;
            object-fit: cover;
            height: 100%;
        }

        /* Style for the form side of the card */
        .card-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        /* Title and text color */
        .card-title, p {
            color: white; /* Changed to white */
            font-size: 1.5rem; /* Title font size increased */
        }

        /* Form label and input color */
        .input-field input {
            color: white; /* Input text color */
        }
        
        .input-field label {
            color: gray; /* Label text color */
        }

        /* Button styling */
        .btn {
            background-color: black; /* Blue button color */
            width: 100%; /* Make the button full width */
        }
        
        /* Hover effect on the button */
        .btn:hover {
            background-color: #0a68b0; /* Darker blue on hover */
        }
        
        /* Link style - for forgotten password or signup link (if any) */
        .link-style {
            text-decoration: none;
            color: white; /* White text color */
            font-weight: bold;
            text-align: center;
            display: block;
            margin-top: 20px;
        }
        
        /* Hover effect on the link */
        .link-style:hover {
            color: #0b7dda; /* Blue on hover */
        }
    </style>
</head>
<body>

<div class="container login-container">
    <div class="card">
        <!-- Image side -->
        <div class="card-image">
            <img src="${pageContext.request.contextPath}/images/login.jpeg" class="responsive-img signup-image" alt="Admin Image"> <!-- Replace with your image URL -->
        </div>

        <!-- Form side -->
        <div class="card-content">
            <span class="card-title">Admin Login</span>
            <form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post">
                <div class="input-field">
                    <input type="text" id="username" name="username" required>
                    <label for="username">Admin Username</label>
                </div>
                <div class="input-field">
                    <input type="password" id="password" name="password" required>
                    <label for="password">Admin Password</label>
                </div>
                <button type="submit" class="btn waves-effect waves-light">Login</button>
            </form>
        </div>
    </div>
</div>

<!-- Materialize JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
