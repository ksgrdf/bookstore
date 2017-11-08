package BookManager.Service;

import BookManager.Model.Book;
import BookManager.Model.User;

import javax.transaction.Transactional;
import java.util.List;

public interface UserService {

    void addUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> listUser();

    User searchUser(String username);


    void addBook(Book book);
}
