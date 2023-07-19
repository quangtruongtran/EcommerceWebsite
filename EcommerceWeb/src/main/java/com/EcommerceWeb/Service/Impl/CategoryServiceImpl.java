package com.EcommerceWeb.Service.Impl;

import com.EcommerceWeb.Converter.CategoryConverter;
import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.Entity.CategoryEntity;
import com.EcommerceWeb.Repository.CategoryRepository;
import com.EcommerceWeb.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;
    @Override
    public List<CategoryDTO> findAll() {
        List<CategoryDTO> result = new ArrayList<>();
        for (CategoryEntity category:  categoryRepository.findAll()) {
            result.add(CategoryConverter.EntitytoDTO(category));
        }
        return result;
    }

    @Override
    public CategoryEntity addOrUpdateCategory(CategoryDTO categoryDTO) {
        if(categoryDTO.getId() == null){
            categoryDTO.setCategoryActive(true);
            return categoryRepository.save(CategoryConverter.DTOtoEntity(categoryDTO));
        } else {
            CategoryEntity category = categoryRepository.findById(categoryDTO.getId()).get();
            category.setCategoryName(categoryDTO.getCategoryName());
            category.setCategoryCode(categoryDTO.getCategoryCode());
            return categoryRepository.save(category);
        }
    }

    @Override
    public CategoryDTO findById(Long id) {
        return CategoryConverter.EntitytoDTO(categoryRepository.findById(id).get());
    }

    @Override
    public void deleteCategory(Long id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public void disableCategory(Long id) {
        CategoryEntity category = categoryRepository.findById(id).get();
        category.setCategoryActive(false);
        categoryRepository.save(category);
    }

    @Override
    public void enableCategory(Long id) {
        CategoryEntity category = categoryRepository.findById(id).get();
        category.setCategoryActive(true);
        categoryRepository.save(category);
    }

    @Override
    public CategoryEntity findByCategoryCode(String categoryCode) {
        return categoryRepository.findByCategoryCode(categoryCode);
    }


}
