<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Custom Navbar</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    .navbar-custom {
      background-color: #f8f9fa; /* Light gray */
      border-bottom: 1px solid #dee2e6; /* Gray */
    }

    .navbar-custom .navbar-brand {
      color: #343a40; /* Dark gray */
    }

    .navbar-custom .navbar-nav .nav-link {
      color: #343a40; /* Dark gray */
    }

    .navbar-custom .navbar-nav .nav-link.active,
    .navbar-custom .navbar-nav .nav-link:hover {
      color: #007bff; /* Blue */
    }

    .navbar-custom .dropdown-menu {
      background-color: #f8f9fa; /* Light gray */
    }

    .navbar-custom .dropdown-item {
      color: #343a40; /* Dark gray */
    }

    .navbar-custom .dropdown-item:hover {
      background-color: #dee2e6; /* Gray */
    }

    /* Adjustments to move login and signup to the right */
    @media (min-width: 992px) {
      .navbar-custom .ml-auto {
        margin-left: auto !important;
      }
    }
  </style>
</head>
<body>

<nav class="navbar navbar-custom navbar-expand-lg">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Tazlump JOBs</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
       <!--   <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
        </li> -->
        <!-- Add more nav items here if needed -->
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a href="login.jsp" class="btn btn-light">Login</a>
        </li>
        <li class="nav-item">
          <a href="signup.jsp" class="btn btn-light">Signup</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Bootstrap JS (Assuming you're using Bootstrap) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>
