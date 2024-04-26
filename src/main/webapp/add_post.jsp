<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Jobs Form</title>
    <!-- Include Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f3f4f6;
        }

        .container {
            animation: fadeIn 1s ease-in-out;
            text-align: center;
            margin: 41px auto;
            padding: 20px;
            border: 1px solid #e50914;
            border-radius: 10px;
            background: #ffffff;
            width: 60%;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
             height: 700px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 8px;
            box-sizing: border-box;
        }

        button[type="submit"],
        button[type="button"] {
            transition: all 0.3s ease;
            background: #e50914;
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.2em;
            margin-top: 20px;
        }

        button[type="submit"]:hover,
        button[type="button"]:hover {
            background: #ff4d4d;
        }

        nav ul {
            display: flex;
            justify-content: center;
            list-style: none;
            padding: 0;
            margin-bottom: 20px;
        }

        nav ul li {
            margin: 0 10px;
        }

        nav ul li a {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        nav ul li a:hover {
            color: #e50914;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li class="nav-item">
            <a class="nav-link" href="add_post.jsp">Post Job</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="view_jobs.jsp">View Job</a>
        </li>
        <!-- You can include other navigation items here -->
    </ul>
</nav>
<div class="container">
    <h2 class="text-2xl font-bold text-primary mb-4">Add Jobs</h2>
    <form action="add_POst" method="post">
        <div class="form-group">
            <label for="jobTitle">Title:</label>
            <input type="text" id="jobTitle" name="title" required>
        </div>
        <div class="form-group">
            <label for="location">Location:</label>
            <select id="location" name="location" required>
                <option value="" disabled selected>Select Location</option>
                <option value="New York">New York</option>
                <option value="Los Angeles"> Los Angeles</option>
                <option value="Chicago">Chicago</option>
                <option value="Houston">Houston</option>
            </select>
        </div>
        <div class="form-group">
            <label for="category">Category:</label>
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
            <input type="radio" id="active" name="status" value="active" checked>
            <label for="active">Active</label>
            <input type="radio" id="inactive" name="status" value="inactive">
            <label for="inactive">Inactive</label>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4" required></textarea>
        </div>
        <button type="submit">Publish</button>
        <!-- Delete button added below -->
        <button type="button" onclick="deleteJob()">Delete</button>
    </form>
</div>
<!-- Your existing scripts here -->
<script>
    function deleteJob() {
        // Write your delete functionality here
        // For example, you can make an AJAX call to delete the job from the server
        // Or you can simply reload the page after deletion
        alert("Delete functionality will be implemented here.");
    }
</script>
</body>
</html>
