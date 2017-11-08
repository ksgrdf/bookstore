package BookManager.Service;

import BookManager.Dao.BookDao;
import BookManager.Model.Book;
import BookManager.Model.User;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    private BookDao bookDao;

    public void setBookDao(BookDao bookDao)
    {
        this.bookDao = bookDao;
    }

    @Transactional
    public void addBook(Book book)
    {
        this.bookDao.addBook(book);
    }
    @Transactional
    public void updateBook(Book book)
    {
        this.bookDao.updateBook(book);
    }
    @Transactional
    public void removeBook(int id)
    {
        this.bookDao.removeBook(id);
    }
    @Transactional
    public Book getBookById(int id)
    {
        return this.bookDao.getBookById(id);
    }
    @Transactional
    public List<Book> listBooks()
    {
        return this.bookDao.listBooks();
    }

    @Transactional
    public void addUser(User user, Book book)
    {
        bookDao.addUser(user,book);
    }

}
