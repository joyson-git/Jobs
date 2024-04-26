package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.DB.DBConnection;
import com.dao.jobdao;
import com.entity.Jobs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_POst")
public class AddPostServle extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String title = req.getParameter("title");
            String location = req.getParameter("location");
            String category = req.getParameter("category");
            String status = req.getParameter("status");
            String description = req.getParameter("description");

           

            Jobs j = new Jobs();
            j.setTitle(title);
            j.setDescription(description);
            j.setCategory(category);
            j.setLocation(location);
            j.setStatus(status);
       
            HttpSession session = req.getSession();

            jobdao dao = new jobdao(DBConnection.getConn());
          boolean f =  dao.addJobs(j);
            if (f) {
                session.setAttribute("succMsg", "Job post successful.");
            resp.sendRedirect("add_post.jsp");  
            } else {
                session.setAttribute("succMsg", "Failed to post job.");
                resp.sendRedirect("add_post.jsp");  
            }
        } catch (Exception e) {
           
            e.printStackTrace();
         
        }
      
    }
}
