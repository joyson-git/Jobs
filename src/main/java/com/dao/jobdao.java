package com.dao;

import java.io.ObjectInputFilter.Status;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
public class jobdao {
 private Connection connection;

public jobdao(Connection connection) {
	super();
	this.connection = connection;
}
  public boolean addJobs(Jobs  j) 
  {
	  boolean f  = false;
	  try {
		  String sql = "INSERT INTO jobs_add(title, description, categories, status, location) VALUES (?, ?, ?, ?, ?)";
		  
		PreparedStatement ps = connection.prepareStatement(sql); 
		ps.setString(1, j.getTitle());
		ps.setString(2, j.getDescription());
		ps.setString(3, j.getCategory());
		ps.setString(4, j.getStatus());
		ps.setString(5, j.getLocation());
		//ps.setString(6, j.getPdate());

int i = ps.executeUpdate();
		
if(i==1) {
	f=true;
}

	} catch (Exception e) {
		e.printStackTrace();
	} 
	  return f;
  }
	
	public List<Jobs> getALLJobs(){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j =null;
		
		try {
		
			String sql = " select * from jobs_add order by id desc";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
			
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+" ");
				list.add(j);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public List<Jobs> getALLJobsFORUser(){
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j =null;
		
		try {
		
			String sql = " select * from jobs_add  status =? order by id desc";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
			
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+" ");
				list.add(j);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	public Jobs getJobsbyID(int id){
		Jobs j =null;
		
		try {
		
			String sql = " select * from jobs_add where id=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()){
			
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7)+" ");
				//l.add(j);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return j;
	}
	
	
	
	public boolean updateJob(Jobs j) {
		 boolean f  = false;
		  try {
			  String sql = "UPDATE jobs_add SET title = ?, description = ?, categories = ?, status = ?, location = ? WHERE id =?";  
			PreparedStatement ps = connection.prepareStatement(sql); 
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			//ps.setString(6, j.getPdate());
			ps.setInt(6, j.getId());
		//	int i = ps.executeUpdate();
			

	int i = ps.executeUpdate();
			
	if(i==1) {
		f=true;
	}

		} catch (Exception e) {
			e.printStackTrace();
		} 
		  return f;
	}
	
	public boolean deleteJobs(int id)
	{
		boolean f = false;
		try {
			String sql = "DELETE FROM jobs_add WHERE id = ?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id); 
	int i=	ps.executeUpdate();
	if(i==1) {
		f=true;
	}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	
}
