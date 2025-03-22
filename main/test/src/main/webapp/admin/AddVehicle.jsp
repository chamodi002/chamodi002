<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.datapackage.model.Vehicle" %>
<%@ page import="com.datapackage.DAO.VehicleDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Add Vehicle</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
             background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
               
        /* Sidebar styles */
        .sidebar {
            height: 100vh;
            width: 250px;
            background-color: #343a40;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 20px;
        }

        .sidebar a {
            color: white;
            padding: 15px 25px;
            text-decoration: none;
            display: block;
        }

        .sidebar a:hover {
            background-color: #575d63;
        }
        .sidebar a.active {
              background: rgba(255, 255, 255, 0.2);
        }
        .container {
            margin-right: 50px; /* Moves the table slightly to the right */
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
<!-- Sidebar -->
    <div class="sidebar">
        <h4 class="text-center text-white">Admin Panel</h4>
        <a href="${pageContext.request.contextPath}/admin/adminRegister.jsp">Manage Users</a>
        <a href="${pageContext.request.contextPath}/admin/manageDrivers.jsp">Manage Drivers</a>
        <a href="${pageContext.request.contextPath}/admin/adminContacts.jsp">View Web Messagess</a>
        <a href="${pageContext.request.contextPath}/admin/adminBookings.jsp">Manage Booking</a>
        <a href="${pageContext.request.contextPath}/admin/adminContacts.jsp"class="active">Add vehicles</a>
        <a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp">Back</a>
    </div>

<div class="container mt-4">
    <h2 class="text-center text-black">Add Vehicle</h2>

    <!-- Success/Error Messages -->
    <% if (request.getParameter("success") != null) { %>
        <div class="alert alert-success">Vehicle added successfully!</div>
    <% } else if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger">There was an error adding the vehicle. Please try again.</div>
    <% } else if (request.getParameter("delete") != null) { %>
        <div class="alert alert-success">Vehicle deleted successfully!</div>
    <% } %>

    <div class="transparent-card">
        <form action="${pageContext.request.contextPath}/AdminVehicleServlet" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label text-black">Vehicle Type:</label>
                <input type="text" class="form-control" name="type" required>
            </div>
            <div class="mb-3">
                <label class="form-label text-black">Price (LKR):</label>
                <input type="number" class="form-control" name="price" required>
            </div>
            <div class="mb-3">
                <label class="form-label text-black">Upload Image:</label>
                <input type="file" class="form-control" name="imageFile" id="imageFile" accept="image/*" required>
                <img id="preview" class="vehicle-image mt-2" src="#" alt="Preview" hidden>
            </div>
            
            <div class="mb-3">
                <label class="form-label text-black">Model:</label>
                <input type="text" class="form-control" name="model" required>
            </div>
            <div class="mb-3">
                <label class="form-label text-black">Number Plate:</label>
                <input type="text" class="form-control" name="numberPlate" required>
            </div>
            <button type="submit" class="btn w-50 d-block mx-auto" style="background-color: black; color: white;">Add Vehicle</button>
        </form>
    </div>

    <!-- Fetch and Display Added Vehicles -->
    <h3 class="mt-5 text-center text-black">Added Vehicles</h3>
    <div class="table-card">
        <table class="table table-bordered mt-3 text-white">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Price</th>
                    <th>Image</th>
                    <th>Model</th>
                    <th>Number Plate</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Fetch the list of vehicles from the database
                    VehicleDAO vehicleDAO = new VehicleDAO();
                    List<Vehicle> vehicleList = vehicleDAO.getAllVehicles(); // Ensure this method is implemented in DAO
                    if (vehicleList != null && !vehicleList.isEmpty()) {
                        for (Vehicle vehicle : vehicleList) {
                %>
                <tr>
                    <td><%= vehicle.getId() %></td>
                    <td><%= vehicle.getType() %></td>
                    <td><%= vehicle.getPrice() %></td>
                    <td><img src="<%= request.getContextPath() + "/" + vehicle.getImageFileName() %>" class="vehicle-image" alt="Vehicle Image"></td>
                    <td><%= vehicle.getModel() %></td>
                    <td><%= vehicle.getNumberPlate() %></td>
                    <td>
                        <!-- DELETE BUTTON -->
                        <form action="${pageContext.request.contextPath}/AdminVehicleServlet" method="post" style="display: inline;">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= vehicle.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr><td colspan="7" class="text-center">No vehicles added yet.</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    document.getElementById('imageFile').addEventListener('change', function(event) {
        let img = document.getElementById('preview');
        let file = event.target.files[0];
        if (file) {
            let reader = new FileReader();
            reader.onload = function(e) {
                img.src = e.target.result;
                img.hidden = false;
            }
            reader.readAsDataURL(file);
        }
    });
</script>

</body>
</html>