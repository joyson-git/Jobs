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
import com.entity.Jobs;


@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			  String title = req.getParameter("title");
	            String location = req.getParameter("location");
	            String category = req.getParameter("category");
	            String status = req.getParameter("status");
	            String description = req.getParameter("description");

	            
	            
	            
	            Jobs j = new Jobs();
	            j.setId(id);
	            j.setTitle(title);
	            j.setDescription(description);
	            j.setLocation(location);
	            j.setCategory(category);
	            j.setStatus(status);
	            
	            
	            
	            
	            HttpSession session = req.getSession();

	            jobdao dao = new jobdao(DBConnection.getConn());
	          boolean f =  dao.updateJob(j);
	            if (f) {
	            	//out.print("set suceesfull");
	                session.setAttribute("msg", "Job post successful.");
	            resp.sendRedirect("view_jobs.jsp");  
	            } else {
	                session.setAttribute("msg", "Failed to post job.");
	                resp.sendRedirect("view_jobs.jsp");  
	            }
	        	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}	
}


