<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Website</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Additional custom styles */

        /* Background color for the body */
        body {
            background-color: #F3F4F6; /* Gray-100 */
        }

        /* Navigation Bar styles */
        nav {
            background-color: #4B5563; /* Gray-800 */
            padding: 1rem;
        }

        nav ul {
            display: flex;
            justify-content: center;
            list-style: none;
        }

        nav ul li {
            margin-right: 1rem;
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 0.25rem;
            transition: background-color 0.3s ease;
        }

        nav ul li a:hover {
            background-color: #2D3748; /* Gray-600 */
        }

        /* Main Content styles */
        .container {
            padding: 2rem;
        }

        .bg-white {
            background-color: white;
        }

        .rounded-lg {
            border-radius: 0.5rem;
        }

        .shadow-lg {
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
        }

        .text-gray-800 {
            color: #2D3748; /* Gray-900 */
        }

        .text-highlight {
            color: #FFD700; /* Gold color */
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            animation: textAnimation 3s infinite alternate;
        }

        @keyframes textAnimation {
            0% {
                transform: scale(1);
            }
            100% {
                transform: scale(1.05);
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav>
        <ul>
            <li>
                <a href="add_post.jsp">Post Job</a>
            </li>
            <li>
                <a href="view_jobs.jsp">View Jobs</a>
            </li>
            <li>
                <a href="applied.jsp">Applied Jobs</a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="container mx-auto py-8">
        <h1 class="text-4xl text-center text-grey font-bold mb-8">Welcome to  <span class="text-highlight">Tazlump JOBs</span></h1>
        <div class="flex justify-center">
            <div class="bg-white rounded-lg shadow-lg p-8">
                <p class="text-lg text-gray-800">Choose a job you love, and you will never have to work a day in your life</p>
               
            </div>
        </div>
    </div>

    <!-- Include any JavaScript files or scripts here -->
</body>
</html>
