package com.datapackage.controller;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
            // Create session for the admin
            HttpSession session = request.getSession();
            session.setAttribute("adminUser", username);
            response.sendRedirect("admin/adminDashboard.jsp"); // Redirect to admin dashboard
        } else {
            response.sendRedirect("admin/adminLogin.jsp?error=Invalid Credentials"); // Redirect back with an error
        }
    }
}
