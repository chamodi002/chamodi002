<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Booking Form</title> 
   <style>
    
    body {
            background: url('${pageContext.request.contextPath}/images/bookingForm1.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
        }
       .booking-container {
            width: 40%;
            background: rgba(0, 0, 0, 0.6);
            color: white;
            padding: 20px;
            border-radius: 10px;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            height: 80%;  /* Reduced height */
            overflow-y: auto; /* To allow scrolling if content overflows */
        }
        h2, h3 {
            text-align: center;
        }
        label {
            display: block;
            margin-top: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 5px;
            border: none;
        }
        button {
            background: #ff6600;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            margin-top: 15px;
            cursor: pointer;
        }
        button:hover {
            background: #cc5500;
        }
    </style>    
    <!-- Stripe JS -->
    <script src="https://js.stripe.com/v3/"></script>
</head>
<body>
    <div class="booking-container">
        <h2>Confirm Your Booking</h2>

    <form action="${pageContext.request.contextPath}/BookingServlet" method="POST">
        <h3>Selected Vehicle</h3>
        <p>Type: <%= request.getParameter("vehicleType") %></p>
        <p>Price: LKR <%= request.getParameter("price") %></p>

        <input type="hidden" name="vehicleType" value="<%= request.getParameter("vehicleType") %>">
        <input type="hidden" name="price" value="<%= request.getParameter("price") %>">

        <h3>Customer Details</h3>
        <label>Name:</label>
        <input type="text" name="customerName" required><br>

        <label>Email:</label>
        <input type="email" name="customerEmail" required><br>

        <label>Phone:</label>
        <input type="text" name="customerPhone" required><br>

        <label>Pickup Location:</label>
        <input type="text" name="pickupLocation" required><br>

        <label>Drop-off Location:</label>
        <input type="text" name="dropoffLocation" required><br>

        <label>Pickup Date & Time:</label>
        <input type="datetime-local" name="pickupDateTime" required><br>
        
        
        <h3>Payment Method</h3>
        <label for="paymentMethod">Select Payment Method:</label>
        <select name="paymentMethod" id="paymentMethod" required>
            <option value="cash">Cash</option>
            <option value="creditCard">Credit Card</option>
            <option value="debitCard">Debit Card</option>
        </select><br>

       
        
        
        <!-- Credit/Debit Card details (shown when selected) -->
        <div id="cardDetails" style="display: none;">
            <label>Card Number:</label>
            <div id="card-element"></div> <!-- Stripe Card Element -->

            <label>Expiration Date:</label>
            <input type="month" name="expirationDate" id="expirationDate"><br>

            <label>CVV:</label>
            <input type="text" name="cvv" id="cvv" placeholder="Enter CVV"><br>
        </div>

        <button type="submit" id="submitBtn">Confirm Booking</button>
    </form>

    <script>
        // Set your publishable key
        var stripe = Stripe('your-public-key-here');
        var elements = stripe.elements();
        var card = elements.create('card');
        
        // Mount the card element into the DOM
        card.mount('#card-element');

        // Show/hide card details depending on payment method
        document.getElementById("paymentMethod").addEventListener("change", function() {
            let paymentMethod = document.getElementById("paymentMethod").value;
            let cardDetails = document.getElementById("cardDetails");

            if (paymentMethod === "creditCard" || paymentMethod === "debitCard") {
                cardDetails.style.display = "block";
            } else {
                cardDetails.style.display = "none";
            }
        });

        // Handle form submission and payment
        document.getElementById("bookingForm").addEventListener("submit", function(event) {
            event.preventDefault(); // Prevent the form from submitting

            var paymentMethod = document.getElementById("paymentMethod").value;

            // If the payment method is Credit/Debit Card
/*            if (paymentMethod === "creditCard" || paymentMethod === "debitCard") {
                stripe.createToken(card).then(function(result) {
                    if (result.error) {
                        // Display error in the UI
                        console.log(result.error.message);
                    } else {
                        // Send the token to your server
                        var token = result.token.id;

                        // Add the token to the form as hidden input
                        var tokenInput = document.createElement("input");
                        tokenInput.type = "hidden";
                        tokenInput.name = "stripeToken";
                        tokenInput.value = token;
                        document.getElementById("bookingForm").appendChild(tokenInput);

                        // Submit the form with the token
                        document.getElementById("bookingForm").submit();
                    }
                });
            } else {
            	*/
                // For Cash payment, simply submit the form
                document.getElementById("bookingForm").submit();
      //      }
        });
    </script>

</body>
</html>