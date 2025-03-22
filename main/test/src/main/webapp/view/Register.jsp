<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Materialize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>
        .signup-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .signup-image {
            max-width: 300%; /* Increased image size */
            width: 100%; /* Ensures it adapts to the container */
            height: auto;
            border-radius: 10px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
            margin-top: 90px; /* Added margin to push the image down */
        }
        .link-style {
            text-decoration: none;
            color: white;
            font-weight: bold;
            display: block;
            margin-top: 15px;
            text-align: center;
        }
        .link-style:hover {
            color: #0b7dda;
        }
        .card {
            background-color: black;
            width: 80%;
            max-width: 700px; /* Slightly increased max-width for better spacing */
        }
        .card-title, p {
            color: white;
        }
        .input-field input {
            color: white;
        }
        .center-align {
            text-align: center;
        }
        .btn-custom {
            background-color: white !important;
            color: black !important;
        }
    </style>
</head>
<body class="container">
<div class="row signup-container">
    <div class="col s12 m8">
        <div class="card">
            <div class="card-content">
                <div class="row">
                    <!-- Image on Left -->
                    <div class="col s12 m6 center-align">
                        <img src="${pageContext.request.contextPath}/images/login.jpeg" class="responsive-img signup-image">
                    </div>
                    <!-- Registration Form on Right -->
                    <div class="col s12 m6">
                        <span class="card-title center-align">Registration Form</span>
                        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
                            <div class="input-field">
                                <input type="text" id="name" name="name" required>
                                <label for="name">Full Name</label>
                            </div>
                            <div class="input-field">
                                <input type="text" id="address" name="address" required>
                                <label for="address">Address</label>
                            </div>
                            <div class="input-field">
                                <input type="number" id="contact" name="contact" required>
                                <label for="contact">Contact</label>
                            </div>
                            <div class="input-field">
                                <input type="email" id="uname" name="uname" required>
                                <label for="uname">Email</label>
                            </div>
                            <div class="input-field">
                                <input type="password" id="password" name="password" required>
                                <label for="password">Password</label>
                            </div>
                            <div class="center-align">
                                <button type="submit" class="btn waves-effect waves-light">Sign Up</button>
                                <button type="reset" class="btn waves-effect waves-light">Clear</button>
                            </div>
                        </form>
                        <br>
                        <p class="center-align">Already have an account? <a href="Signup.jsp" class="link-style">Sign Up</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Materialize JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
