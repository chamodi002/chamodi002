package com.datapackage.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.datapackage.model.User;

public class UserDao {
    private static final Logger LOGGER = Logger.getLogger(UserDao.class.getName());

    private static final String URL = "jdbc:mysql://localhost:3306/cab_booking";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Chamodi1234@#";

    private static final String INSERT_USER_QUERY = "INSERT INTO users (name, address, contact, username, password) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_USERS_QUERY = "SELECT * FROM users";
    private static final String DELETE_USER_QUERY = "DELETE FROM users WHERE id = ?";

    public boolean registerUser(User user) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                 PreparedStatement ps = conn.prepareStatement(INSERT_USER_QUERY)) {

                LOGGER.info("✅ Database Connection Successful.");

                ps.setString(1, user.getName());
                ps.setString(2, user.getAddress());
                ps.setLong(3, user.getContact());
                ps.setString(4, user.getUname());
                ps.setString(5, user.getPassword());

                int rowsInserted = ps.executeUpdate();
                if (rowsInserted > 0) {
                    LOGGER.info("✅ User registered successfully!");
                    return true;
                } else {
                    LOGGER.warning("❌ Failed to register user.");
                    return false;
                }
            }
        } catch (ClassNotFoundException e) {
            LOGGER.log(Level.SEVERE, "❌ MySQL Driver Not Found!", e);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "❌ SQL Exception Occurred!", e);
        }
        return false;
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(SELECT_ALL_USERS_QUERY)) {

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setAddress(rs.getString("address"));
                user.setContact(rs.getLong("contact"));
                user.setUname(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                users.add(user);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "❌ Error retrieving users", e);
        }
        return users;
    }

    public boolean deleteUser(int userId) {
        try (Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(DELETE_USER_QUERY)) {

            ps.setInt(1, userId);
            int rowsDeleted = ps.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "❌ Error deleting user", e);
            return false;
        }
    }
}