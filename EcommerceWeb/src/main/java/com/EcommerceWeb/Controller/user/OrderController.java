package com.EcommerceWeb.Controller.user;

import com.EcommerceWeb.Converter.UserConverter;
import com.EcommerceWeb.DTO.BillDTO;
import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.Entity.BillEntity;
import com.EcommerceWeb.Entity.CartEntity;
import com.EcommerceWeb.Entity.UserEntity;
import com.EcommerceWeb.Service.BillService;
import com.EcommerceWeb.Service.CategoryService;
import com.EcommerceWeb.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private UserService userService;

    @Autowired
    private BillService billService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/order")
    public String checkOutView(Model model){
        String userName = SecurityContextHolder.getContext().getAuthentication().getName();
        UserEntity user = userService.findByUserName(userName);
        CartEntity cart = user.getCart();
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        if(cart == null){
            model.addAttribute("noCart","Bạn không có đơn đặt hàng nào!");
        } else {
            model.addAttribute("user", UserConverter.EntitytoDTO(user));
            model.addAttribute("cartItems", cart.getCartItems());
            model.addAttribute("subTotal", cart.getCartTotalPrice());
        }
        return "user/check_out";
    }

    @PostMapping("/order")
    public String placeOrder(Model model, BillDTO bill){
        String userName = SecurityContextHolder.getContext().getAuthentication().getName();
        UserEntity user = userService.findByUserName(userName);
        billService.save(bill,user);
        return "redirect:/order-detail";
    }

    @GetMapping("/order-detail")
    public String OrderView(Model model){
        String userName = SecurityContextHolder.getContext().getAuthentication().getName();
        UserEntity user = userService.findByUserName(userName);
        List<BillEntity> bills = user.getBills();
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        model.addAttribute("bills", bills);
        return "user/order";
    }
}
