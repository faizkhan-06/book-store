
package com.bookstore.dao;

import com.bookstore.entites.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    //get user by email and password
    public User getUserByEmailAndPassword(String email,String pass){
        User user = null;
        
        try{
            String query="from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p", pass);
            user = (User)q.uniqueResult();
            
            session.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    
    //get all users
    public List<User> userList(){
        Session s = this.factory.openSession();
        Query query = s.createQuery("from User");
        List<User> user = query.list();
        return user;
    }
    
}
