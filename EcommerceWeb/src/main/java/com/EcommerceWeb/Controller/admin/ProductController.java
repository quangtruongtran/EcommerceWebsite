package com.EcommerceWeb.Controller.admin;

import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Service.BranchService;
import com.EcommerceWeb.Service.CategoryService;
import com.EcommerceWeb.Service.ProductService;
import com.EcommerceWeb.Utils.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/admin/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BranchService branchService;

    @GetMapping
    public String productView(Model model, @RequestParam(value = "page") Integer page){
        Page<ProductDTO> products = productService.find(page - 1);
        model.addAttribute("size", products.getSize());
        model.addAttribute("products", products.getContent());
        model.addAttribute("tolalPages",products.getTotalPages());
        model.addAttribute("page",page);
        return "admin/product/product";
    }

    @GetMapping("/add")
    public String addProductView(Model model){
        model.addAttribute("product", new ProductDTO());
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("branch", branchService.findAll());
        return "admin/product/add_product";
    }

    @PostMapping
    public String addOrUpdateProduct(RedirectAttributes attributes,@RequestParam(value = "productImage", required = false)
    MultipartFile image,
    ProductDTO productDTO){
        if(productDTO.getId() == null) {
            if (!Validate.ProductValidate(productDTO)) {
                attributes.addFlashAttribute("message", "Thêm hoặc cập nhập thất bại! Kiểm tra lại trường nhập!");
                return "redirect:/admin/product?page=1";
            }
            if (productService.findByProductName(productDTO.getProductName()) != null) {
                attributes.addFlashAttribute("message", "Thêm thất bại! Product đã tồn tại!");
                return "redirect:/admin/product?page=1";
            }
        } else {
            if (!Validate.ProductValidate(productDTO)) {
                attributes.addFlashAttribute("message", "Thêm hoặc cập nhập thất bại! Kiểm tra lại trường nhập!");
                return "redirect:/admin/product?page=1";
            }
        }
        productService.save(image, productDTO);
        return "redirect:/admin/product?page=1";
    }

    @GetMapping("/edit/{id}")
    public String updateProductView(Model model, @PathVariable Long id){
        model.addAttribute("product", productService.findById(id));
        model.addAttribute("categories", categoryService.findAll());
        model.addAttribute("branch", branchService.findAll());
        return "admin/product/add_product";
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable Long id){
        productService.deleteProduct(id);
        return "redirect:/admin/product?page=1";
    }

    @GetMapping("/disable/{id}")
    public String disableProduct(@PathVariable Long id){
        productService.disableProduct(id);
        return "redirect:/admin/product?page=1";
    }

    @GetMapping("/enable/{id}")
    public String enableProduct(@PathVariable Long id){
        productService.enableProduct(id);
        return "redirect:/admin/product?page=1";
    }

    @GetMapping("/hot/{id}")
    public String setHotProduct(@PathVariable Long id){
        productService.setHot(id);
        return "redirect:/admin/product?page=1";
    }

    @GetMapping("/cancelHot/{id}")
    public String cancelHotProduct(@PathVariable Long id){
        productService.cancelHotProduct(id);
        return "redirect:/admin/product?page=1";
    }

    @PostMapping("/search")
    public String searchProduct(@RequestParam(value = "param", required = true) String name,
                                @RequestParam(value = "page", required = true) Integer page,
                                Model model){
        Pageable pageable = PageRequest.of(page-1, 4);
        Page<ProductDTO> products =  productService.searchProduct(name, pageable);
        model.addAttribute("size", products.getSize());
        model.addAttribute("products", products.getContent());
        model.addAttribute("tolalPages",products.getTotalPages());
        model.addAttribute("page",page);
        model.addAttribute("search", "search");
        model.addAttribute("truong", name);
        return "admin/product/product";
    }

}
