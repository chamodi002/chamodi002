package com.datapackage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.datapackage.DAO.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteUser")
public class deleteUser extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            boolean isDeleted = userDao.deleteUser(userId);

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": " + isDeleted + 
                      ", \"message\": \"" + (isDeleted ? "User deleted successfully!" : "Failed to delete user.") + "\"}");
            out.flush();
        } catch (NumberFormatException e) {
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": false, \"message\": \"Invalid user ID format.\"}");
            out.flush();
        }
    }
}
