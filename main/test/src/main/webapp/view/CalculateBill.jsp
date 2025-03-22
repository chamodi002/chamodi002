<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculate Bill</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
        background: url('${pageContext.request.contextPath}/images/billCal1.jpg') no-repeat center center fixed;
        background-size: cover;
        color: #212529;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
        padding: 20px;
    }
    .container {
        max-width: 600px;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        background: rgba(255, 255, 255, 0.8); /* White with transparency */
    }
    .card {
        background-color: rgba(255, 255, 255, 0.7); /* Adjust transparency of the card */
        border: 1px solid #dee2e6;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        color: #212529; /* Ensures text is visible on the transparent background */
    }
       .btn-custom {
        width: 100%;
        font-size: 18px;
        color: #fff; /* White text */
        background-color: #000; /* Black background */
        border: 1px solid #fff; /* White border */
    }
    .btn-custom:hover {
        background-color: #fff; /* White background on hover */
        color: #000; /* Black text on hover */
        border: 1px solid #000; /* Black border on hover */
    }
        .footer {
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Bill Summary</h2>

        <div class="card">
            <h5>Vehicle Selected</h5>
            <p><strong>Vehicle Type:</strong> <span id="vehicleType"></span></p>
            <p><strong>Price:</strong> LKR <span id="vehiclePrice"></span></p>
        </div>

        <div class="card">
            <h5>Additional Charges</h5>
            <p><strong>Tax (15%):</strong> LKR <span id="tax"></span></p>
            <p><strong>Discount (5%):</strong> LKR <span id="discount"></span></p>
        </div>

        <div class="card">
            <h5>Total Amount</h5>
            <p><strong>Total:</strong> LKR <span id="totalAmount"></span></p>
        </div>

        <form action="<%=request.getContextPath() %>/BillServlet" method="post">
            <input type="hidden" name="vehicleType" id="hiddenVehicleType">
            <input type="hidden" name="vehiclePrice" id="hiddenVehiclePrice">
            <input type="hidden" name="tax" id="hiddenTax">
            <input type="hidden" name="discount" id="hiddenDiscount">
            <input type="hidden" name="totalAmount" id="hiddenTotalAmount">
          
        </form>

        <button class="btn btn-primary btn-custom mt-3" onclick="confirmBooking()">Bill Confirm</button>
        <a href="SelectCar.jsp" class="btn btn-warning btn-custom mt-3">Back to Selection</a>
        <a id="printBillLink" class="btn btn-success btn-custom mt-3" style="display: none;">Go to Print Bill</a>
    </div>

    <div class="footer">&copy; 2025 Mega City Cab | All Rights Reserved</div>
<script>
    window.onload = function() {
        try {
            let vehicleType = "<%= request.getParameter("vehicleType") != null ? request.getParameter("vehicleType") : "Not Selected" %>";
            let vehiclePriceStr = "<%= request.getParameter("price") != null ? request.getParameter("price") : "0" %>";
            let vehiclePrice = parseFloat(vehiclePriceStr) || 0;

            let tax = vehiclePrice * 0.15;
            let discount = vehiclePrice * 0.05;
            let totalAmount = vehiclePrice + tax - discount;

            document.getElementById("vehicleType").innerText = vehicleType;
            document.getElementById("vehiclePrice").innerText = vehiclePrice.toFixed(2);
            document.getElementById("tax").innerText = tax.toFixed(2);
            document.getElementById("discount").innerText = discount.toFixed(2);
            document.getElementById("totalAmount").innerText = totalAmount.toFixed(2);

            document.getElementById("hiddenVehicleType").value = vehicleType;
            document.getElementById("hiddenVehiclePrice").value = vehiclePrice;
            document.getElementById("hiddenTax").value = tax.toFixed(2);
            document.getElementById("hiddenDiscount").value = discount.toFixed(2);
            document.getElementById("hiddenTotalAmount").value = totalAmount.toFixed(2);

        } catch (error) {
            console.error("Error loading bill summary:", error);
        }
    }

    function confirmBooking() {
        alert("Booking Successful");
        
        let vehicleType = encodeURIComponent(document.getElementById("vehicleType").innerText);
        let vehiclePrice = encodeURIComponent(document.getElementById("vehiclePrice").innerText);
        let tax = encodeURIComponent(document.getElementById("tax").innerText);
        let discount = encodeURIComponent(document.getElementById("discount").innerText);
        let totalAmount = encodeURIComponent(document.getElementById("totalAmount").innerText);

        // Redirecting to PrintBill.jsp with query parameters
        window.location.href = `PrintBill.jsp?vehicleType=${vehicleType}&price=${vehiclePrice}&tax=${tax}&discount=${discount}&totalAmount=${totalAmount}`;
    }
</script>

</body>
</html>
