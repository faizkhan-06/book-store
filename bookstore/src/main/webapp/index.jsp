<%-- 
    Document   : index
    Created on : 30-Sept-2023, 8:47:05 pm
    Author     : FAIZKHAN
--%>


<%@page import="java.util.List"%>
<%@page import="com.bookstore.entites.Books"%>
<%@page import="com.bookstore.dao.BooksDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bookstore.helper.FactoryProvider" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/home.css">
        <script src="js/home.js" defer></script>
        <title>Books E-Commerce</title>
    </head>
    <%
        BooksDao bookDao = new BooksDao(FactoryProvider.getFactory());
        List<Books> list = bookDao.booksList();

    %>
    <body>
        <header>
            <!--        <div class="navbar">
                        <div class="container">
                            <div class="logo">
                                <img src="img/booklogo.png" alt="BookStore Logo">
                                <h1>BookStore</h1>
                            </div>
                            <div class="nav-links">
                                <ul>
                                    <li><a href="index.jsp">Home</a></li>
                                    <li><a href="#">Books</a></li>
                                    <li><a href="#">Categories</a></li>
                                    <li><a href="#">Cart</a></li>
                                </ul>
                            </div>
                            <div class="auth-buttons">
                                <a href="login.jsp" class="login-button">Login</a>
                                <a href="signup.jsp" class="signup-button">Sign Up</a>
                            </div>
                        </div>
                    </div>-->
            <%@include file="components/navbar.jsp" %>
        </header>

        <div class="slider-container">
            <div class="slider">
                <!-- Slide 1: Fiction -->
                <div class="slide">
                    <h2>Fiction</h2>
                    <h4>Fiction Books</h4>
                </div>
                <!-- Slide 2: Crime and Mystery -->
                <div class="slide">
                    <h2>Crime and Mystery</h2>
                    <h4>Crime and Mystery Books</h4>
                </div>
                <!-- Slide 3: Fantasy -->
                <div class="slide">
                    <h2>Fantasy</h2>
                    <h4>Fantasy Books</h4>
                </div>
                <!-- Slide 4: Novel -->
                <div class="slide">
                    <h2>Novel</h2>
                    <h4>Novel Books</h4>
                </div>
                <!-- Slide 5: Adventure -->
                <div class="slide">
                    <h2>Adventure</h2>
                    <h4>Adventure Books</h4>
                </div>
                <!-- Add more slides for additional book types -->
            </div>
            <button class="prev">&#10094;</button>
            <button class="next">&#10095;</button>
        </div>

        <main>
            <% for(Books book : list ){ %>
            <div class="book-container">
                <img src="img/books/<%= book.getBookImage() %>" alt="Book 1">
                <h2><%= book.getBookName() %></h2>
                <p>Author: <%= book.getAuthors().getauthorName() %></p>
                <p>Release Date: <%= book.getReleaseDate() %></p>
                <p>Category : <%= book.getCategory().getCategoryName() %> </p>
                <p> Price : &#x20B9; <%= book.getBookPrice() %></p>
                <button class="purchase-btn">Purchase</button>
            </div>
                
            <% } %>

            <!-- Repeat similar book containers for other books -->
        </main>
        <footer>
            <a href="about.html">About Us</a>
        </footer>
    </body>
</html>
