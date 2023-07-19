package com.EcommerceWeb.Controller.user;

import com.EcommerceWeb.Converter.UserConverter;
import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.DTO.UserDTO;
import com.EcommerceWeb.Entity.UserEntity;
import com.EcommerceWeb.Service.CategoryService;
import com.EcommerceWeb.Service.UserService;
import com.EcommerceWeb.Utils.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginView(Model model){
        return "user/login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerView(Model model){
        return "user/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(Model model, UserDTO userDTO, RedirectAttributes attributes){
        if(!Validate.UserValidate(userDTO)){
            attributes.addFlashAttribute("error", "Kiểm tra lại trường nhập!");
            return "redirect:/register";
        }
        if(!userDTO.getUserPassWord().equals(userDTO.getUserPassWordRepeat())){
            attributes.addFlashAttribute("error", "Mật khẩu không khớp!");
            return "redirect:/register";
        }
        if(userService.findByUserName(userDTO.getUserName()) != null){
            attributes.addFlashAttribute("error", "Tên người dùng đã tồn tại!");
            return "redirect:/register";
        }
        userDTO.getRoleOfUser().add("User");
        if(userService.save(null, userDTO) != null){
            attributes.addFlashAttribute("mess", "Đăng ký thành công!");
        }
        return "redirect:/login";
    }

    @GetMapping("/403")
    public String accessDenied(){
        return "user/accessDenied";
    }

    @GetMapping("/user-profile")
    public String userProfile(Model model){
        String userName = SecurityContextHolder.getContext().getAuthentication().getName();
        UserEntity user = userService.findByUserName(userName);
        model.addAttribute("user", UserConverter.EntitytoDTO(user));
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        return "user/user-profile";
    }

    @PostMapping("/user-update")
    public String userProfile(@RequestParam(value = "anh", required = false) MultipartFile image,
                              UserDTO userDTO, Model model){
        UserDTO user=  userService.save(image, userDTO);
        model.addAttribute("user", user);
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        return "user/user-profile";
    }

    @GetMapping("/forgot-password")
    public String forGotPassView(){
        return "user/forgot-password";
    }

    @PostMapping("/forgot-password")
    public String forGotPassWord(@RequestParam("email") String email, Model model, HttpServletRequest request){
        if(userService.findByUserEmail(email) == null){
            model.addAttribute("err", "Không tìm thấy email!");
            return "user/forgot-password";
        }
        else {
            try {
                userService.createResetPassWordToken(email , request);
                model.addAttribute("mess", "Link thay đổi mật khẩu đã được gửi đến email!");
            } catch (MessagingException e) {
                model.addAttribute("err", "Xảy ra lỗi!");
                return "user/forgot-password";
            } catch (UnsupportedEncodingException e) {
                model.addAttribute("err", "Xảy ra lỗi!");
                return "user/forgot-password";
            }
        }
        return "user/forgot-password";
    }

    @GetMapping("/reset_password")
    public String resetPassView(Model model, @RequestParam("token") String token){
        if(userService.findByResetPasswordToken(token) != null){
            model.addAttribute("token",token);
            return "user/reset_password";
        }
        else {
            model.addAttribute("err", "Link chuyển tiếp truy cấp xảy ra lỗi! Vui lòng thử lại!");
            return "user/forgot-password";
        }
    }

    @PostMapping("/reset_password")
    public String resetPass(RedirectAttributes attributes, @RequestParam("passWord") String passWord,
                            @RequestParam("repeatPassWord") String repeatPassWord,
                            @RequestParam("token") String token){
        if(!passWord.equals(repeatPassWord)){
            attributes.addFlashAttribute("err", "Nhập lại mật khẩu không trùng khớp! Vui lòng nhập lại!");
            attributes.addAttribute("token", token);
            return "redirect:/reset_password";
        }
        userService.changePass(token, passWord);
        attributes.addFlashAttribute("mess","Đặt lại mật khẩu thành công!");
        return "redirect:/login";
    }


}
