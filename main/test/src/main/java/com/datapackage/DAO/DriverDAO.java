package com.datapackage.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.datapackage.model.Driver;

public class DriverDAO {
    private static final Logger LOGGER = Logger.getLogger(DriverDAO.class.getName());

    private static final String URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Chamodi1234@#";

    private static final String INSERT_DRIVER_QUERY = "INSERT INTO drivers (name, license, phone) VALUES (?, ?, ?)";
    private static final String SELECT_ALL_DRIVERS = "SELECT * FROM drivers";
    private static final String DELETE_DRIVER_QUERY = "DELETE FROM drivers WHERE id = ?";

    public boolean addDriver(Driver driver) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver

            try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(INSERT_DRIVER_QUERY)) {

                LOGGER.info("✅ Database Connection Successful.");

                ps.setString(1, driver.getName());
                ps.setString(2, driver.getLicense());
                ps.setString(3, driver.getPhone());

                int rowsInserted = ps.executeUpdate();
                return rowsInserted > 0;
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "❌ MySQL Driver Not Found!", e);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "❌ SQL Exception Occurred!", e);
        }
        return false;
    }

    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(SELECT_ALL_DRIVERS);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    drivers.add(new Driver(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("license"),
                        rs.getString("phone")
                    ));
                }
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "❌ MySQL Driver Not Found!", e);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "❌ SQL Exception Occurred!", e);
        }
        return drivers;
    }

    public boolean deleteDriver(int id) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(DELETE_DRIVER_QUERY)) {

                ps.setInt(1, id);
                int rowsDeleted = ps.executeUpdate();
                return rowsDeleted > 0;
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "❌ MySQL Driver Not Found!", e);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "❌ SQL Exception Occurred!", e);
        }
        return false;
    }
}
