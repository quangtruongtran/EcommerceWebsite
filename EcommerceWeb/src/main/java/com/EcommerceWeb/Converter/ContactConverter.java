package com.EcommerceWeb.Converter;

import com.EcommerceWeb.DTO.ContactDTO;
import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Entity.ContactEntity;
import com.EcommerceWeb.Entity.ProductEntity;

public class ContactConverter extends Converter{
    public static ContactEntity DTOtoEntity(ContactDTO contactDTO) {
        ContactEntity obj = new ContactEntity();
        obj = modelMapper.map(contactDTO, ContactEntity.class);
        return obj;
    }

    public static ContactDTO EntitytoDTO(ContactEntity contactEntity) {
        ContactDTO obj = modelMapper.map(contactEntity, ContactDTO.class);
        return obj;
    }
}
