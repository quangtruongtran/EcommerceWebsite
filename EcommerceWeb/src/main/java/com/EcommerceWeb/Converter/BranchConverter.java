package com.EcommerceWeb.Converter;

import com.EcommerceWeb.DTO.BranchDTO;
import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.Entity.BranchEntity;
import com.EcommerceWeb.Entity.CategoryEntity;

public class BranchConverter extends Converter {
    public static BranchEntity DTOtoEntity(BranchDTO branchDTO) {
        BranchEntity obj = new BranchEntity();
        obj = modelMapper.map(branchDTO, BranchEntity.class);
        return obj;
    }

    public static BranchDTO EntitytoDTO(BranchEntity branchEntity) {
        BranchDTO obj = modelMapper.map(branchEntity, BranchDTO.class);
        return obj;
    }
}
