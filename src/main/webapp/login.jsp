<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .login-container {
            width: 300px;
            margin: 100px auto;
            background-color: grey;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
        }

        .input-group input {
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

        .error-message {
            color: red;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>

<body>
<%@ include file="All/header.jsp" %>
<%@ include file="All/nav.jsp" %>
<%@ include file="All/footer.jsp" %>
<div class="login-container">
    <h2>Login</h2>
    <form id="loginForm" action="login" method="post">
        <div class="input-group">
            <label for="email">Username:</label>
            <input type="text" id="email" name="email" required>
        </div>
        <div class="input-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit">Login</button>
    </form>
    <%-- Error message display --%>
    <div id="errorMessage" class="error-message" style="display: none;"></div>
</div>

<%-- Script for handling login errors --%>
<script>
    // Assuming you have a variable 'loginError' set in your backend logic
    // This variable indicates whether there was a login error or not
    var loginError = false; // Change this value based on your backend logic

    // Check if there is a login error
    if (loginError) {
        // Display error message
        var errorMessageElement = document.getElementById('errorMessage');
        errorMessageElement.innerText = "Invalid username or password.";
        errorMessageElement.style.display = "block";
    }
</script>
</body>
</html>
