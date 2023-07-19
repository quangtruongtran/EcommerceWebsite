package com.EcommerceWeb.Service.Impl;

import com.EcommerceWeb.Converter.ContactConverter;
import com.EcommerceWeb.DTO.ContactDTO;
import com.EcommerceWeb.Entity.ContactEntity;
import com.EcommerceWeb.Repository.ContactRepository;
import com.EcommerceWeb.Service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ContactServiceImpl implements ContactService {

    @Autowired
    private ContactRepository contactRepository;

    @Override
    public ContactDTO save(ContactDTO contactDTO) {
        return ContactConverter.EntitytoDTO(contactRepository.save(ContactConverter.DTOtoEntity(contactDTO)));
    }

    @Override
    public List<ContactDTO> getAllContact() {
        List<ContactDTO> result = new ArrayList<>();
        for (ContactEntity item : contactRepository.findAll()) {
            result.add(ContactConverter.EntitytoDTO(item));
        }
        return result;
    }

    @Override
    public ContactDTO findById(Long id) {
        return ContactConverter.EntitytoDTO(contactRepository.getById(id));
    }
}
