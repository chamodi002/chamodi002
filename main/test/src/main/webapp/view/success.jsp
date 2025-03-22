<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Success</title>
 <style>
        body {
            font-family: Arial, sans-serif;
            background: url('${pageContext.request.contextPath}/images/taxis-3985477_1280.jpg') no-repeat center center fixed;
            background-size: cover;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: rgba(255, 255, 255, 0.5);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            display: inline-block;
            max-width: 500px;
        }
        h2 {
            color: black;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background-color: black;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s;
        }
        a:hover {
            background-color: black;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Thank you! Your message has been received.</h2>
    <a href="contact.jsp">Go Back</a>
</body>
</html>
