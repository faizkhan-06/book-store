package com.bookstore.servlets;

import com.bookstore.entites.Authors;
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

@WebServlet("/AddAuthorServlet")
public class AddAuthorServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
         // Step 2: Modify your servlet code
        try {
            String authorName = req.getParameter("authorname");

            
            // Check if the email already exists in the database
            Session hibernateSession = FactoryProvider.getFactory().openSession();
            Transaction tx = hibernateSession.beginTransaction();
            Authors existingAuthor = (Authors) hibernateSession.createQuery("FROM Authors WHERE authorName = :name")
                    .setParameter("name", authorName)
                    .uniqueResult();

            if (existingAuthor != null) {
                // author already exists, provide a message and return
                tx.rollback();
                hibernateSession.close();
                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("message", "Author already existed !!");
                resp.sendRedirect("addauthor.jsp");
                return;
            }

            // Create a new user and save it to the database
            Authors author = new Authors(authorName);
            int authorId = (int) hibernateSession.save(author);
            tx.commit();
            hibernateSession.close();

//            HttpSession httpSession = req.getSession();
//            httpSession.setAttribute("message", "User added !! ");
            resp.sendRedirect("authors.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("message", "An error occurred while adding author. Please try again later.");
            resp.sendRedirect("addauthor.jsp");
        }
    }

}
