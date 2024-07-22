<%@page import="com.bookstore.entites.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "you are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not admin !!");
            response.sendRedirect("login.jsp");
            return;
        }
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="css/admin.css"/>
    </head>
    <body>
        <header>
            <%@include file="components/navbar.jsp" %>
        </header>
        <div class="page-container">
            <div class="admin-container">
                <h1>Welcome to the Admin Dashboard</h1>
                <div class="card-container">
                    <div class="card">
                        <a href="authors.jsp" style="text-decoration: none" ><h2>Authors</h2></a>
                        <p>Manage authors and their details.</p>
                    </div>
                    <div class="card">
                        <a href="books.jsp" style="text-decoration: none"><h2>Books</h2></a>
                        <p>Manage books and their information.</p>
                    </div>
                    <div class="card">
                        <a href="users.jsp" style="text-decoration: none"><h2>Users</h2></a>
                        <p>Manage user accounts and permissions.</p>
                    </div>
                    <div class="card">
                        <h2>Orders</h2>
                        <p>Manage and view customer orders.</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
