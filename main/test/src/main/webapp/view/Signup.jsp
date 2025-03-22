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
            max-width: 250%; /* Increased image size */
            border-radius: 10px;
            box-shadow: 3px 3px 10px rgba(0,0,0,0.2);
        }
        .link-style {
            text-decoration: none;
            color: white; /* Changed to white */
            font-weight: bold;
            display: block;
            margin-top: 15px;
            text-align: center;
        }
        .link-style:hover {
            color: #0b7dda;
        }
        .card {
            background-color: black; /* Changed to black */
        }
        .card-title, p {
            color: white; /* Signup Form & Not registered yet text color changed to white */
        }
        .input-field input {
            color: white; /* Input text color changed to white */
        }
        .btn-custom {
            background-color: black !important;
            color: white !important;
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
                    <div class="col s12 m5 center-align">
                        <img src="${pageContext.request.contextPath}/images/login.jpeg" class="responsive-img signup-image">
                    </div>
                    <!-- Signup Form on Right -->
                    <div class="col s12 m7">
                        <span class="card-title center-align">Signup Form</span>
                        <form action="<%=request.getContextPath() %>/SignupServlet" method="post">
                            <div class="input-field">
                                <input type="email" id="uname" name="uname" required/>
                                <label for="uname">Username</label>
                            </div>
                            <div class="input-field">
                                <input type="password" id="password" name="password" required/>
                                <label for="password">Password</label>
                            </div>
                            <div class="center-align">
                                <button type="submit" class="btn waves-effect waves-light">Sign Up</button>
                                <button type="reset" class="btn waves-effect waves-light">Clear</button>
                            </div>
                        </form>
                        <br>
                        <p class="center-align">Not registered yet? <a href="Register.jsp" class="link-style">Create Account</a></p>
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
