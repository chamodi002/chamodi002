<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Usage Guidelines</title>
    <style>
        /* General body styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #white;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }
        /* Back button styling */
        .back-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            padding: 10px 15px;
            font-size: 14px;
            background-color: #333;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .back-btn:hover {
            background-color: #555;
        }

        /* Container for the content */
        .container {
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            max-width: 900px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            flex-grow: 1;
        }

        /* Image on the left side */
        .image-container {
            width: 250px;
            height: 80vh; /* Full height of the viewport */
            background-image: url('${pageContext.request.contextPath}/images/yellow-car-man-standing-at-smartphone-screen-vector-40314696.jpg');
            background-size: cover; /* Make the image cover the entire container */
            background-position: center; /* Center the image */
            border-radius: 10px;
            margin-right: 20px;
        }

        /* Inner content of the container */
        .content {
            flex-grow: 1;
            overflow: auto;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Card styling with transparent background */
        .card {
            background-color: rgba(255, 255, 255, 0.7); /* Transparent card */
            border: 1px solid #ddd;
            border-radius: 8px;
            margin-bottom: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .card:hover {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .card-header {
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
            background-color: #f8f8f8;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .card-body {
            display: none;
            padding: 15px;
            background-color: #f9f9f9;
            border-top: 1px solid #ddd;
            line-height: 1.8;
        }

        .note {
            font-style: italic;
            color: #666;
            text-align: center;
            margin-top: 20px;
        }

        h3 {
            color: #333;
            margin-top: 20px;
        }

        ul {
            list-style-type: none;
            padding-left: 0;
        }

        ul li {
            margin-bottom: 10px;
        }

        .card-body ul li {
            margin-left: 20px;
        }

        /* Footer styling */
        footer {
            width: 100%;
            text-align: center;
            padding: 10px 0;
            background-color: #333;
            color: white;
            position: fixed;
            bottom: 0;
            left: 0;
        }

    </style>
    <script>
        function toggleCard(cardId) {
            const cardBody = document.getElementById(cardId);
            cardBody.style.display = cardBody.style.display === "block" ? "none" : "block";
        }
    </script>
</head>

<body>
<!-- Back Button -->
    <a href="home.jsp" class="back-btn">Back to Home</a>
    <div class="container">
        <div class="image-container"></div> <!-- Image on the left side -->

        <div class="content">
            <h2>Welcome to the Mega City Cab Booking System Help Center</h2>

            <!-- Card 1 - Getting Started -->
            <div class="card" onclick="toggleCard('card1-body')">
                <div class="card-header">1. Getting Started</div>
                <div class="card-body" id="card1-body">
                    <h3>Creating an Account</h3>
                    <ul>
                        <li>How to sign up</li>
                        <li>Account verification process</li>
                        <li>Logging into your account</li>
                    </ul>
                    <h3>Understanding the Dashboard</h3>
                    <ul>
                        <li>Overview of menu options (Bookings, Payments, Profile, Help)</li>
                        <li>How to navigate the system</li>
                    </ul>
                </div>
            </div>

            <!-- Card 2 - Booking a Ride -->
        <div class="card" onclick="toggleCard('card2-body')">
            <div class="card-header">2. Booking a Ride</div>
            <div class="card-body" id="card2-body">
                <h3>How to Book a Cab</h3>
                <ul>
                    <li>Step-by-step guide on entering pickup/drop-off locations</li>
                    <li>Selecting a cab type (standard, premium, SUV, etc.)</li>
                    <li>Choosing ride preferences (instant/scheduled)</li>
                </ul>
                <h3>Managing Your Bookings</h3>
                <ul>
                    <li>Viewing upcoming and past bookings</li>
                    <li>Canceling or modifying a booking</li>
                    <li>Contacting the assigned driver</li>
                </ul>
            </div>
        </div>

        <!-- Card 3 - Payment & Billing -->
        <div class="card" onclick="toggleCard('card3-body')">
            <div class="card-header">3. Payment & Billing</div>
            <div class="card-body" id="card3-body">
                <h3>Payment Methods</h3>
                <ul>
                    <li>Accepted payment options (cash, card, digital wallets)</li>
                    <li>How to add/manage payment details</li>
                </ul>
                <h3>Billing & Receipts</h3>
                <ul>
                    <li>How to view and download ride invoices</li>
                    <li>Understanding fare breakdown and additional charges</li>
                </ul>
            </div>
        </div>

        <!-- Card 4 - Car & Driver Management -->
        <div class="card" onclick="toggleCard('card4-body')">
            <div class="card-header">4. Car & Driver Management</div>
            <div class="card-body" id="card4-body">
                <h3>Assigning a Driver (Admin Feature)</h3>
                <ul>
                    <li>How admins assign and reassign drivers to bookings</li>
                    <li>Viewing driver availability</li>
                </ul>
                <h3>Vehicle Management</h3>
                <ul>
                    <li>Adding or updating car details</li>
                    <li>Checking vehicle availability</li>
                </ul>
            </div>
        </div>

        <!-- Card 5 - Account & Profile Settings -->
        <div class="card" onclick="toggleCard('card5-body')">
            <div class="card-header">5. Account & Profile Settings</div>
            <div class="card-body" id="card5-body">
                <h3>Updating Personal Information</h3>
                <ul>
                    <li>How to edit name, phone number, email, etc.</li>
                    <li>Changing profile picture</li>
                </ul>
                <h3>Security Settings</h3>
                <ul>
                    <li>Resetting password</li>
                    <li>Enabling two-factor authentication</li>
                </ul>
            </div>
        </div>

        <!-- Card 6 - Customer Support & FAQs -->
        <div class="card" onclick="toggleCard('card6-body')">
            <div class="card-header">6. Customer Support & FAQs</div>
            <div class="card-body" id="card6-body">
                <h3>Help & Contact Us</h3>
                <ul>
                    <li>How to reach customer support (email, phone, in-app chat)</li>
                    <li>Service hours and response times</li>
                </ul>
                <h3>Frequently Asked Questions (FAQs)</h3>
                <ul>
                    <li>What to do if a driver cancels</li>
                    <li>How to report a lost item</li>
                    <li>Refund policies</li>
                </ul>
            </div>
        </div>

        <!-- Card 7 - Troubleshooting -->
        <div class="card" onclick="toggleCard('card7-body')">
            <div class="card-header">7. Troubleshooting</div>
            <div class="card-body" id="card7-body">
                <h3>Common Issues & Fixes</h3>
                <ul>
                    <li>Booking not going through</li>
                    <li>Payment failure troubleshooting</li>
                    <li>GPS/location issues</li>
                </ul>
            </div>
        </div>

        <p class="note">Note: If you encounter any issues, please contact our support team.</p>
    </div>
    
    <!-- Footer -->
    <footer>
        <p>&copy; 2025 Mega City Cab | All Rights Reserved</p>
    </footer>
</body>

</html>
