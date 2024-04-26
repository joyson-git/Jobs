<!DOCTYPE html>
<%@page import="com.DB.DBConnection"%>
<%@page import="com.dao.jobdao"%>
<%@page import="com.entity.Jobs"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit jobs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>EDIT Jobs</h2>
    <%@ include file="All/header.jsp" %>
    <%@ include file="All/nav.jsp" %>
    <%@ include file="All/footer.jsp" %>
    
    
  <%  int id  = Integer.parseInt(request.getParameter("id"));
   jobdao dao = new jobdao(DBConnection.getConn());
   Jobs j = dao.getJobsbyID(id);
   %>
    <input type ="hidden" value ="<%=j.getId() %>">
    
        <form action="update" method="post">
        
        
            <div class="form-group">
                <label for="jobTitle">Title:</label>
                <input type="text" id="jobTitle" name="title" required class ="form-control  value ="<%=j.getTitle()%>">
            </div>
            <div class="form-group">
                <label for="location">Location:</label>
                <select id="location" name="location" required>
                   <option value="<%= j.getLocation() %>"><%= j.getLocation() %></option>

                   <option value="New York">New York</option>
                    <option value="Los Angeles"> Los Angeles</option>
                    <option value="Chicago">Chicago</option>
                    <option value="Houston">Houston</option>
                </select>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <option value="<%= j.getCategory() %>"><%= j.getCategory() %></option>

                <select id="category" name="category" required>
                    <option value="" disabled selected>Select Category</option>
                    <option value="Technology">Technology</option>
                    <option value="Marketing">Marketing</option>
                    <option value="Finance">Finance</option>
                    <option value="Sales">Sales</option>
                </select>
            </div>
           <div class="form-group">
                <label>Status:</label>
                <select class="form-control" name="status">
                    <option value="<%=j.getStatus() %>"><%=j.getStatus() %></option>
                    <option class="Active" value="Active">Active</option>
                    <option class="INActive" value="INActive">INActive</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" class="form-control"><%= j.getDescription() %></textarea>
            </div>
            <button type="submit">Publish</button>
        </form>
    </div>
</body>
</html>