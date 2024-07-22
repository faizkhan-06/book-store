<%@page import="org.hibernate.Session"%>
<%@page import="com.bookstore.helper.FactoryProvider"%>
<%@page import="com.bookstore.entites.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update User</title>
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
    <% int userId = Integer.parseInt(request.getParameter("user_id"));
        Session hibernateSession = FactoryProvider.getFactory().openSession();
        User user = (User) hibernateSession.get(User.class, userId);

    %>
    <body>
        <div class="container">
            <h2>Update User</h2>
            <form action="UpdateUserServlet" method="post">
                <input type="hidden" name="user_id" value="<%= user.getUserId() %>">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="<%= user.getUserName()%>" required>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= user.getUserEmail()%>" required>
                </div>
                <div class="form-group">
                    <label for="user-type">User Type:</label>
                    <select id="user-type" name="usertype"  required>
                        <option value="normal">Normal</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit">Update</button>
                </div>
                <%@include file="components/message.jsp" %>
            </form>
        </div>
    </body>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var userType = "<%= user.getUserType()%>"; // Get the user type value

            var selectElement = document.getElementById("user-type");
            var options = selectElement.options;

            for (var i = 0; i < options.length; i++) {
                if (options[i].value === userType) {
                    options[i].selected = true; // Set the 'selected' attribute for the matching option
                    break;
                }
            }
        });
    </script>

</html>

