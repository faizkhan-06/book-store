
package com.bookstore.servlets;

import com.bookstore.dao.UserDao;
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

@WebServlet("/LoginServlet")
public class LoginServlet  extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        
        String userEmail = req.getParameter("userEmail");
        String userPassword = req.getParameter("userPassword");
        
        //authenticating user
        UserDao userDao = new UserDao(FactoryProvider.getFactory());
        User user=userDao.getUserByEmailAndPassword(userEmail, userPassword);
//        System.out.println(user);
        
        HttpSession httpSession = req.getSession();
        if(user == null){
            httpSession.setAttribute("message","Please Sign Up First");
            resp.sendRedirect("login.jsp");
            return;
        }else{
            out.println("welcome"+user.getUserName());
        }
        
        //login
        httpSession.setAttribute("current-user",user);
        if(user.getUserType().equals("admin")){
            //admin.jsp
            resp.sendRedirect("admin.jsp");
        }else if(user.getUserType().equals("normal")){
            //normal.jsp
            resp.sendRedirect("normal.jsp");
        }else{
            out.println("undefined user type");
        }
        
        

        
    }
    
}
