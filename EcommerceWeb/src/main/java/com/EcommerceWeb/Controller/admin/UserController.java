package com.EcommerceWeb.Controller.admin;


import com.EcommerceWeb.Converter.UserConverter;
import com.EcommerceWeb.DTO.UserDTO;
import com.EcommerceWeb.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/user")
    public String userView(Model model, @RequestParam("page") Integer page){
        Pageable pageable = PageRequest.of(page - 1 , 6);
        Page<UserDTO> users = userService.findAllUsers(pageable);
        model.addAttribute("users", users.getContent());
        model.addAttribute("size", users.getSize());
        model.addAttribute("page", page);
        model.addAttribute("totalPages", users.getTotalPages());
        return "admin/user/user";
    }

    @GetMapping("/user/{id}")
    public String userDetail(Model model, @PathVariable("id") Long id){
        UserDTO user = UserConverter.EntitytoDTO(userService.findById(id));
        model.addAttribute("user", user);
        return "admin/user/user_detail";
    }
}
