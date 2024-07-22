package com.bookstore;

import com.bookstore.entites.Category;
import com.bookstore.helper.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class AddCategory {
    
    public static void main(String[] args) {
        Session session = FactoryProvider.getFactory().openSession();
        Transaction tx = null;
        
        try {
            tx = session.beginTransaction();
            
            // Create Category instances
            Category fictionBooks = new Category("Fiction Books");
            Category crimeAndMysteryBooks = new Category("Crime and Mystery Books");
            Category fantasyBooks = new Category("Fantasy Books");
            Category novelBooks = new Category("Novel Books");
            Category adventureBooks = new Category("Adventure Books");
            
            // Save Category instances to the database
            session.save(fictionBooks);
            session.save(crimeAndMysteryBooks);
            session.save(fantasyBooks);
            session.save(novelBooks);
            session.save(adventureBooks);
            
            // Commit the transaction to persist the changes
            tx.commit();
            
            System.out.println("Categories saved successfully.");
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
