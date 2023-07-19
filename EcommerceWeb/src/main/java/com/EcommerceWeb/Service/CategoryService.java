package com.EcommerceWeb.Service;

import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.Entity.CategoryEntity;

import java.util.List;

public interface CategoryService {
    List<CategoryDTO> findAll();
    CategoryEntity addOrUpdateCategory(CategoryDTO categoryDTO);
    CategoryDTO findById(Long id);
    void deleteCategory(Long id);
    void disableCategory(Long id);
    void enableCategory(Long id);
    CategoryEntity findByCategoryCode(String categoryCode);
}
