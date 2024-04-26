<%@ page import="java.util.List" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="com.dao.jobdao" %>
<%@ page import="com.DB.DBConnection" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details</title>
    <%@ include file="All/header.jsp" %>
    <%@ include file="All/nav.jsp" %>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqj61gCWsbLUHw6aNkclkeFuq6WDNgvJiRRYqzsLU3tx9zVK/TCuHrsYg" crossorigin="anonymous">
    <style>
        /* Your CSS styles here */
    </style>
</head>

<body>
    <div class="container">
        <h2>Search</h2>
        <a href="admin.jsp">HOME</a>
        <form action="search_result.jsp" method="GET">
            <label for="search">Category:</label><br>

            <select id="category" name="category" required>
                <option value="" disabled selected>Select Category</option>
                <option value="Technology">Technology</option>
                <option value="Marketing">Marketing</option>
                <option value="Finance">Finance</option>
                <option value="Sales">Sales</option>
            </select>
            <label for="location">Location:</label>
            <select id="location" name="location" required>
                <option value="" disabled selected>Select Location</option>
                <option value="New York">New York</option>
                <option value="Los Angeles">Los Angeles</option>
                <option value="Chicago">Chicago</option>
                <option value="Houston">Houston</option>
            </select>
            <button type="submit">Search</button>
        </form>

        <%
            try {
                String category = request.getParameter("category");
                String location = request.getParameter("location");

                jobdao dao = new jobdao(DBConnection.getConn());
                List<Jobs> list;

                if (category != null && location != null && !category.isEmpty() && !location.isEmpty()) {
                    list = dao.getALLJobsFORUser(category, location);
                } else {
                    list = dao.getALLJobsFORUser(); // Fallback to displaying all jobs if no search criteria
                }

                if (!list.isEmpty()) {
                    for (Jobs j : list) {
        %>

                        <div class="card mt-2">
                            <div class="text-center text-primary">
                                <i class="far fa-clipboard fa-2x"></i>
                            </div>
                            <h6><%= j.getTitle() %></h6>
                            <p><%= j.getDescription().length() > 0 ? (j.getDescription().length() < 120 ? j.getDescription() : j.getDescription().substring(0, 120) + "...") : "No description available." %></p>
                            <div class="form-row">
                                <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                                <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                                <div class="form-group col-md-3">
                                    <h6>Publish Date: <%= j.getPdate().toString() %></h6>
                                </div>
                            </div>
                            <div class="text-center">
                                <a class="btn btn-sm bg-success text-primary" href="one_view.jsp?id=<%= j.getId() %>">View More</a>
                            </div>
                        </div>

                    <% } // end of for loop
                    } else { %>
                        <p>No jobs found.</p>
                    <% } %>
                <% } catch (Exception e) {
                    e.printStackTrace();
                } %>
            </div>
        </body>
    </html>
