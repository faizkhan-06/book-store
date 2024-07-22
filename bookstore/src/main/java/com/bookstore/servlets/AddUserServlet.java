
package com.bookstore.servlets;

import com.bookstore.entites.User;
import com.bookstore.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException,IOException{
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        try {
            String userName = req.getParameter("username");
            String userEmail = req.getParameter("email");
            String userPassword = req.getParameter("password");
            String userType = req.getParameter("user-type");

            
            // Check if the email already exists in the database
            Session hibernateSession = FactoryProvider.getFactory().openSession();
            Transaction tx = hibernateSession.beginTransaction();
            User existingUser = (User) hibernateSession.createQuery("FROM User WHERE userEmail = :email")
                    .setParameter("email", userEmail)
                    .uniqueResult();

            if (existingUser != null) {
                // Email already exists, provide a message and return
                tx.rollback();
                hibernateSession.close();
                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("message", "Email already in use, please choose another.");
                resp.sendRedirect("adduser.jsp");
                return;
            }

            // Create a new user and save it to the database
            User user = new User(userName, userEmail, userPassword,userType);
            int userId = (int) hibernateSession.save(user);
            tx.commit();
            hibernateSession.close();

//            HttpSession httpSession = req.getSession();
//            httpSession.setAttribute("message", "User added !! ");
            resp.sendRedirect("users.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("message", "An error occurred while adding user. Please try again later.");
            resp.sendRedirect("adduser.jsp");
        }
    }
    
}
