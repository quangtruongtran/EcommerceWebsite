package com.EcommerceWeb.Converter;

import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Entity.ProductEntity;

public class ProductConverter extends Converter{
    public static ProductEntity DTOtoEntity(ProductDTO productDTO) {
        ProductEntity obj = new ProductEntity();
        obj = modelMapper.map(productDTO, ProductEntity.class);
        return obj;
    }

    public static ProductDTO EntitytoDTO(ProductEntity productEntity) {
        ProductDTO obj = modelMapper.map(productEntity, ProductDTO.class);
        obj.setImage(productEntity.getProductImage());
        obj.setCategoryName(productEntity.getCategory().getCategoryName());
        obj.setBranchName(productEntity.getBranch().getBranchName());
        return obj;
    }
}
