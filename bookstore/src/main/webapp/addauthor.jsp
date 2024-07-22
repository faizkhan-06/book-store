<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add Author</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background-color: #f0f0f0;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                padding: 20px;
                width: 300px;
                text-align: center;
            }

            .container h2 {
                color: #333;
                margin-bottom: 20px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                text-align: left;
                color: #666;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            .form-group button {
                background-color: #333;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;
            }

            .form-group button:hover {
                background-color: #555;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Add Author</h2>
            <form action="AddAuthorServlet" method="post">
                <div class="form-group">
                    <label for="author-name">Author Name:</label>
                    <input type="text" id="username" name="authorname" required>
                </div>
                <div class="form-group">
                    <button type="submit">Add</button>
                </div>
                <%@include file="components/message.jsp" %>
            </form>
        </div>
    </body>
</html>

