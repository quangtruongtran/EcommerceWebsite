package com.EcommerceWeb.Service;

import com.EcommerceWeb.DTO.ContactDTO;

import java.util.List;

public interface ContactService {
    ContactDTO save(ContactDTO contactDTO);
    List<ContactDTO> getAllContact();
    ContactDTO findById(Long id);
}
