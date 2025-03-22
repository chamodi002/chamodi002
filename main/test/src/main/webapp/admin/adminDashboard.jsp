<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("adminUser") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
    <!-- Include Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            display: flex;
            min-height: 100vh;
            background: #e0f7fa; /* Updated background color */
        }
        .sidebar {
            width: 250px;
            background: #ffffff;
            padding: 20px;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            position: fixed;
            height: 100vh;
            top: 0;
        }
        .sidebar h2 {
            margin-bottom: 20px;
            font-size: 22px;
            color: #333;
        }
        .sidebar a {
            text-decoration: none;
            color: #333;
            padding: 12px;
            display: block;
            font-size: 16px;
            border-radius: 5px;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background: #007bff;
            color: white;
        }
        .dashboard-content {
            margin-left: 270px;
            flex: 1;
            padding: 20px;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 20px;
        }
        .left-column, .right-column {
            flex: 1;
            min-width: 400px;
        }
        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .chart-container {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        canvas {
            width: 100%;
            height: 200px;
        }
        .top-drivers {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .top-drivers ul {
            list-style: none;
        }
        .top-drivers li {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }
        .top-drivers li:hover {
            background: #f1f1f1;
        }
        .top-drivers img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .logout-btn {
            margin-top: auto;
            background: #ff4747;
            color: white;
            padding: 12px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            transition: background 0.3s;
            width: 100%;
        }
        .logout-btn:hover {
            background: #e63946;
        }
        .map-container {
            background: white;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        iframe {
            width: 100%;
            height: 300px;
            border: none;
            border-radius: 10px;
        }
        #driverDetailsModal {
            display: none;
            background-color: rgba(0, 0, 0, 0.5);
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <h2>Megacity Admin</h2>
        <a href="#">Dashboard</a>
		<a href="<%= request.getContextPath() %>/userMenage">Manage Users</a>
        <a href="manageDrivers.jsp">Manage Drivers</a>
        <a href="<%= request.getContextPath() %>/adminContacts">View Web Messages</a>
        <a href="<%= request.getContextPath()%>/adminBookings">Manage Booking</a>
        <a href="AddVehicle.jsp">Add vehicles</a>
        <button type="button" class="logout-btn" onclick="logout()">Logout</button>

    </div>

   <div class="dashboard-content">
        <div class="left-column">
            <div class="top-bar">
                <h2>Admin Dashboard</h2>
            </div>
            <div class="cards">
                <div class="card">Booked Trips: 1486</div>
                <div class="card">Cancelled Trips: 247</div>
                <div class="card">Available Cars: 30</div>
                <div class="card">Total Earnings: $33,493</div>
            </div>
            
            <div class="chart-container">
                <h3>Active Drivers by Time</h3>
                <canvas id="activeDriversChart"></canvas>
            </div>

            <div class="chart-container">
                <h3>Visits Diagram</h3>
                <canvas id="visitsChart"></canvas>
            </div>
        </div>

       <div class="right-column">
            <div class="top-drivers">
                <h3>Top Drivers</h3>
                <ul>
                    <li>
                        <img src="${pageContext.request.contextPath}/images/OIP (8).jpeg" alt="John Doe">
                        kamal
                        <button onclick="viewDriverDetails('kamal', '4.9', '7 Years', 'NYC', '1000 Trips')">View</button>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/images/OIP (7).jpeg" alt="Jane Smith">
                        Jane  
                        <button onclick="viewDriverDetails('Jane', '4.8', '5 Years', 'LA', '850 Trips')">View</button>
                    </li>
                    <li>
                        <img src="${pageContext.request.contextPath}/images/7c5a258c22c424a19d0f135e4bad69c9.jpg" alt="Mark Johnson">
                        dinitha
                        <button onclick="viewDriverDetails('dinitha', '4.7', '4 Years', 'Chicago', '950 Trips')">View</button>
                    </li>
                </ul>
            </div>

            <div class="map-container">
                <h3>Location Map</h3>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12673.775066896707!2d79.9937!3d6.9271!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae259ee82066c43%3A0x74e8b21c81ebcc0!2sColombo!5e0!3m2!1sen!2slk!4v1632715037319!5m2!1sen!2slk" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </div>

    <!-- Modal for displaying driver details -->
    <div id="driverDetailsModal" class="modal">
        <div class="modal-content">
            <h3>Driver Details</h3>
            <p id="driverName"></p>
            <p><strong>Rating: </strong><span id="driverRating"></span></p>
            <p><strong>Experience: </strong><span id="driverExperience"></span></p>
            <p><strong>Location: </strong><span id="driverLocation"></span></p>
            <p><strong>Total Trips: </strong><span id="driverTrips"></span></p>
            <button onclick="closeModal()">Close</button>
        </div>
    </div>

    <script>
        // Function to show the modal with driver details
        function viewDriverDetails(name, rating, experience, location, trips) {
            document.getElementById('driverName').innerText = 'Name: ' + name;
            document.getElementById('driverRating').innerText = rating;
            document.getElementById('driverExperience').innerText = experience;
            document.getElementById('driverLocation').innerText = location;
            document.getElementById('driverTrips').innerText = trips;
            
            // Show the modal
            document.getElementById('driverDetailsModal').style.display = 'flex';
        }

        // Function to close the modal
        function closeModal() {
            document.getElementById('driverDetailsModal').style.display = 'none';
        }

     // Function to log out
        function logout() {
            // Destroy the session on the server-side (redirect to logout.jsp)
            window.location.href = 'adminLogin.jsp'; // You can change the page to the appropriate logout page or URL
        }
     
        // Chart.js configuration
        const activeDriversData = {
            labels: ['0-6 AM', '6-12 AM', '12-6 PM', '6-12 PM'],
            datasets: [{
                label: 'Active Drivers by Time',
                data: [100, 200, 300, 400],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        };
        const visitsData = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            datasets: [{
                label: 'Weekly Visits',
                data: [50, 75, 100, 125, 150, 175, 200],
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }]
        };

        const ctx1 = document.getElementById('activeDriversChart').getContext('2d');
        const ctx2 = document.getElementById('visitsChart').getContext('2d');

        new Chart(ctx1, {
            type: 'bar',
            data: activeDriversData
        });

        new Chart(ctx2, {
            type: 'line',
            data: visitsData
        });
    </script>
    
</body>
</html>
