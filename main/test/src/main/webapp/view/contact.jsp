<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            display: flex;
            width: 800px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .left-section {
            flex: 1;
            background: #ffffff;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .left-section h2 {
            font-size: 28px;
            color: #2c3e50;
        }
        .right-section {
            flex: 1;
            background: black;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .right-section h2 {
            color: white;
        }
        .form-container {
            width: 100%;
        }
        label {
            font-weight: bold;
            display: block;
            text-align: left;
            margin-top: 10px;
            font-size: 14px;
            color: white;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            font-size: 14px;
        }
        textarea {
            height: 100px;
            resize: none;
        }
 button {
            width: 80%; /* Reduced width */
    padding: 10px;
    background-color: gray;
    color: black;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 15px;
    transition: background-color 0.3s ease;
        }
        button:hover {
            width: 80%; /* Reduced width */
    padding: 10px;
    background-color: gray;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 15px;
    transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background-color: gray;
        }
        }
    </style>
    
</head>
<body>

    <div class="container">
    <div class="left-section">
            <h2>Contact Us</h2>
            <img src="${pageContext.request.contextPath}/images/contact_us.jpg" alt="Contact Illustration" style="width: 100%; max-width: 450px;">
        </div>
        <div class="right-section">
            <div class="form-container">
        <h2>Contact Us</h2>
    <form action="${pageContext.request.contextPath}/contact" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" required><br><br>

        <label for="message">Message:</label>
        <textarea id="message" name="message" required></textarea><br><br>

       
        <button type="view/submit.jsp">Submit</button>
    </form>
    <!-- Back Button -->
    <form action="home.jsp">
        <button type="submit" class="back-button">Back to Home</button>
    </form>
    </div>
    </div>
    </div>
</body>
</html>
