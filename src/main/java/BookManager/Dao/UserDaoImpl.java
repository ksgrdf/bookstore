package BookManager.Dao;
import BookManager.Model.User;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao
{
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);
    private SessionFactory sessionFactory;

    public UserDaoImpl() {}

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    public void addUser(User user)
    {
        Session session = sessionFactory.getCurrentSession();
        session.persist(user);
        logger.info("User successfully added. User details: " + user);
    }

    public void removeUser(int id)
    {
        Session session = sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, new Integer(id));

        if (user != null) { session.delete(user);
        }
        logger.info("User successfully removed. User details " + user);
    }

    public User getUserById(int id)
    {
        Session session = sessionFactory.getCurrentSession();
        User user = (User)session.load(User.class, new Integer(id));
        logger.info("User successfully loaded. User details: " + user);

        return user;
    }

    public List<User> listUser()
    {
        Session session = sessionFactory.getCurrentSession();
        List<User> userList = session.createQuery("from BookManager.Model.User").list();
        for (User user : userList)
        {
           logger.info("User list: " + user);
        }

        return userList;
    }
}