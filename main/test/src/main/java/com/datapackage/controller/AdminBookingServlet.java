package com.datapackage.controller;

import com.datapackage.DAO.BookingDAO;
import com.datapackage.model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/adminBookings")
public class AdminBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Booking> bookings = bookingDAO.getAllBookings();

        if (bookings == null || bookings.isEmpty()) {
            request.setAttribute("errorMessage", "No bookings found.");
        } else {
            request.setAttribute("bookings", bookings);
        }

        request.getRequestDispatcher("/admin/adminBookings.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        try {
            String action = request.getParameter("action");
            if ("delete".equals(action)) {
                int bookingId = Integer.parseInt(request.getParameter("bookingId"));
                boolean deleted = bookingDAO.deleteBooking(bookingId);

                if (deleted) {
                    out.print("{\"success\": true, \"message\": \"Booking deleted successfully!\"}");
                } else {
                    out.print("{\"success\": false, \"message\": \"Failed to delete booking.\"}");
                }
            }
        } catch (Exception e) {
            out.print("{\"success\": false, \"message\": \"Server error: " + e.getMessage() + "\"}");
        } finally {
            out.flush();
        }
    }
}