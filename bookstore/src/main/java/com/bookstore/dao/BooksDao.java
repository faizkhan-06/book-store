package com.bookstore.dao;

import com.bookstore.entites.Books;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class BooksDao {

    private SessionFactory factory;

    public BooksDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveBooks(Books book) {
        boolean f = false;
        try {
            Session session = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            session.save(book);

            tx.commit();
            session.close();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;

    }

    

    //get all users
    public List<Books> booksList() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Books");
        List<Books> book = query.list();
        return book;
    }
}
