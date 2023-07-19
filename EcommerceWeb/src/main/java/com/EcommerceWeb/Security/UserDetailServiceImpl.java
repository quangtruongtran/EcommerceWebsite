package com.EcommerceWeb.Security;

import com.EcommerceWeb.Entity.CartItemEntity;
import com.EcommerceWeb.Entity.UserEntity;
import com.EcommerceWeb.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class UserDetailServiceImpl implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity user = userRepository.findByUserName(username);

        if (user == null) {
            throw new UsernameNotFoundException("Could not find user");
        }
        MyUserDetails myUserDetails = new MyUserDetails(user);
        myUserDetails.setId(user.getId());
        myUserDetails.setFullName(user.getUserFullName());
        if(user.getCart() != null){
            myUserDetails.setCartQuantity(user.getCart().getTotalCartItems());
        }
        else {
            myUserDetails.setCartQuantity(0);
        }
        return myUserDetails;
    }
}
