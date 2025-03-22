package com.datapackage.controller;

import com.datapackage.DAO.VehicleDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteVehicleServlet")
public class DeleteVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the vehicle ID from the request
        int id = Integer.parseInt(request.getParameter("id"));

        // Delete the vehicle using the DAO
        VehicleDAO vehicleDAO = new VehicleDAO();
        boolean success = vehicleDAO.deleteVehicle(id);

        // Redirect with success or error message
        if (success) {
            response.sendRedirect("admin/AddVehicle.jsp?success=delete");
        } else {
            response.sendRedirect("admin/AddVehicle.jsp?error=delete");
        }
    }
}