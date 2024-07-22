<%@page import="com.bookstore.entites.Authors"%>
<%@page import="com.bookstore.dao.AuthorsDao"%>
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
        AuthorsDao authorDao = new AuthorsDao(FactoryProvider.getFactory());
        List<Authors> list = authorDao.authorsList();
    %>
    <body>
        <!-- Include the admin navbar -->
        <%@ include file="components/adminnav.jsp" %>

        <div class="admin-content">
            <h2>Author List</h2>
            <a href="addauthor.jsp"><button class="create-button">Create</button></a>
            <table>
                <thead>
                    <tr>
                        <th>Author ID</th>
                        <th>Author Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Fetch and display user data using JSP -->              
                <!--<c:forEach items="${userList}" var="user">-->
                    <% for (Authors author : list) {%>
                    <tr>
                        <td><%= author.getAuthorId() %></td>
                        <td><%= author.getauthorName() %></td>
                        <td>
                            <input type="hidden" id="hiddenUserId" value="<%= author.getAuthorId() %>" />
                            <a href="updateauthor.jsp?author_id=<%= author.getAuthorId() %>" class="edit-button" onclick="setEditLink()">Edit</a>
                        </td>
                        <td>
                            <a href="DeleteAuthorServlet?author_id=<%= author.getAuthorId() %>" class="delete-button" onclick="setDeleteLink()">Delete</a>
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
            var deleteLink = "DeleteAuthorServlet?author_id=" + hiddenUserId;
            document.querySelector(".delete-button").setAttribute("href", deleteLink);
        }
        function setEditLink() {
            var hiddenUserId = document.getElementById("hiddenUserId").value;
            var editLink = "updateauthor.jsp?author_id=" + hiddenUserId;
            document.querySelector(".edit-button").setAttribute("href", editLink);
        }
    </script>

</html>
