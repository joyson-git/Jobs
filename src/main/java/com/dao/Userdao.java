package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;

public class Userdao {
  
    private Connection connection;

    public Userdao(Connection connection) {
        this.connection = connection;
    }
   
    public boolean addUser(User user) {
        boolean added = false;
        try {
            String sql = "INSERT INTO users (name, email, password, qualification, role) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getPassword());
            statement.setString(4, user.getQualification());
            statement.setString(5, user.getRole());

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                added = true;
            }
        } catch (SQLException e) {
            // Optional: Log the error or throw a custom exception
            e.printStackTrace();
        }
        return added;
    }
    
    public User login(String email, String password) {
        User user = null;
        try {
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setQualification(rs.getString("qualification"));
                user.setRole(rs.getString("role"));
            } else {
                // Optional: You can log a message indicating that no user was found
                // System.out.println("No user found with email: " + email);
            }
        } catch (SQLException e) {
            // Optional: Log the error or throw a custom exception
            e.printStackTrace();
        }
        return user;
    }
}
