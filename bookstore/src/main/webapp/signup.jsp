<%-- 
    Document   : signup
    Created on : 01-Oct-2023, 12:49:24 am
    Author     : FAIZKHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Page</title>
    <link rel="stylesheet" href="css/signup.css"/>

</head>
<body>
    <div class="signup-container">
        <h1>Sign Up</h1>
        <form action="SignupServlet" method="post">
            <input name="userName" type="text" placeholder="Username" required>
            <input name="userEmail" type="text" placeholder="Email" required>
            <input name="userPassword" type="password" placeholder="Password" required>
            <button type="submit">Sign Up</button>
        </form>
        <p>Already have an account? <a href="login.jsp">Log In</a></p>
        <!--message box-->
        <%@include file="components/message.jsp" %>
    </div>
</body>
</html>

