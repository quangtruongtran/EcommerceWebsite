package com.EcommerceWeb.Converter;

import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.Entity.CategoryEntity;

public class CategoryConverter extends Converter{

    public static CategoryEntity DTOtoEntity(CategoryDTO categoryDTO) {
        CategoryEntity obj = new CategoryEntity();
        obj = modelMapper.map(categoryDTO, CategoryEntity.class);
        return obj;
    }

    public static CategoryDTO EntitytoDTO(CategoryEntity categoryEntity) {
        CategoryDTO obj = modelMapper.map(categoryEntity, CategoryDTO.class);
        return obj;
    }
}
