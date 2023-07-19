package com.EcommerceWeb.Service;

import com.EcommerceWeb.DTO.UserDTO;
import com.EcommerceWeb.Entity.BillEntity;
import com.EcommerceWeb.Entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.List;

public interface UserService {
    UserDTO save(MultipartFile imageProduct, UserDTO userDTO);
    UserEntity findByUserName(String userName);
    UserEntity findByUserPassWord(String userPass);
    BigDecimal toltalBillPrice(List<BillEntity> bills);
    Page<UserDTO> findAllUsers(Pageable pageable);
    UserEntity findById(Long id);
    UserEntity findByUserEmail(String userEmail);
    void createResetPassWordToken(String userEmail, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException;
    void sendEmailWithLink(String email, String link) throws MessagingException, UnsupportedEncodingException;
    UserEntity findByResetPasswordToken(String token);
    UserEntity changePass(String token, String pass);


}
