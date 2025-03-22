<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.datapackage.model.Vehicle" %>
<%@ page import="com.datapackage.DAO.VehicleDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background-color: black;
            color: white;
            text-align: center;
        }
 .title-page {
    background: url('${pageContext.request.contextPath}/images/rent.jpg') center/cover no-repeat;
    height: 300px; /* Adjust height as needed */
    display: flex;
    align-items: flex-start; /* Align content to the top */
    justify-content: center;
    text-align: left;
    color: white; /* Corrected from 'dark white' to 'white' */
    padding-top: 50px; /* Moves content down */
    position: relative;
}

.inner-title-page {
    padding: 20px;
    border-radius: 5px;
    margin-top: 50px; /* Adjusts vertical position */
    position: absolute;
    top: 20px; /* Adjust to position from the top */
    right: 20px; /* Moves it to the right */
    text-align: right; /* Aligns text to the right */
}

/* Home Button Styling */
.home-button {
    display: inline-block;
    padding: 10px 20px;
    background: rgba(0, 0, 0, 0.8); /* Bootstrap primary blue */
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: background 0.3s ease;
}

.home-button:hover {
    background: rgba(0, 0, 0, 0.8); /* Darker blue on hover */
}


        .car-option {
            cursor: pointer;
            border: 2px solid transparent;
            transition: 0.3s ease-in-out;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 10px;
            overflow: hidden;
            padding: 10px;
            backdrop-filter: blur(5px);
        }
        .car-option img {
            height: 140px;
            object-fit: cover;
            transition: transform 0.6s ease-in-out;
        }
        .car-option:hover img {
            transform: scale(1.05);
        }
        .car-option:hover {
            transform: scale(1.05);
        }
        .car-option.selected {
    border: 2px solid #f0ad4e; /* Highlight border color */
    transform: scale(1.1); /* Slightly enlarge the selected card */
}
        
    </style>
</head>
<body>
<div class="title-page" style="background: url('${pageContext.request.contextPath}/images/rent.jpg') center/cover no-repeat;">
    <div class="container">
        <div class="row">
            <div class="col-md-6 inner-title-page">
                <h1>Select Vehicle</h1>
                <nav class="woocommerce-breadcrumb" aria-label="Breadcrumb">
                    <a href="home.jsp" class="home-button">Home</a>
                </nav>
            </div>
        </div>
    </div>
</div>



<!-- Cars Section -->
<div class="container mt-3">
    <div class="row justify-content-center">
        <%
            VehicleDAO vehicleDAO = new VehicleDAO();
            List<Vehicle> vehicleList = vehicleDAO.getAllVehicles(); // Fetch vehicles from the database
            if (vehicleList != null && !vehicleList.isEmpty()) {
                for (Vehicle vehicle : vehicleList) {
        %>
        <div class="col-md-3 mb-3">
            <div class="card car-option" role="button" onclick="selectVehicle('<%= vehicle.getType() %>', '<%= vehicle.getPrice() %>')">
                <img src="<%= request.getContextPath() + "/" + vehicle.getImageFileName() %>" class="card-img-top" alt="<%= vehicle.getType() %>">
                <div class="card-body">
                    <h5 class="card-title"><%= vehicle.getType() %></h5>
                    <p class="card-text">Price: LKR <%= vehicle.getPrice() %></p>
                    <p class="card-text">Model: <%= vehicle.getModel() %></p>
                    <p class="card-text">Number Plate: <%= vehicle.getNumberPlate() %></p>
                </div>
            </div>
        </div>
        <% 
                }
            } else { 
        %>
        <p class="text-white">No vehicles available.</p>
        <% } %>
    </div>
</div>

<!-- Hidden Form to Capture Selection -->
<form id="vehicleForm" action="Booking.jsp" method="POST">
    <input type="hidden" id="selectedVehicleType" name="vehicleType" value="">
    <input type="hidden" id="selectedVehiclePrice" name="price" value="">
    <button type="submit" id="confirmButton" class="btn btn-primary mt-4" disabled>Confirm Selection</button>
</form>

<script>
    function selectVehicle(vehicleType, price) {
        // Reset all cards
        document.querySelectorAll('.car-option').forEach(card => {
            card.classList.remove('selected');
        });

        // Select the clicked card
        let selectedCard = event.currentTarget;
        selectedCard.classList.add('selected');

        // Set hidden form fields
        document.getElementById("selectedVehicleType").value = vehicleType;
        document.getElementById("selectedVehiclePrice").value = price;
        

        // Enable the confirm button
        document.getElementById("confirmButton").disabled = false;
    }
</script>

</body>
</html>
