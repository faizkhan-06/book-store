/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.bookstore.servlets;

import com.bookstore.entites.Books;
import com.bookstore.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author FAIZKHAN
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
      response.setContentType("text/html;charset=UTF-8");
        try{
            int bookId = Integer.parseInt(request.getParameter("book_id"));
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            Books book = (Books) s.get(Books.class, bookId);
            s.delete(book);
            tx.commit();
            response.sendRedirect("books.jsp");
            
        }catch(Exception e){
            e.printStackTrace();
        }  
        
    }
}
