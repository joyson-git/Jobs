<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
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
        /* Global styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa; /* Light gray background */
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px; /* Limit container width */
            margin: 0 auto; /* Center container horizontally */
            padding: 20px;
        }

        a {
            text-decoration: none; /* Remove underline from links */
            color: #007bff; /* Blue color for links */
        }

        a:hover {
            text-decoration: underline; /* Underline on hover */
        }

        /* Grid layout */
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .card-wrapper {
            transition: transform 0.3s ease;
        }

        .card-wrapper:hover {
            transform: translateY(-5px);
        }

        .card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .card-body {
            padding: 20px;
        }

        .text-primary {
            color: #007bff;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: none;
        }
    </style>
</head>
<body>
<div class="container">
    <a href="admin.jsp">HOME</a>
    <h2>Applied jobs</h2>

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
                        <i class="far fa-clipboard fa-2x"></i> <!-- Corrected class name -->
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
                    <div class="form-group">
                        <label for="appliedJobs">Applied Jobs:</label>
                        <% 
                            String filePath = j.getFilePath(); // Use getFilePath() instead of getfile()
                            if(filePath != null && !filePath.isEmpty()) {
                                File file = new File(filePath);
                                String fileName = file.getName(); // Extract filename from path
                        %>
                        <input type="text" id="appliedJobs" name="appliedJobs" value="<%= fileName %>" readonly>
                        <% } else { %>
                        <input type="text" id="appliedJobs" name="appliedJobs" value="No file attached" readonly>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>
