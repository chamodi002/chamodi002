<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.datapackage.model.Contact" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Contact Messages</title>
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
    .sidebar a:hover, .sidebar a.active {
         background: rgba(255, 255, 255, 0.2);
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
     
        <a href="admin/adminRegister.jsp">Manage Users</a>
        <a href="#" id="viewMessages">View Web Messages</a>
        <a href="admin/adminBookings.jsp">Manage Booking</a>
        <a href="admin/AddVehicle.jsp">Add vehicles</a>
        <a href="admin/adminDashboard.jsp">Back</a>
    </div>

<script>
    // Highlight "View Web Messages" when the page loads
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("viewMessages").classList.add("active");
    });
</script>


    <div class="container mt-5">
        <!-- Alert Container -->
        <div id="alertContainer" style="position: fixed; top: 20px; right: 20px; width: 300px; z-index: 9999;"></div>

        <h2>Admin - View Contact Messages</h2>

        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Contact> contacts = (List<Contact>) request.getAttribute("contacts");
                String errorMessage = (String) request.getAttribute("errorMessage");

                if (errorMessage != null) { %>
                    <tr>
                        <td colspan="6" class="text-center text-danger"><%= errorMessage %></td>
                    </tr>
                <% } else if (contacts != null && !contacts.isEmpty()) {
                    for (Contact contact : contacts) { %>
                    <tr id="contact-<%= contact.getId() %>">
                        <td><%= contact.getId() %></td>
                        <td><%= contact.getName() %></td>
                        <td><%= contact.getEmail() %></td>
                        <td><%= contact.getSubject() %></td>
                        <td><%= contact.getMessage() %></td>
                        <td>
                            <button class="btn btn-danger btn-sm delete-btn" 
                                    data-contact-id="<%= contact.getId() %>">
                                Delete
                            </button>
                        </td>
                    </tr>
                <% }
                } else { %>
                    <tr>
                        <td colspan="6" class="text-center">No contact messages found</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        $('.delete-btn').click(function() {
            if (!confirm('Are you sure you want to delete this contact message?')) return;
            
            const contactId = $(this).data('contact-id');
            const row = $('#contact-' + contactId);
            
            $.ajax({
                url: 'deleteContact',
                type: 'GET',
                data: {
                    contactId: contactId
                },
                success: function(response) {
                    try {
                        const result = typeof response === 'string' ? JSON.parse(response) : response;
                        showAlert(result.success ? 'success' : 'danger', result.message);
                        
                        if (result.success) {
                            row.fadeOut(300, function() { 
                                $(this).remove(); 
                                if ($('tbody tr').length === 0) {
                                    $('tbody').html('<tr><td colspan="6" class="text-center">No contact messages found</td></tr>');
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