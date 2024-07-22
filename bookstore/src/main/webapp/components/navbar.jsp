<%@page import="com.bookstore.entites.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");

%>




<style>
    .navbar {
        background-color: #333333;
        color: #ffffff;
        padding: 10px 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        display: flex;
        align-items: center;
    }

    .logo img {
        width: 80px; /* Adjust the width of the logo as needed */
        height: auto;
        margin-right: 10px;
    }

    .logo h1 {
        font-size: 24px;
        margin: 0;
        padding: 0;
        color: #ffffff;
    }

    .nav-links ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .nav-links li {
        display: inline;
        margin-right: 20px;
    }
    .nav-links li:hover{
        border-bottom: 2px solid #ffffff;
    }

    .nav-links a {
        text-decoration: none;
        color: #ffffff;
        font-weight: bold;
    }

    .auth-buttons {
        display: flex;
        align-items: center;
    }

    .auth-buttons a {
        margin-right: 20px;
    }

    .auth-buttons .login-button {
        background-color: #ffffff;
        color: #333333;
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
    }

    .auth-buttons .signup-button {
        background-color: #333333;
        color: #ffffff;
        padding: 8px 16px;
        border-radius: 5px;
        text-decoration: none;
        font-weight: bold;
    }

    .auth-buttons .login-button:hover,
    .auth-buttons .signup-button:hover {
        background-color: #555555;
    }

</style>
<div class="navbar">
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

        <%            if (user1 == null) {
        %>
        <div class="auth-buttons">
            <a href="login.jsp" class="login-button">Login</a>
            <a href="signup.jsp" class="signup-button">Sign Up</a>
        </div>
        <%
            } else {
        %>
        <div class="auth-buttons">
            <a href="#!" class="login-button"><%= user1.getUserName() %></a>
            <a href="LogoutServlet" class="signup-button">Logout</a>
        </div>
        
        <%
            }

        %>
    </div>
</div>