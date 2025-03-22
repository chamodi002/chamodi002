package com.datapackage.controller;


import java.io.IOException;
import java.util.List;

import com.datapackage.DAO.ContactDAO;
import com.datapackage.model.Contact;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactDAO contactDAO;

    public void init() {
        contactDAO = new ContactDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        Contact contact = new Contact(name, email, subject, message);
        contactDAO.insertContact(contact);

        response.sendRedirect("view/success.jsp");
    }

        // This method will handle the GET request to retrieve all contacts for the admin
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            // Fetch all contacts from the database
            List<Contact> contacts = contactDAO.getAllContacts();

            // Set the contacts attribute for use in the JSP page
            request.setAttribute("contacts", contacts);

            // Forward the request to the admin page to display the contacts
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin/adminContacts.jsp");
            dispatcher.forward(request, response);
        }
    }