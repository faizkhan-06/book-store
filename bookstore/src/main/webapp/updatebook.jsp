<%@page import="com.bookstore.entites.Books"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.bookstore.entites.Authors"%>
<%@page import="com.bookstore.dao.AuthorsDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.entites.Category"%>
<%@page import="com.bookstore.helper.FactoryProvider"%>
<%@page import="com.bookstore.dao.CategoryDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Update Book</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .container {
                background-color: #ffffff;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
                padding: 20px;
                width: 400px; /* Increased width */
                text-align: center;
                margin: 20px 0; /* Added margin top and bottom */
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
                color: #555;
                font-size: 14px;
                margin-bottom: 5px;
            }

            .form-group input[type="text"],
            .form-group input[type="date"],
            .form-group input[type="number"],
            .form-group input[type="file"],
            .form-group select {
                width: 100%; /* Full width */
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
                font-size: 14px;
            }

            .form-group button:hover {
                background-color: #555;
            }

            .file-input-container {
                position: relative;
                overflow: hidden;
                display: inline-block;
            }

            .file-input-button {
                background-color: #333;
                color: #fff;
                border: none;
                border-radius: 3px;
                padding: 8px 16px;
                cursor: pointer;
                font-size: 14px;
                position: relative;
                z-index: 1;
            }

            .file-input {
                font-size: 100px;
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
            }
        </style>
    </head>
    <%
        CategoryDao category = new CategoryDao(FactoryProvider.getFactory());
        List<Category> categoryList = category.categoryList();

        AuthorsDao author = new AuthorsDao(FactoryProvider.getFactory());
        List<Authors> autorList = author.authorsList();

        int bookId = Integer.parseInt(request.getParameter("book_id"));
        Session hibernateSession = FactoryProvider.getFactory().openSession();
        Books book = (Books) hibernateSession.get(Books.class, bookId);

    %>

    <body>
        <div class="container">
            <h2>Add Book</h2>
            <form action="AddBooksServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="book-name">Book Name:</label>
                    <input type="text" id="book-name" name="book-name" value="<%= book.getBookName()%>" required>
                </div>
                <div class="form-group">
                    <label for="release-date">Release Date:</label>
                    <input type="date" id="release-date" name="release-date" required>
                </div>
                <div class="form-group">
                    <label for="book-price">Book Price:</label>
                    <input type="number" id="book-price" name="book-price" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="book-quantity">Book Quantity:</label>
                    <input type="number" id="book-quantity" name="book-quantity" required>
                </div>
                <div class="form-group">
                    <label for="book-image">Book Image:</label>
                    <div class="file-input-container">
                        <input type="file" id="book-image" name="book-image" accept="image/*" class="file-input" required>
                        <label for="book-image" class="file-input-button">Choose Image</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="book-category">Category:</label>
                    <select id="book-category" name="book-category" required>
                        <% for (Category c : categoryList) {%>
                        <option value="<%= c.getCategoryId()%>"><%= c.getCategoryName()%></option>
                        <% } %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="book-author">Author:</label>
                    <select id="book-author" name="book-author" required>
                        <% for (Authors a : autorList) {%>
                        <option value="<%= a.getAuthorId()%>"><%= a.getauthorName()%></option>
                        <% }%>
                        <!-- Add more authors as needed -->
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit">Add</button>
                </div>
            </form>
        </div>
    </body>
    <script>
        // Assuming book.getReleaseDate() returns a string in the format "MM/DD/YYYY"
        document.addEventListener("DOMContentLoaded", function () {
            var releaseDateStr = "<%= book.getReleaseDate()%>";

            // Set the value of the release-date input directly
            var releaseDateInput = document.getElementById("release-date");

            if (releaseDateInput) {
                releaseDateInput.value = releaseDateStr;
            }
        });
        // Assuming book.getBookPrice() and book.getBookQuantity() return integers
        var bookPrice = <%= book.getBookPrice()%>;
        var bookQuantity = <%= book.getBookQuantity()%>;

        // Set the values using JavaScript
        document.getElementById("book-price").value = bookPrice;
        document.getElementById("book-quantity").value = bookQuantity;

        document.addEventListener("DOMContentLoaded", function () {
            var bookCategory = <%= book.getCategory().getCategoryId()%>; // Get the book's category ID
            var bookAuthor = <%= book.getAuthors().getAuthorId()%>;     // Get the book's author ID

            // Set the selected option for the book category
            var categorySelect = document.getElementById("book-category");
            var categoryOptions = categorySelect.options;

            for (var i = 0; i < categoryOptions.length; i++) {
                if (categoryOptions[i].value === bookCategory.toString()) {
                    categoryOptions[i].selected = true;
                    break;
                }
            }

            // Set the selected option for the book author
            var authorSelect = document.getElementById("book-author");
            var authorOptions = authorSelect.options;

            for (var j = 0; j < authorOptions.length; j++) {
                if (authorOptions[j].value === bookAuthor.toString()) {
                    authorOptions[j].selected = true;
                    break;
                }
            }
        });
    </script>

</html>
