package BookManager.Dao;

import BookManager.Model.User;


import java.util.List;


public interface UserDao {

    void addUser(User User);

    void removeUser(int id);

    User getUserById(int id);

    List<User> listUser();
}
