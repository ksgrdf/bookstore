package BookManager.Service;

import BookManager.Dao.UserDao;
import BookManager.Model.Book;
import BookManager.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class UserServiceImpl implements UserService
{
  @Autowired
  private UserDao userDao;

  @Autowired
  private BCryptPasswordEncoder bCryptPasswordEncoder;
  
  public UserServiceImpl() {}
  
  public void setUserDao(UserDao userDao)
  {
    this.userDao = userDao;
  }

  @Transactional
  public void addUser(User user)
  {
    user.setPassword(bCryptPasswordEncoder.encode(user.getPassword())); // encryption password SHA
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



  @Transactional
  public User searchUser(String username)
  {
    User user = null;
    for (User u : listUser())
    {

      if (u.getUsername().equals(username))
      {
        user = u;
      }
    }

    return user;
  }

  @Transactional
  public void addBook(Book book)
  {
    UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    User username = searchUser(userDetails.getUsername());
    userDao.addBook(username,book);
  }


}