<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.datapackage.model.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Bookings</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
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
    </style>
</head>
<body>
    <div class="sidebar">
    
        <h4 class="text-white text-center">Admin Panel</h4>
        
        <a href="admin/manageUsers.jsp">Manage Users</a>
        <a href="admin/manageDrivers.jsp">Manage Drivers</a>
        <a href="viewMessages">View Web Messages</a>
        <a href="admin/AddVehicle.jsp">Add vehicles</a></a>
        <a href="adminBookings.jsp" class="active">Manage Booking</a>
        <a href="admin/adminDashboard.jsp">Back</a>
    </div>

    <div class="container mt-5">
        <!-- Alert Container -->
        <div id="alertContainer" style="position: fixed; top: 20px; right: 20px; width: 300px; z-index: 9999;"></div>

        <h2>Admin - View Bookings</h2>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Vehicle Type</th>
                    <th>Price</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Pickup Location</th>
                    <th>Dropoff Location</th>
                    <th>Pickup Date/Time</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                String errorMessage = (String) request.getAttribute("errorMessage");
                
                if (errorMessage != null) { %>
                    <tr>
                        <td colspan="10" class="text-center text-danger"><%= errorMessage %></td>
                    </tr>
                <% } else if (bookings != null && !bookings.isEmpty()) {
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
                    for (Booking booking : bookings) { 
                        String formattedDateTime = booking.getPickupDateTimeObj() != null ? 
                            booking.getPickupDateTimeObj().format(formatter) : booking.getPickupDateTime();
                %>
                    <tr id="booking-<%= booking.getId() %>">
                        <td><%= booking.getId() %></td>
                        <td><%= booking.getVehicleType() %></td>
                        <td><%= booking.getPrice() %></td>
                        <td><%= booking.getCustomerName() %></td>
                        <td><%= booking.getCustomerEmail() %></td>
                        <td><%= booking.getCustomerPhone() %></td>
                        <td><%= booking.getPickupLocation() %></td>
                        <td><%= booking.getDropoffLocation() %></td>
                        <td><%= formattedDateTime %></td>
                        <td>
                            <button class="btn btn-danger btn-sm delete-btn" 
                                    data-booking-id="<%= booking.getId() %>">
                                Delete
                            </button>
                        </td>
                    </tr>
                <% }
                } else { %>
                    <tr>
                        <td colspan="10" class="text-center">No bookings found</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('.delete-btn').click(function() {
            if (!confirm('Are you sure you want to delete this booking?')) return;
            
            const bookingId = $(this).data('booking-id');
            const row = $('#booking-' + bookingId);
            
            $.ajax({
                url: 'deleteBooking',
                type: 'GET',
                data: {
                    bookingId: bookingId
                },
                success: function(response) {
                    try {
                        // Parse response if it's returned as a string
                        const result = typeof response === 'string' ? JSON.parse(response) : response;
                        showAlert(result.success ? 'success' : 'danger', result.message);
                        
                        if (result.success) {
                            row.fadeOut(300, function() { 
                                $(this).remove(); 
                                // Update no bookings message if needed
                                if ($('tbody tr').length === 0) {
                                    $('tbody').html('<tr><td colspan="10" class="text-center">No bookings found</td></tr>');
                                }
                            });
                        }
                    } catch (e) {
                        showAlert('danger', 'Error processing response: ' + e.message);
                    }
                },
                error: function() {
                    showAlert('danger', 'Error communicating with server');
                }
            });
        });
    });

    function showAlert(type, message) {
        const alert = $('<div class="alert alert-' + type + ' alert-dismissible fade show" role="alert">' +
            message +
            '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
            '<span aria-hidden="true">&times;</span>' +
            '</button></div>');
        
        $('#alertContainer').append(alert);
        setTimeout(() => alert.alert('close'), 5000);
    }
    </script>
</body>
</html>