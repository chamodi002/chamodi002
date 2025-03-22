<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.datapackage.model.Vehicle" %>
<%@ page import="com.datapackage.DAO.VehicleDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Edit Vehicle</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-size: cover;
        }
        
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #343a40;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 20px 25px;
            display: block;
            color: white;
            text-decoration: none;
        }
        .sidebar a.active {
              background: rgba(255, 255, 255, 0.2);
        }
        .sidebar a:hover {
            background-color: #007bff;
        }
        .content {
            margin-left: 260px;
            padding: 20px;
        }
        .container {
            margin-right: 40px; /* Moves the table slightly to the right */
        }
       .transparent-card {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 10px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 50%;
            margin: 0 auto;
        }

        .table-card {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .table-card {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 70%; /* Adjust the width to make it smaller */
            margin-left: 25%; /* Move the table to the right */
        }
        .vehicle-image {
            width: 50px;
            height: 50px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
  <div class="sidebar">
        <h4 class="text-white text-center">Admin Panel</h4>
        <a href="${pageContext.request.contextPath}/admin/adminRegister.jsp">Manage Users</a>
        <a href="${pageContext.request.contextPath}/admin/manageDrivers.jsp">Manage Drivers</a>
        <a href="${pageContext.request.contextPath}/adminContacts.jsp">View Web Messages</a>
        <a href="admin/AddVehicle.jsp">Add vehicles</a>
        <a href="${pageContext.request.contextPath}/admin/adminBookings.jsp">Manage Booking</a>
        <a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp">Back</a>
    </div>
<div class="container mt-4">
    <h2 class="text-center text-black">Edit Vehicle</h2>

    <!-- Success/Error Messages -->
    <% if (request.getParameter("success") != null) { %>
        <div class="alert alert-success">Vehicle updated successfully!</div>
    <% } else if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger">There was an error updating the vehicle. Please try again.</div>
    <% } %>

    <%
        // Fetch the vehicle details based on the ID passed in the URL
        String vehicleId = request.getParameter("id"); // Corrected line
        Vehicle vehicle = null;
        if (vehicleId != null && !vehicleId.isEmpty()) {
            try {
                VehicleDAO vehicleDAO = new VehicleDAO();
                vehicle = vehicleDAO.getVehicleById(Integer.parseInt(vehicleId));
                if (vehicle == null) {
                    out.println("<div class='alert alert-danger'>Vehicle not found.</div>");
                }
            } catch (NumberFormatException e) {
                // Handle invalid ID format
                out.println("<div class='alert alert-danger'>Invalid vehicle ID.</div>");
            }
        } else {
            out.println("<div class='alert alert-danger'>Vehicle ID is missing.</div>");
        }
    %>

    <% if (vehicle != null) { %>
    <div class="transparent-card">
      <form action="${pageContext.request.contextPath}/AdminVehicleServlet" method="post" enctype="multipart/form-data">
    <input type="hidden" name="action" value="edit">
    <input type="hidden" name="id" value="<%= vehicle.getId() %>">

    <div class="mb-3">
        <label class="form-label text-gray">Vehicle Type:</label>
        <input type="text" class="form-control" name="type" value="<%= vehicle.getType() %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label text-gray">Price (LKR):</label>
        <input type="number" class="form-control" name="price" value="<%= vehicle.getPrice() %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label text-gray">Upload Image:</label>
        <input type="file" class="form-control" name="imageFile" id="imageFile" accept="image/*">
        <img id="preview" class="vehicle-image mt-2" src="<%= request.getContextPath() + "/" + vehicle.getImageFileName() %>" alt="Preview">
    </div>

    <div class="mb-3">
        <label class="form-label text-gray">Model:</label>
        <input type="text" class="form-control" name="model" value="<%= vehicle.getModel() %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label text-gray">Number Plate:</label>
        <input type="text" class="form-control" name="numberPlate" value="<%= vehicle.getNumberPlate() %>" required>
    </div>

    <button type="submit" class="btn w-50 d-block mx-auto" style="background-color: black; color: white;">
        Update Vehicle
    </button>
</form>


    </div>
    <% } %>
</div>



</body>
</html>