<%-- 
    Document   : adminnav
    Created on : 01-Oct-2023, 5:12:31 pm
    Author     : FAIZKHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .admin-navbar {
            background-color: #333333;
            color: #ffffff;
            height: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .admin-logo h1 {
            font-size: 24px;
            margin: 0;
            padding: 0;
        }

        .admin-menu {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .admin-menu li {
            display: inline;
            margin-right: 20px;
        }

        .admin-menu a {
            text-decoration: none;
            color: #ffffff;
            font-weight: bold;
        }

        .admin-menu a:hover {
            border-bottom: 2px solid #ffffff;
        }
    </style>
</head>
<body>
    <div class="admin-navbar">
        <div class="admin-logo">
            <h1>Admin</h1>
        </div>
        <ul class="admin-menu">
            <li><a href="admin.jsp">Dashboard</a></li>
            <li><a href="#">Users</a></li>
            <li><a href="#">Orders</a></li>
            <li><a href="#">Settings</a></li>
        </ul>
    </div>
</body>
</html>
