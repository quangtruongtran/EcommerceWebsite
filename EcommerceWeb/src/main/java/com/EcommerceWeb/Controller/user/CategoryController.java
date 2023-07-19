package com.EcommerceWeb.Controller.user;


import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Service.CategoryService;
import com.EcommerceWeb.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping
    public String categoryView(@RequestParam(value = "page", required = false) Integer page,
                               @RequestParam(value = "categoryId", required = false) Long categoryId,
                               Model model){
        if(page == null){
            page = 1;
        }
        Pageable pageable = PageRequest.of(page-1, 6);
        Page<ProductDTO> products = productService.findProductByCategory(categoryId, pageable);
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        model.addAttribute("products",products.getContent());
        model.addAttribute("toltalPages",products.getTotalPages());
        model.addAttribute("categoryId",categoryId);
        model.addAttribute("page",page);
        model.addAttribute("category","category");
        return "user/shop";
    }
}
