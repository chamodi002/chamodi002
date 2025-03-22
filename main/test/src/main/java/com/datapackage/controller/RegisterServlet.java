package com.datapackage.controller;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.datapackage.DAO.UserDao;
import com.datapackage.model.User;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(RegisterServlet.class.getName());
    private UserDao userDAO = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOGGER.info("✅ RegisterServlet invoked!");

        try {
            // Retrieve form data
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String contactStr = request.getParameter("contact");
            String username = request.getParameter("uname");
            String password = request.getParameter("password");

            // Debugging logs
            LOGGER.info("Received Data: ");
            LOGGER.info("Name: " + name);
            LOGGER.info("Address: " + address);
            LOGGER.info("Contact: " + contactStr);
            LOGGER.info("Username: " + username);

            // Convert contact to long (handle errors)
            long contact;
            try {
                contact = Long.parseLong(contactStr);
            } catch (NumberFormatException e) {
                LOGGER.severe("❌ Invalid contact number: " + contactStr);
                response.sendRedirect("view/Signup.jsp");
                return;
            }

            

            // Create user object
            User user = new User(name, address, contact, username, password);

            // Attempt to register user
            if (userDAO.registerUser(user)) {
                LOGGER.info("✅ User stored in database.");
                response.sendRedirect("view/Signup.jsp");
            } else {
                LOGGER.warning("❌ Error storing user in database.");
                response.sendRedirect("view/Error.jsp");
            }
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Exception in RegisterServlet", e);
            response.sendRedirect("view/Error.jsp");
        }
    }
}
