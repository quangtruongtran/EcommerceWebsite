package com.EcommerceWeb.Service.Impl;

import com.EcommerceWeb.Converter.UserConverter;
import com.EcommerceWeb.DTO.UserDTO;
import com.EcommerceWeb.Entity.BillEntity;
import com.EcommerceWeb.Entity.UserEntity;
import com.EcommerceWeb.Repository.RoleRepository;
import com.EcommerceWeb.Repository.UserRepository;
import com.EcommerceWeb.Service.UserService;
import com.EcommerceWeb.Utils.GetRequestLink;
import com.EcommerceWeb.Utils.ImageUtil;
import net.bytebuddy.utility.RandomString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Base64;
import java.util.List;
import java.util.function.Function;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ImageUtil imageUtil;

    @Autowired
    private JavaMailSender javaMailSender;

    @Override
    public UserDTO save(MultipartFile image, UserDTO userDTO) {
        try {
            if (userDTO.getId() == null) {
                UserEntity user = UserConverter.DTOtoEntity(userDTO);
                for (String roleCode: userDTO.getRoleOfUser()) {
                    user.getRoles().add(roleRepository.findByRoleCode(roleCode));
                }
                user.setUserPassWord(passwordEncoder.encode(userDTO.getUserPassWord()));
                user.setUserImage("");
                user.setUserImageName("");
                return UserConverter.EntitytoDTO(userRepository.save(user));
            } else {
                UserEntity user = userRepository.findById(userDTO.getId()).get();
                user.setUserFullName(userDTO.getUserFullName());
                user.setUserName(userDTO.getUserName());
                user.setUserEmail(userDTO.getUserEmail());
                user.setUserAddress(userDTO.getUserAddress());
                user.setUserPhone(userDTO.getUserPhone());
                if (image.getOriginalFilename().isEmpty()) {
                    user.setUserImageName(user.getUserImageName());
                    user.setUserImage(user.getUserImage());
                } else {
                    imageUtil.deleteImage(user.getUserImageName());
                    user.setUserImageName(image.getOriginalFilename());
                    imageUtil.uploadImage(image);
                    user.setUserImage(Base64.getEncoder().encodeToString(image.getBytes()));
                }
                return UserConverter.EntitytoDTO(userRepository.save(user));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public UserEntity findByUserName(String userName) {
        return userRepository.findByUserName(userName);
    }


    @Override
    public UserEntity findByUserPassWord(String userPass) {
        return userRepository.findByUserPassWord(userPass);
    }

    @Override
    public BigDecimal toltalBillPrice(List<BillEntity> bills) {
        BigDecimal total = new BigDecimal(0);
        for (BillEntity bill: bills) {
            total = total.add(bill.getBillTotalPrice());
        }
        return total;
    }

    @Override
    public Page<UserDTO> findAllUsers(Pageable pageable) {
        Page<UserEntity> users = userRepository.findUser(pageable);
        Page<UserDTO> result = users.map(new Function<UserEntity, UserDTO>() {
            @Override
            public UserDTO apply(UserEntity entity) {
                UserDTO dto = UserConverter.EntitytoDTO(entity);
                return dto;
            }
        });
        return result;
    }

    @Override
    public UserEntity findById(Long id) {
        return userRepository.findById(id).get();
    }

    @Override
    public UserEntity findByUserEmail(String userEmail) {
        return userRepository.findByUserEmail(userEmail);
    }

    @Override
    public void createResetPassWordToken(String userEmail, HttpServletRequest request) throws MessagingException, UnsupportedEncodingException {
        String token = RandomString.make(50);
        UserEntity user =userRepository.findByUserEmail(userEmail);
        user.setResetPasswordToken(token);
        userRepository.save(user);
        String resetPasswordLink = GetRequestLink.getSiteURL(request) + "/reset_password?token=" + token;
        sendEmailWithLink(userEmail, resetPasswordLink);
    }

    @Override
    public void sendEmailWithLink(String email, String link) throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        helper.setFrom("contact@Ecommerce.com", "Ecommerce Support");
        helper.setTo(email);
        String subject = "Đổi mật khẩu EcommerceShop";

        String content = "Click vào link để đặt lại mật khẩu!"
                + "<p><a href=\"" + link + "\">Đổi mật khẩu</a></p>";

        helper.setSubject(subject);

        helper.setText(content, true);

        javaMailSender.send(message);
    }

    @Override
    public UserEntity findByResetPasswordToken(String token) {
        return userRepository.findByResetPasswordToken(token);
    }

    @Override
    public UserEntity changePass(String token, String pass) {
        UserEntity user = userRepository.findByResetPasswordToken(token);
        user.setUserPassWord(passwordEncoder.encode(pass));
        user.setResetPasswordToken(null);
        return userRepository.save(user);
    }
}
