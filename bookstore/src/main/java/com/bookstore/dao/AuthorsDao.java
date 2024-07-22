package com.bookstore.dao;

import com.bookstore.entites.Authors;
import com.bookstore.entites.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class AuthorsDao {

    private SessionFactory factory;

    public AuthorsDao(SessionFactory factory) {
        this.factory = factory;
    }

    //get author by id
    public Authors getAuthorsById(int aId) {
        Authors author = null;
        try {
            Session session = this.factory.openSession();
            author = session.get(Authors.class, aId);

            session.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return author;
    }

    //get all users
    public List<Authors> authorsList() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Authors");
        List<Authors> author = query.list();
        return author;
    }
}
