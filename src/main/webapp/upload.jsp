<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Additional CSS for animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .fade-in {
            animation: fadeIn 1s ease-out;
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto py-8">
        <h2 class="text-3xl text-center font-semibold mb-4">File Upload Example</h2>
        <div class="max-w-md mx-auto bg-white p-6 rounded-lg shadow-lg fade-in">
            <form action="UploadServlet" method="post" enctype="multipart/form-data">
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2" for="fileInput">
                        Choose a file to upload:
                    </label>
                    <input id="fileInput" type="file" name="file" class="form-control">
                </div>
                <div class="text-center">
                    <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                        Upload File
                    </button>
                </div>
            </form>
           
        </div>
    </div>
</body>
</html>
