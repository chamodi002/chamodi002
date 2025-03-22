package com.datapackage.controller;

import com.datapackage.DAO.UserDao;
import com.datapackage.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/userMenage")
public class UserServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            int userId = Integer.parseInt(request.getParameter("id"));
            boolean isDeleted = userDao.deleteUser(userId);

            // Prepare JSON response
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": " + isDeleted + ", \"message\": \"" + (isDeleted ? "User deleted successfully!" : "Failed to delete user.") + "\"}");
            out.flush();
            return;
        }

        List<User> users = userDao.getAllUsers();
        request.setAttribute("users", users);
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin/adminRegister.jsp");
        dispatcher.forward(request, response);
    }
}