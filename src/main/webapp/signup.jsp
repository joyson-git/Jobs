<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file for styling -->
</head>
<body>
    <div class="container">
        <h2>Sign Up</h2>
        <form action="Signup" method="post">
            <!-- Input field for name -->
            <div class="input-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <!-- Input field for qualification -->
            <div class="input-group">
                <label for="qualification">Qualification:</label>
                <input type="text" id="qualification" name="qualification" required>
            </div>
            <!-- Input field for email -->
            <div class="input-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <!-- Input field for password -->
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <!-- Input field for role -->
            <div class="input-group">
                <label for="role">Role:</label>
                <input type="text" id="role" name="role" required>
            </div>
            <!-- Submit button -->
            <button type="submit">Sign Up</button>
        </form>
        <!-- Link to login page -->
        <p>Already have an account? <a href="login.jsp">Log in here</a></p>
    </div>
</body>
</html>
