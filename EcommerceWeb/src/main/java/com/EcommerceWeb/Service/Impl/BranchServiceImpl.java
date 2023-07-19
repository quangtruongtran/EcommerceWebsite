package com.EcommerceWeb.Service.Impl;

import com.EcommerceWeb.Converter.BranchConverter;
import com.EcommerceWeb.Converter.CategoryConverter;
import com.EcommerceWeb.DTO.BranchDTO;
import com.EcommerceWeb.Entity.BranchEntity;
import com.EcommerceWeb.Entity.CategoryEntity;
import com.EcommerceWeb.Repository.BranchRepository;
import com.EcommerceWeb.Service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
@Service
@Transactional
public class BranchServiceImpl implements BranchService {
    @Autowired
    private BranchRepository branchRepository;
    @Override
    public List<BranchDTO> findAll() {
        List<BranchDTO> result = new ArrayList<>();
        for (BranchEntity branch:  branchRepository.findAll()) {
            result.add(BranchConverter.EntitytoDTO(branch));
        }
        return result;
    }
}
