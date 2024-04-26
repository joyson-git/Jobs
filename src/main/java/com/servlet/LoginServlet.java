package com.servlet;

import java.io.IOException;

import com.DB.DBConnection;
import com.dao.Userdao;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            User n = new User();
            HttpSession session = req.getSession();

            if ("admin.@gmail.com".equals(email) && "admin".equals(password)) {

                session.setAttribute("user1", n);
                n.setRole("admin");
                resp.sendRedirect("admin.jsp");
            } else {
                Userdao dao = new Userdao(DBConnection.getConn());
                User user = dao.login(email, password);
                if (user != null) {
                    session.setAttribute("userobj", user);
                    resp.sendRedirect("Search.jsp");
                } else {
                    session.setAttribute("userobj", "Invalid");
                    resp.sendRedirect("login.jsp");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
