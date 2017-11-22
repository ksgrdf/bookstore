package BookManager.Dao;

import BookManager.Model.Book;
import BookManager.Model.User;

import java.util.List;

public interface BookDao {

    void addBook(Book book);

    void updateBook(Book book);

    void removeBook(int id);

    Book getBookById(int id);

    List<Book> listBooks();

    void addUser(User user, Book book);

    List<User> getUsersOrder();





}
