<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        .summary-container {
            width: 50%;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #333;
        }
        p {
            font-size: 18px;
            line-height: 1.5;
        }
        button {
            background: #ff6600;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }
        button:hover {
            background: #cc5500;
        }
    </style>
</head>
<body>

    <div class="summary-container">
        <h2>Booking Summary</h2>
        
        <p><strong>Vehicle Type:</strong> <%= request.getAttribute("vehicleType") %></p>
        <p><strong>Price:</strong> LKR <%= request.getAttribute("price") %></p>
        <p><strong>Customer Name:</strong> <%= request.getAttribute("customerName") %></p>
        <p><strong>Email:</strong> <%= request.getAttribute("customerEmail") %></p>
        <p><strong>Phone:</strong> <%= request.getAttribute("customerPhone") %></p>
        <p><strong>Pickup Location:</strong> <%= request.getAttribute("pickupLocation") %></p>
        <p><strong>Drop-off Location:</strong> <%= request.getAttribute("dropoffLocation") %></p>
        <p><strong>Pickup Date & Time:</strong> <%= request.getAttribute("pickupDateTime") %></p>
        <p><strong>Payment Method:</strong> <%= request.getAttribute("paymentMethod") %></p>

        <button onclick="printPage()">Print Bill</button>
    </div>

    <script>
        function printPage() {
            window.print();
        }
    </script>

</body>
</html>
