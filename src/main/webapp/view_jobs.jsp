<%@ page import="java.util.List" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="com.DB.DBConnection" %>
<%@ page import="com.dao.jobdao" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details</title>
    <%@ include file="All/header.jsp" %>
    <%@ include file="All/nav.jsp" %>
   
    <%@ page import="com.DB.DBConnection" %>
    <%@ page import="com.dao.jobdao" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 1600px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #4CAF50;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            color: #333;
            box-sizing: border-box;
            font-size: 16px;
        }

        input[type="text"][readonly],
        select[disabled],
        textarea[readonly] {
            background-color: #eee;
            cursor: not-allowed;
        }

        .link-buttons {
            text-align: center;
            margin-top: 20px;
        }

        .link-buttons a {
            padding: 10px 20px;
            margin-right: 10px;
            text-decoration: none;
            color: #fff;
            background-color: #4CAF50;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .link-buttons a:hover {
            background-color: #45a049;
        }

        .icon {
            color: #4CAF50;
            margin-right: 5px;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .card-wrapper { /* Wrapper for each card */
            padding: 20px; /* Add padding here */
        }

        .card {
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: scale(1.05);
        }

    </style>
</head>
<body>
<div class="container">
    <h2>Job Details</h2>
<a href="admin.jsp">HOME</a>
    <!-- Display job details -->
    <div class="grid-container">
        <% 
            jobdao dao = new jobdao(DBConnection.getConn());
            List<Jobs> list = dao.getALLJobs();
            for(Jobs j : list) {
        %> 

        <div class="card-wrapper"> <!-- Add wrapper -->
            <div class="card">
                <div class="card-body">
                    <div class="text-center text-primary">
                        <i class="far fa-n clipboard fa-2x"></i>
                    </div>

                    <div class="form-group">
                        <label for="title">Title:</label>
                        <input type="text" id="title" name="title" value="<%= j.getTitle() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="description">Description:</label>
                        <textarea id="description" name="description" rows="4" readonly><%= j.getDescription() %></textarea>
                    </div>
                    <div class="form-group">
                        <label for="category">Category:</label>
                        <input type="text" id="category" name="category" value="<%= j.getCategory() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="location">Location:</label>
                        <input type="text" id="location" name="location" value="<%= j.getLocation() %>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="publisherDate">Publisher Date:</label>
                        <input type="text" id="publisherDate" name="publisherDate" value="<%= j.getPdate() %>" readonly>
                    </div>
                     <a href="upload.jsp">Apply</a> 
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
