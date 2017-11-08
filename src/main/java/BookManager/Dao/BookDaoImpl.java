package BookManager.Dao;

import BookManager.Model.Book;

import BookManager.Model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.sql.Blob;
import java.util.List;



@Repository
public class BookDaoImpl implements BookDao
{
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }



    public void addBook(Book book)
    {
        Session session = this.sessionFactory.getCurrentSession();
        session.save(book);
               logger.info("Book successfully added. Book details: " + book);

    }

    public void updateBook(Book book)
    {
        Session session  = this.sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("Book successfully update. Book details: " + book);
    }

    public void removeBook(int id)
    {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book)session.load(Book.class, new Integer(id));

        if(book !=null) session.delete(book);

        logger.info("Book successfully removed. Book details " + book);
    }

    public Book getBookById(int id)
    {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book)session.load(Book.class, new Integer(id));
        logger.info("Book successfully loaded. Book details: " + book);

        return book;
    }

    @SuppressWarnings("uncheked")
    public List<Book> listBooks()
    {
        Session session = sessionFactory.getCurrentSession();
        List<Book>  bookList = session.createQuery("from BookManager.Model.Book").list();
        for(Book book : bookList)
        {
            logger.info("Book list: " + book);
        }
        return bookList;
    }

    public void addUser(User user, Book book)
    {

        Session session = sessionFactory.getCurrentSession();
        book.addUser(user);
        session.saveOrUpdate(book);

    }

}
