package com.EcommerceWeb.Controller.user;

import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.DTO.ContactDTO;
import com.EcommerceWeb.Service.CategoryService;
import com.EcommerceWeb.Service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/contact")
    public String contactView(Model model){
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        return "user/contact";
    }

    @PostMapping("/contact")
    public String contact(RedirectAttributes attributes, ContactDTO contactDTO){
        contactService.save(contactDTO);
        attributes.addFlashAttribute("mess", "Thêm phản hồi thành công!");
        return "redirect:/contact";
    }
}
