package com.EcommerceWeb.Utils;

import com.EcommerceWeb.Entity.UserEntity;
import com.EcommerceWeb.Repository.UserRepository;
import com.EcommerceWeb.Security.MyUserDetails;
import com.EcommerceWeb.Service.Impl.UserServiceImpl;
import com.EcommerceWeb.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;

@Component
public class SecurityUtil {

    @Autowired
    private UserRepository userRepository;

    public Integer getCartQuantity(){
        UserEntity user = userRepository.findByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
       return user.getCart().getTotalCartItems();
    }
}
