package com.bookstore.servlets;

import com.bookstore.dao.AuthorsDao;
import com.bookstore.dao.BooksDao;
import com.bookstore.dao.CategoryDao;
import com.bookstore.entites.Authors;
import com.bookstore.entites.Books;
import com.bookstore.entites.Category;
import com.bookstore.helper.FactoryProvider;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

@WebServlet("/AddBooksServlet")
@MultipartConfig
public class AddBooksServlet extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        // Step 2: Modify your servlet code
        try {
            String bookName = req.getParameter("book-name");
            String releaseDate = req.getParameter("release-date");
            float bookPrice = Float.parseFloat(req.getParameter("book-price"));
            int bookQuantity = Integer.parseInt(req.getParameter("book-quantity"));
            int categoryId = Integer.parseInt(req.getParameter("book-category"));
            int authorId = Integer.parseInt(req.getParameter("book-author"));
            Part part = req.getPart("book-image");

            Books book = new Books();
            book.setBookName(bookName);
            book.setReleaseDate(releaseDate);
            book.setBookPrice(bookPrice);
            book.setBookQuantity(bookQuantity);
            book.setBookImage(part.getSubmittedFileName());

            //get category by id
            CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
            Category category = cDao.getCategoryById(categoryId);
            book.setCategory(category);

            //get author by id 
            AuthorsDao aDao = new AuthorsDao(FactoryProvider.getFactory());
            Authors author = aDao.getAuthorsById(authorId);
            book.setAuthors(author);

            //product save
            BooksDao bDao = new BooksDao(FactoryProvider.getFactory());
            bDao.saveBooks(book);

            //image upload
            ServletContext context = getServletContext();
            String realPath = context.getRealPath("img") + File.separator + "books" + File.separator + part.getSubmittedFileName();
            try {

                FileOutputStream fos = new FileOutputStream(realPath);
                InputStream is = part.getInputStream();

                byte[] data = new byte[is.available()];
                is.read(data);

                fos.write(data);

                fos.close();
                
                resp.sendRedirect("books.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("message", "An error occurred while adding book. Please try again later.");
            resp.sendRedirect("addbooks.jsp");
        }
    }

}
