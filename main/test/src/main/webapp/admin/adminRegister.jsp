<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.datapackage.model.User" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Users</title>
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
     
        <a href="dashboard.jsp">Dashboard</a>
        <a href="users.jsp" class="active">Manage Users</a>
        <a href="admin/manageDrivers.jsp">Manage Drivers</a>
        <a href="viewMessages">View Web Messages</a>
        <a href="admin/AddVehicle.jsp">Add vehicles</a>
        <a href="adminBookings.jsp">Manage Booking</a>
        <a href="admin/adminDashboard.jsp">Back</a>
    </div>

    <div class="container mt-5">
        <!-- Alert Container -->
        <div id="alertContainer" style="position: fixed; top: 20px; right: 20px; width: 300px; z-index: 9999;"></div>

        <h2>Admin - View Users</h2>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Address</th>
                    <th>Contact</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<User> users = (List<User>) request.getAttribute("users");
                String errorMessage = (String) request.getAttribute("errorMessage");
                
                if (errorMessage != null) { %>
                    <tr>
                        <td colspan="6" class="text-center text-danger"><%= errorMessage %></td>
                    </tr>
                <% } else if (users != null && !users.isEmpty()) {
                    for (User user : users) { %>
                    <tr id="user-<%= user.getId() %>">
                        <td><%= user.getId() %></td>
                        <td><%= user.getName() %></td>
                        <td><%= user.getUname() %></td>
                        <td><%= user.getAddress() %></td>
                        <td><%= user.getContact() %></td>
                        <td>
                            <button class="btn btn-danger btn-sm delete-btn" 
                                    data-user-id="<%= user.getId() %>">
                                Delete
                            </button>
                        </td>
                    </tr>
                <% }
                } else { %>
                    <tr>
                        <td colspan="6" class="text-center">No users found</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('.delete-btn').click(function() {
            if (!confirm('Are you sure you want to delete this user?')) return;
            
            const userId = $(this).data('user-id');
            const row = $('#user-' + userId);
            
            $.ajax({
                url: 'deleteUser',
                type: 'GET',
                data: {
                    action: 'delete',
                    userId: userId
                },
                success: function(response) {
                    try {
                        // Parse response if it's returned as a string
                        const result = typeof response === 'string' ? JSON.parse(response) : response;
                        showAlert(result.success ? 'success' : 'danger', result.message);
                        
                        if (result.success) {
                            row.fadeOut(300, function() { 
                                $(this).remove(); 
                                // Update no users message if needed
                                if ($('tbody tr').length === 0) {
                                    $('tbody').html('<tr><td colspan="6" class="text-center">No users found</td></tr>');
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