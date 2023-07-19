package com.EcommerceWeb.Controller.admin;

import com.EcommerceWeb.DTO.ContactDTO;
import com.EcommerceWeb.Service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller(value = "contactControllerOfAdmin")
@RequestMapping("/admin")
public class ContactController {

    @Autowired
    private ContactService contactService;

    @GetMapping("/contact")
    public String contactView(Model model){
        List<ContactDTO> contacts = contactService.getAllContact();
        model.addAttribute("contacts", contacts);
        model.addAttribute("size", contacts.size());
        return "admin/contact/contact";
    }

    @GetMapping("/contact/{id}")
    public String getContactDetail(Model model, @PathVariable("id") Long id){
        ContactDTO contact = contactService.findById(id);
        model.addAttribute("contact", contact);
        return "admin/contact/contact_detail";
    }
}
