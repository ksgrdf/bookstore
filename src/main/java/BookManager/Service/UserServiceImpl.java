package BookManager.Service;

import BookManager.Dao.UserDao;
import BookManager.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class UserServiceImpl implements UserService
{
  @Autowired
  private UserDao userDao;
  
  public UserServiceImpl() {}
  
  public void setUserDao(UserDao userDao)
  {
    this.userDao = userDao;
  }

  @Transactional
  public void addUser(User user)
  {
    userDao.addUser(user);
  }
  
  @Transactional
  public void removeUser(int id)
  {
    userDao.removeUser(id);
  }
  
  @Transactional
  public User getUserById(int id)
  {
    return userDao.getUserById(id);
  }
  

  @Transactional
  public List<User> listUser()
  {
    return userDao.listUser();
  }
  



  public User searchUser(String username)
  {
    User user = null;
    for (User u : listUser())
    {

      if (u.getUsername().equals(username))
      {
        //System.out.println(u);
        user = u;
      }
    }
    

    return user;
  }
}