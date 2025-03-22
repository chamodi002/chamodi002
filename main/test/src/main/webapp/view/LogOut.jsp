<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logging Out...</title>
    <style>
        body {
            background: url('${pageContext.request.contextPath}/images/bd07bacb3aea3ad7a88102a74737cc70.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            text-align: center;
            font-family: Arial, sans-serif;
            margin-top: 50px;
        }
        .logout-container {
            background: rgba(0, 0, 0, 0.6);
            padding: 20px;
            display: inline-block;
            border-radius: 10px;
        }
    </style>
    <script>
        function confirmLogout() {
            let confirmAction = confirm("Are you sure you want to log out?");
            if (confirmAction) {
                window.location.href = "LogOut.jsp?confirm=yes"; // If confirmed, reload with parameter
            } else {
                window.location.href = "LogOut.jsp"; // If canceled, redirect back
            }
        }

        // If logout is confirmed in URL, invalidate session and redirect
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('confirm') === 'yes') {
                setTimeout(() => {
                    <% session.invalidate(); %> // Destroy session
                    window.location.href = "Signup.jsp"; // Redirect after logout
                }, 2000);
            }
        };
    </script>
</head>
<body>
    <div class="logout-container">
        <h2>Are you sure you want to log out?</h2>
        <button class="confirm-btn" onclick="confirmLogout()">Yes, Logout</button>
        <button class="cancel-btn" onclick="window.location.href='dashboard.jsp'">Cancel</button>
    </div>
</body>
</html>