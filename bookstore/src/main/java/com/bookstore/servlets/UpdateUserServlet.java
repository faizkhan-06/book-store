
import com.bookstore.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html;charset=UTF-8");
        try{
            int userId = Integer.parseInt( req.getParameter("user_id") );
            String userName = req.getParameter("username");
            String userEmail = req.getParameter("email");
            String userType = req.getParameter("usertype");
            
            String hql = "UPDATE User SET userName = :userName, userEmail = :userEmail, userType = :userType WHERE userId = :userId";

            
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx= session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("userName", userName);
            query.setParameter("userEmail", userEmail);
            query.setParameter("userType", userType);
            query.setParameter("userId", userId);
            
            int rowCount = query.executeUpdate();
            tx.commit();
            
            resp.sendRedirect("users.jsp");
            return;
            
        
        
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}