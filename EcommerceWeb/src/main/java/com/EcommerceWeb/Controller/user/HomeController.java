package com.EcommerceWeb.Controller.user;

import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Security.MyUserDetails;
import com.EcommerceWeb.Service.CategoryService;
import com.EcommerceWeb.Service.ProductService;
import com.EcommerceWeb.Utils.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private SecurityUtil securityUtil;

    @GetMapping
    public String home(
                       @RequestParam(value = "page", required = false) Integer page,
                       Model model){
        if(page == null){
            page = 1;
        }
        Pageable pageable = PageRequest.of(page-1, 8);
        Page<ProductDTO> products =  productService.getProductHot(pageable);
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        model.addAttribute("products",products.getContent());
        model.addAttribute("toltalPages",products.getTotalPages());
        model.addAttribute("page",page);
        return "user/home";
    }

    @GetMapping("/test")
    public void test(){
        MyUserDetails user = (MyUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println(user.getCartQuantity());
        System.out.println(securityUtil.getCartQuantity());
    }

}
