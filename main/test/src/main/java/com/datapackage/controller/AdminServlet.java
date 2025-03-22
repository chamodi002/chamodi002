package com.datapackage.controller;

import java.io.IOException;
import java.util.List;

import com.datapackage.DAO.ContactDAO;
import com.datapackage.model.Contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminContacts")
public class AdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactDAO contactDAO;

    public void init() {
        contactDAO = new ContactDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Contact> contacts = contactDAO.getAllContacts();
        request.setAttribute("contacts", contacts);
        request.getRequestDispatcher("admin/adminContacts.jsp").forward(request, response);
    }
}