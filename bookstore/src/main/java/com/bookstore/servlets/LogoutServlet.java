
package com.bookstore.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet{
    public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        HttpSession httpSession = req.getSession();
        httpSession.removeAttribute("current-user");
        resp.sendRedirect("index.jsp");
    }
}
