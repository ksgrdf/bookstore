package BookManager.Service;

import BookManager.Model.User;

import java.util.List;

public interface UserService {

    void addUser(User user);

    void removeUser(int id);

    User getUserById(int id);

    List<User> listUser();

    User searchUser(String username);
}
