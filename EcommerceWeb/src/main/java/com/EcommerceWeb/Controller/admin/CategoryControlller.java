package com.EcommerceWeb.Controller.admin;

import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.Service.CategoryService;
import com.EcommerceWeb.Utils.Validate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/admin/category")
public class CategoryControlller {

    @Autowired
    private CategoryService categoryService;
    @GetMapping
    public String categoryView(Model model){
        List<CategoryDTO> categories = categoryService.findAll();
        model.addAttribute("size", categories.size());
        model.addAttribute("categories", categories);
        return "admin/category/category";
    }

    @GetMapping("/add")
    public String addCategoryView(Model model){
        model.addAttribute("category", new CategoryDTO());
        return "admin/category/add_category";
    }

    @PostMapping
    public String addOrUpdateCategory(RedirectAttributes attributes, CategoryDTO categoryDTO){
        if(categoryDTO.getId() == null){
            if(!Validate.CategoryValidate(categoryDTO)){
                attributes.addFlashAttribute("message", "Thêm hoặc cập nhập thất bại! Kiểm tra lại trường nhập!");
                return "redirect:/admin/category";
            }
            if(categoryService.findByCategoryCode(categoryDTO.getCategoryCode()) != null){
                attributes.addFlashAttribute("message", "Thêm hoặc cập nhập thất bại! Category đã tồn tại!");
                return "redirect:/admin/category";
            }
        }
       else {
            if(!Validate.CategoryValidate(categoryDTO)){
                attributes.addFlashAttribute("message", "Cập nhập thất bại! Kiểm tra lại trường nhập!");
                return "redirect:/admin/category";
            }
        }
        categoryService.addOrUpdateCategory(categoryDTO);
        return "redirect:/admin/category";
    }
    @GetMapping("/edit/{id}")
    public String updateCategoryView(Model model, @PathVariable Long id){
        model.addAttribute("category", categoryService.findById(id));
        return "admin/category/add_category";
    }

    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable Long id){
        categoryService.deleteCategory(id);
        return "redirect:/admin/category";
    }

    @GetMapping("/disable/{id}")
    public String disableCategory(@PathVariable Long id){
        categoryService.disableCategory(id);
        return "redirect:/admin/category";
    }

    @GetMapping("/enable/{id}")
    public String enableCategory(@PathVariable Long id){
        categoryService.enableCategory(id);
        return "redirect:/admin/category";
    }

}
