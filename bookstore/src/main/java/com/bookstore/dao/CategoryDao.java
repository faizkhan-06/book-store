package com.bookstore.dao;

import com.bookstore.entites.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //get category by id
    public Category getCategoryById(int cId){
        Category category = null;
        try {
            Session session = this.factory.openSession();
            category = session.get(Category.class, cId);
            
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return category;
    }


    //get all users
    public List<Category> categoryList(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> category = query.list();
        return category;
    }
}
