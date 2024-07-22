<%@page import="com.bookstore.dao.UserDao"%>
<%@page import="com.bookstore.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.entites.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            .admin-content {
                max-width: 800px;
                margin: 20px auto;
                padding: 20px;
                background-color: #ffffff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .create-button {
                background-color: #333333;
                color: #ffffff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                margin-bottom: 20px;
                cursor: pointer;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #dddddd;
            }

            th {
                background-color: #333333;
                color: #ffffff;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .edit-button, .delete-button {
                display: inline-block;
                padding: 6px 12px;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                cursor: pointer;
            }

            .edit-button {
                background-color: #333333;
                color: #ffffff;
            }

            .delete-button {
                background-color: #d9534f;
                color: #ffffff;
            }

            .edit-button:hover, .delete-button:hover {
                background-color: #555555;
            }
        </style>
    </head>
    <%
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
        List<User> list = userDao.userList();
    %>
    <body>
        <!-- Include the admin navbar -->
        <%@ include file="components/adminnav.jsp" %>

        <div class="admin-content">
            <h2>User List</h2>
            <a href="adduser.jsp"><button class="create-button">Create</button></a>
            <table>
                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>User Name</th>
                        <th>User Email</th>
                        <th>User Type</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Fetch and display user data using JSP -->              
                <!--<c:forEach items="${userList}" var="user">-->
                    <% for (User user : list) {%>
                    <tr>
                        <td><%= user.getUserId()%></td>
                        <td><%= user.getUserEmail()%></td>
                        <td><%= user.getUserName()%></td>
                        <td><%= user.getUserType()%></td>
                        <td>
                            <input type="hidden" id="hiddenUserId" value="<%= user.getUserId()%>" />
                            <a href="updateuser.jsp?user_id=<%= user.getUserId()%>" class="edit-button" onclick="setEditLink()">Edit</a>
                        </td>
                        <td>
                            <a href="DeleteUserServlet?user_id=<%= user.getUserId()%>" class="delete-button" onclick="setDeleteLink()">Delete</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
        </div>
    </body>
    <script>
        function setDeleteLink() {
            var hiddenUserId = document.getElementById("hiddenUserId").value;
            var deleteLink = "DeleteUserServlet?user_id=" + hiddenUserId;
            document.querySelector(".delete-button").setAttribute("href", deleteLink);
        }
        function setEditLink() {
            var hiddenUserId = document.getElementById("hiddenUserId").value;
            var editLink = "updateuser.jsp?user_id=" + hiddenUserId;
            document.querySelector(".edit-button").setAttribute("href", editLink);
        }
    </script>

</html>
