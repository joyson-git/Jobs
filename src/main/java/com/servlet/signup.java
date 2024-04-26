package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import com.DB.DBConnection;
import com.dao.Userdao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Signup")
public class signup extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetching user details from the signup form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String qualification = request.getParameter("qualification");
        String role = request.getParameter("role"); // Retrieve the role parameter

        // Creating a User object
        User user = new User(name, email, password, qualification, role);

        // Establishing database connection
        try (Connection connection = DBConnection.getConn()) {
            // Creating Userdao object
            Userdao userDao = new Userdao(connection);

            // Adding user to the database
            boolean added = userDao.addUser(user);
            HttpSession session = request.getSession();
            if (added) {
                session.setAttribute("successMessage", "Registration successful!");
                response.sendRedirect("login.jsp");
            } else {
                session.setAttribute("errorMessage", "Registration failed. Please try again.");
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the SQL exception properly in your application
            response.sendRedirect("error.jsp");
        }
    }
}
