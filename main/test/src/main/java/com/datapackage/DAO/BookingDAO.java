package com.datapackage.DAO;

import com.datapackage.model.Booking;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BookingDAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Chamodi1234@#";
    private static final Logger LOGGER = Logger.getLogger(BookingDAO.class.getName());
    
    // Get connection to database
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
    }
    
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Booking booking = new Booking(
                    rs.getInt("id"),
                    rs.getString("vehicle_type"),
                    rs.getDouble("price"),
                    rs.getString("customer_name"),
                    rs.getString("email"),
                    rs.getString("phone"),
                    rs.getString("pickup_location"),
                    rs.getString("dropoff_location"),
                    rs.getTimestamp("pickup_datetime").toLocalDateTime()
                );
                bookings.add(booking);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error retrieving bookings", e);
        }
        return bookings;
    }

    public boolean deleteBooking(int id) {
        String sql = "DELETE FROM bookings WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error deleting booking with ID " + id, e);
            return false;
        }
    }
 
    // Add a new booking to the database
    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO bookings (vehicle_type, price, customer_name, email, phone, pickup_location, dropoff_location, pickup_datetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, booking.getVehicleType());
            stmt.setString(2, booking.getPrice());
            stmt.setString(3, booking.getCustomerName());
            stmt.setString(4, booking.getCustomerEmail());
            stmt.setString(5, booking.getCustomerPhone());
            stmt.setString(6, booking.getPickupLocation());
            stmt.setString(7, booking.getDropoffLocation());
            stmt.setString(8, booking.getPickupDateTime());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Error adding new booking", e);
            return false;
        }
    }
}