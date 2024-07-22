
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

@WebServlet("/UpdateAuthorServlet")
public class UpdateAuthorServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        resp.setContentType("text/html;charset=UTF-8");
        try{
            int authorId = Integer.parseInt( req.getParameter("author_id") );
            String authorName = req.getParameter("authorName");
 
            
            String hql = "UPDATE Authors SET authorName = :authorName WHERE authorId = :authorId";

            
            Session session = FactoryProvider.getFactory().openSession();
            Transaction tx= session.beginTransaction();
            Query query = session.createQuery(hql);
            query.setParameter("authorName", authorName);
            query.setParameter("authorId", authorId);
            
            int rowCount = query.executeUpdate();
            tx.commit();
            
            resp.sendRedirect("authors.jsp");
            return;
            
        
        
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}