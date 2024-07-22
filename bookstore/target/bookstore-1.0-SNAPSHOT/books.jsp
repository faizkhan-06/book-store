<%@page import="com.bookstore.dao.BooksDao"%>
<%@page import="com.bookstore.entites.Books"%>
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
        BooksDao bookDao = new BooksDao(FactoryProvider.getFactory());
        List<Books> list = bookDao.booksList();
    %>
    <body>
        <!-- Include the admin navbar -->
        <%@ include file="components/adminnav.jsp" %>

        <div class="admin-content">
            <h2>Books</h2>
            <a href="addbook.jsp"><button class="create-button">Create</button></a>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Book Name</th>
                        <th>Release Date</th>
                        <th>Book Price</th>
                        <th>Book Quantity</th>
                        <th>Category</th>
                        <th>Author</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Fetch and display user data using JSP -->              
                <!--<c:forEach items="${userList}" var="user">-->
                    <% for (Books book : list) {%>
                    <tr>
                        <td><%= book.getBookId() %></td>
                        <td><%= book.getBookName() %></td>
                        <td><%= book.getReleaseDate() %></td>
                        <td>&#x20B9;<%= book.getBookPrice() %></td>
                        <td><%= book.getBookQuantity() %></td>
                        <td><%= book.getCategory().getCategoryName() %></td>
                        <td><%= book.getAuthors().getauthorName() %></td>
                        <td>
                            <a href="DeleteBookServlet?book_id=<%= book.getBookId()%>" class="delete-button" onclick="setDeleteLink()">Delete</a>
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
            var deleteLink = "DeleteBookServlet?book_id=" + hiddenUserId;
            document.querySelector(".delete-button").setAttribute("href", deleteLink);
        }
    </script>
</html>

