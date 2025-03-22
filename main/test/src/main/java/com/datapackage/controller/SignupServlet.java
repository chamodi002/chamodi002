package com.datapackage.controller;
import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the form data
        String username = request.getParameter("uname");
        String password = request.getParameter("password");

        // Optionally, validate the inputs (e.g., check if they are not empty)
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            // If inputs are invalid, send an error message and stay on the signup page
            request.setAttribute("errorMessage", "Username and Password cannot be empty!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/Signup.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Process the signup (e.g., save the user data to the database)
        // Note: You can add actual database logic here
        boolean signupSuccessful = true; // Assume the signup was successful for now
        
     
        
        if (signupSuccessful) {
            // Redirect to home.jsp upon successful signup
        	request.setAttribute("successMessage", "Signup successful! Please log in.");
            response.sendRedirect("view/home.jsp");
        } else {
            // If signup failed, show an error message
            request.setAttribute("errorMessage", "Signup failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/Signup.jsp");
            dispatcher.forward(request, response);
            
            
        }
    }
}
