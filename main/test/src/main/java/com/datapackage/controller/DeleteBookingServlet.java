package com.datapackage.controller;

import com.datapackage.DAO.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO;

    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        
        try {
            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            boolean deleted = bookingDAO.deleteBooking(bookingId);

            if (deleted) {
                out.print("{\"success\": true, \"message\": \"Booking deleted successfully!\"}");
            } else {
                out.print("{\"success\": false, \"message\": \"Failed to delete booking.\"}");
            }
        } catch (Exception e) {
            out.print("{\"success\": false, \"message\": \"Server error: " + e.getMessage() + "\"}");
        } finally {
            out.flush();
        }
    }
}