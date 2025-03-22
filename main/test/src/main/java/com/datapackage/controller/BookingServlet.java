package com.datapackage.controller;

import com.datapackage.DAO.BookingDAO;
import com.datapackage.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

import java.io.IOException;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String vehicleType = request.getParameter("vehicleType");
        String price = request.getParameter("price");
        String customerName = request.getParameter("customerName");
        String customerEmail = request.getParameter("customerEmail");
        String customerPhone = request.getParameter("customerPhone");
        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropoffLocation");
        String pickupDateTime = request.getParameter("pickupDateTime");
        String paymentMethod = request.getParameter("paymentMethod");
        String stripeToken = request.getParameter("stripeToken");

        // Validate input
        if (vehicleType == null || vehicleType.isEmpty() || 
            price == null || price.isEmpty() || 
            customerName == null || customerName.isEmpty() || 
            customerEmail == null || customerEmail.isEmpty() || 
            customerPhone == null || customerPhone.isEmpty() || 
            pickupLocation == null || pickupLocation.isEmpty() || 
            dropoffLocation == null || dropoffLocation.isEmpty() || 
            pickupDateTime == null || pickupDateTime.isEmpty() || 
            paymentMethod == null || paymentMethod.isEmpty()) {
            
            request.setAttribute("errorMessage", "All fields are required.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/Booking.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Process payment if required
//        if ("creditCard".equals(paymentMethod) || "debitCard".equals(paymentMethod)) {
//            if (stripeToken == null || stripeToken.isEmpty()) {
//                request.setAttribute("errorMessage", "Payment processing failed. Try again.");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("view/Booking.jsp");
//                dispatcher.forward(request, response);
//                return;
//            }
//        }

        // Create Booking object
        Booking booking = new Booking(vehicleType, price, customerName, customerEmail, customerPhone, pickupLocation, dropoffLocation, pickupDateTime);

        // Save to database
        BookingDAO bookingDAO = new BookingDAO();
        boolean isSuccess = bookingDAO.addBooking(booking);

        if (isSuccess) {
            request.setAttribute("vehicleType", vehicleType);
            request.setAttribute("price", price);
            request.setAttribute("customerName", customerName);
            request.setAttribute("customerEmail", customerEmail);
            request.setAttribute("customerPhone", customerPhone);
            request.setAttribute("pickupLocation", pickupLocation);
            request.setAttribute("dropoffLocation", dropoffLocation);
            request.setAttribute("pickupDateTime", pickupDateTime);
            request.setAttribute("paymentMethod", paymentMethod);

            // Forward request to summary.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/summary.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Booking failed. Please try again.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("view/Booking.jsp");
            dispatcher.forward(request, response);
        }
    }
}
