<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Print Booking Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .bill-container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th { background: #ff6600; color: white; }
        .total { font-weight: bold; color: #cc5500; }
        button {
            margin-top: 15px;
            padding: 10px;
            background: #ff6600;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover { background: #cc5500; }
    </style>
</head>
<body>

    <div class="bill-container">
        <h2>Booking Invoice</h2>
        <table>
            <tr>
                <th>Details</th>
                <th>Information</th>
            </tr>
            <tr><td>Customer Name</td><td id="customerName"></td></tr>
            <tr><td>Email</td><td id="customerEmail"></td></tr>
            <tr><td>Phone</td><td id="customerPhone"></td></tr>
            <tr><td>Vehicle Type</td><td id="vehicleType"></td></tr>
            <tr><td>Pickup Location</td><td id="pickupLocation"></td></tr>
            <tr><td>Drop-off Location</td><td id="dropoffLocation"></td></tr>
            <tr><td>Pickup Date & Time</td><td id="pickupDateTime"></td></tr>
            <tr class="total"><td>Total Price</td><td id="price"></td></tr>
        </table>

        <button onclick="window.print()">Print Bill</button>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Retrieve stored data
            let bookingData = JSON.parse(localStorage.getItem("bookingData"));

            if (bookingData) {
                document.getElementById("customerName").textContent = bookingData.customerName;
                document.getElementById("customerEmail").textContent = bookingData.customerEmail;
                document.getElementById("customerPhone").textContent = bookingData.customerPhone;
                document.getElementById("vehicleType").textContent = bookingData.vehicleType;
                document.getElementById("pickupLocation").textContent = bookingData.pickupLocation;
                document.getElementById("dropoffLocation").textContent = bookingData.dropoffLocation;
                document.getElementById("pickupDateTime").textContent = bookingData.pickupDateTime;
                document.getElementById("price").textContent = "LKR " + bookingData.price;
            }

            // Auto-print after loading
            setTimeout(() => window.print(), 1000);
        });
    </script>

</body>
</html>
