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
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/product")
public class UserProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @PostMapping("/filter")
    public String productFitler( @RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
                                      @RequestParam(value = "price", required = false) Integer price,
                                      @RequestParam("categoryId") Long categoryId,
                                      @RequestParam(value = "branch", required = false) String branch,
                                      Model model){
        int toltalPages =  (int)Math.ceil((double) (productService.productFilterSize(price, branch, categoryId)) /6);
        Set<ProductDTO> products = productService.productFilter(price, branch, categoryId, (page -1) * 6);
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        model.addAttribute("products",products);
        model.addAttribute("toltalPages",toltalPages);
        model.addAttribute("categoryId",categoryId);
        model.addAttribute("page",page);
        model.addAttribute("price",price);
        model.addAttribute("branch",branch);
        return "user/shop";
    }

    @GetMapping("/{id}")
    public String getDetail(Model model, @PathVariable("id") Long id){
        ProductDTO product = productService.findById(id);
        List<CategoryDTO> categories = categoryService.findAll();
        List<ProductDTO> relatedProducts =productService.relatedProduct(product.getCategoryCode(), product.getBranchCode());
        model.addAttribute("categories",categories);
        model.addAttribute("product",product);
        model.addAttribute("relatedProducts", relatedProducts);
        return "user/detail";
    }

    @PostMapping("/search")
    public String searchProduct(@RequestParam(value = "param", required = true) String name,
                                @RequestParam(value = "page", required = true) Integer page,
                                Model model){
        Pageable pageable = PageRequest.of(page-1, 6);
        Page<ProductDTO> products =  productService.searchProduct(name, pageable);
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("categories",categories);
        model.addAttribute("size", products.getSize());
        model.addAttribute("products", products.getContent());
        model.addAttribute("tolalPages",products.getTotalPages());
        model.addAttribute("page",page);
        model.addAttribute("search", "search");
        model.addAttribute("truong", name);
        return "user/shop";
    }
    @GetMapping("/test")
    public void test(){
        productService.relatedProduct("Laptop", "DELL");
    }
}
