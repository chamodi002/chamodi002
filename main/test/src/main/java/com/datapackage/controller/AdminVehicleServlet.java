package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.util.List;

import com.datapackage.DAO.VehicleDAO;
import com.datapackage.model.Vehicle;

@WebServlet("/AdminVehicleServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB threshold
                 maxFileSize = 1024 * 1024 * 5,   // 5MB max file size
                 maxRequestSize = 1024 * 1024 * 10) // 10MB max request size
public class AdminVehicleServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "images"; // Folder to store images

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Handle delete action
            int id = Integer.parseInt(request.getParameter("id"));
            VehicleDAO vehicleDAO = new VehicleDAO();
            boolean success = vehicleDAO.deleteVehicle(id);

            if (success) {
                response.sendRedirect("admin/AddVehicle.jsp?success=delete");
            } else {
                response.sendRedirect("admin/AddVehicle.jsp?error=delete");
            }
        } else {
            // Handle add vehicle action
            String type = request.getParameter("type");
            String priceStr = request.getParameter("price");
            String model = request.getParameter("model");
            String numberPlate = request.getParameter("numberPlate");

            // Check if price is null or empty
            if (priceStr == null || priceStr.trim().isEmpty()) {
                response.sendRedirect("admin/AddVehicle.jsp?error=price_missing");
                return;
            }

            double price;
            try {
                price = Double.parseDouble(priceStr.trim());
            } catch (NumberFormatException e) {
                response.sendRedirect("admin/AddVehicle.jsp?error=invalid_price");
                return;
            }

            // Handle image upload
            Part filePart = request.getPart("imageFile");
            String fileName = filePart.getSubmittedFileName();

            // Define upload path
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir(); // Create directory if not exists

            // Save file to server
            filePart.write(uploadPath + File.separator + fileName);

            // Store vehicle details
            Vehicle vehicle = new Vehicle();
            vehicle.setType(type);
            vehicle.setPrice(price);
            vehicle.setModel(model);
            vehicle.setNumberPlate(numberPlate);
            vehicle.setImageFileName(UPLOAD_DIR + "/" + fileName); // Relative path

            VehicleDAO vehicleDAO = new VehicleDAO();
            boolean success = vehicleDAO.addVehicle(vehicle);

            if (success) {
                response.sendRedirect("admin/AddVehicle.jsp?success=true");
            } else {
                response.sendRedirect("admin/AddVehicle.jsp?error=true");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        VehicleDAO vehicleDAO = new VehicleDAO();
        List<Vehicle> vehicleList = vehicleDAO.getAllVehicles();

        request.setAttribute("vehicleList", vehicleList);
        request.getRequestDispatcher("admin/AddVehicle.jsp").forward(request, response);
    }
}