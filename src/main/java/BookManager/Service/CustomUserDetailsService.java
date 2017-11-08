package BookManager.Service;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import BookManager.Model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class CustomUserDetailsService
  implements UserDetailsService {
  private static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);


  @Autowired
  @Qualifier("userService")
  private UserService userService;


  public CustomUserDetailsService() {
  }

  @Transactional
  public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException { //check user login
    UserDetails userDetails = null;
    User user = userService.searchUser(s);

    userDetails = new org.springframework.security.core.userdetails.User(
            user.getUsername(),
            user.getPassword(),
            true,
            true,
            true,
            true,
            getAuthorities(user.getAccess()));

    return userDetails;
  }

  //access for user
  private Collection<GrantedAuthority> getAuthorities(Integer access) {

    List<GrantedAuthority> authList = new ArrayList(2);

    if (access.compareTo(1) == 0) {

      authList.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
    } else {
      authList.add(new SimpleGrantedAuthority("ROLE_USER"));
    }
    return authList;
  }
}


