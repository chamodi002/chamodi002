package com.datapackage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.datapackage.DAO.ContactDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteContact")
public class deleteContact extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactDAO contactDAO;

    public void init() {
        contactDAO = new ContactDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int contactId = Integer.parseInt(request.getParameter("contactId"));
        boolean isDeleted = contactDAO.deleteContact(contactId);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"success\": " + isDeleted + ", \"message\": \"" + (isDeleted ? "Contact deleted successfully!" : "Failed to delete contact.") + "\"}");
        out.flush();
    }
}