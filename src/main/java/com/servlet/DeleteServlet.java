package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DB.DBConnection;
import com.dao.jobdao;

@WebServlet("/deletepage")
public class DeleteServlet extends HttpServlet {
	

	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
		   jobdao dao = new jobdao(DBConnection.getConn());
		   boolean f = dao.deleteJobs(id);
		 
		   HttpSession session = req.getSession();
           if (f) {
               session.setAttribute("succMsg", "Job  delete post successful.");
           resp.sendRedirect("add_post.jsp");  
           } else {
               session.setAttribute("succMsg", "Something went wrong to delete job.");
               resp.sendRedirect("add_post.jsp");  
           }
		
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
}
