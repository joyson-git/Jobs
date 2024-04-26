package com.servlet;

import com.DB.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/UploadServlet")
@MultipartConfig
public class upload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        try {
            Connection connection = DBConnection.getConn();
            PreparedStatement ps = connection.prepareStatement("INSERT INTO upload (images) VALUES (?)");
            ps.setString(1, fileName);
            int i = ps.executeUpdate();
            if (i == 1) {
                System.out.println("File uploaded successfully");
                // Send a response back to the client
                response.getWriter().println("File uploaded successfully. Thank you!");
            } else {
                System.out.println("Failed to upload file");
            }
            // Close resources
            ps.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
