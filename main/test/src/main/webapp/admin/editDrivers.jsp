<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.datapackage.model.Driver, com.datapackage.DAO.DriverDAO" %>
<%
    DriverDAO driverDAO = new DriverDAO();
    List<Driver> drivers = driverDAO.getAllDrivers();
    String message = (String) request.getAttribute("message");  // Retrieve the message attribute
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Drivers</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>
        body {
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            background: #333;
            padding-top: 20px;
            position: fixed;
            left: 0;
            top: 0;
        }
        .sidebar a {
            padding: 20px 25px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
        }
        .sidebar a.active {
            background: rgba(255, 255, 255, 0.2);
        }
        .sidebar a:hover {
            background-color: #007bff;
        }
        .content {
            margin-left: 270px;
            padding: 20px;
            flex-grow: 1;
        }
        .container {
            margin-right: 40px; /* Moves the table slightly to the right */
        }
        .container {
            padding: 20px;
            border-radius: 8px; /* Rounded corners */
            text-align: center;
        }
        h3.center-align {
            color: black !important; /* Set text color to black */
            font-weight: bold; /* Make text bold */
            padding: 10px 0;
        }
        .transparent-card {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .message {
            padding: 20px;
            margin-bottom: 20px;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            border-radius: 10px;
            font-size: 20px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
        .message-error {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h4 class="text-white text-center">Admin Panel</h4>
    <a href="${pageContext.request.contextPath}/manageUsers.jsp">Manage Users</a>
    <a href="${pageContext.request.contextPath}/manageDrivers.jsp" class="active">Manage Drivers</a>
    <a href="#" id="viewMessages">View Web Messages</a>
    <a href="${pageContext.request.contextPath}/admin/adminBookings.jsp">Manage Booking</a>
    <a href="${pageContext.request.contextPath}/admin/AddVehicle.jsp">Add vehicles</a>
    <a href="${pageContext.request.contextPath}/admin/adminDashboard.jsp">Back</a>
</div>

<div class="container">
    <h3 class="center-align white-text">Edit Drivers</h3>
    
    <!-- Display success or error message -->
    <% if (message != null) { %>
        <div class="message <%= message.contains("successfully") ? "" : "message-error" %>">
            <%= message %>
        </div>
    <% } %>

    <!-- Driver List -->
    <h4 class="center-align white-text">Driver List</h4>
    <div class="card transparent-card">
        <div class="card-content">
            <table class="striped centered">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>License</th>
                        <th>Phone</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Driver driver : drivers) { %>
                    <tr>
                        <td><%= driver.getName() %></td>
                        <td><%= driver.getLicense() %></td>
                        <td><%= driver.getPhone() %></td>
                        <td>
                            <!-- EDIT DRIVER BUTTON -->
                            <a href="editDriverForm.jsp?id=<%= driver.getId() %>" class="btn blue">Edit</a>
                            <!-- Update DRIVER FORM -->
                            <form id="updateForm-<%= driver.getId() %>" action="${pageContext.request.contextPath}/DriverServlet" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="<%= driver.getId() %>">
                                <button type="button" class="btn red" onclick="confirm(<%= driver.getId() %>)">Update</button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script>
    // Function to confirm deletion and submit the form
    function confirmDelete(driverId) {
        if (confirm("Are you sure you want to delete this driver?")) {
            document.getElementById("deleteForm-" + driverId).submit();
        }
    }
</script>
</body>
</html>