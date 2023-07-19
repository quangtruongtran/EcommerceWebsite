package com.EcommerceWeb.Converter;

import com.EcommerceWeb.DTO.BillDTO;
import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Entity.BillEntity;
import com.EcommerceWeb.Entity.ProductEntity;

public class BillConverter extends Converter{
    public static BillEntity DTOtoEntity(BillDTO billDTO) {
        BillEntity obj = new BillEntity();
        obj = modelMapper.map(billDTO, BillEntity.class);
        return obj;
    }

    public static BillDTO EntitytoDTO(BillEntity billEntity) {
        BillDTO obj = modelMapper.map(billEntity, BillDTO.class);
        obj.setBillUserName(billEntity.getUser().getUserName());
        obj.setBillUserName(billEntity.getUser().getUserFullName());
        return obj;
    }
}
