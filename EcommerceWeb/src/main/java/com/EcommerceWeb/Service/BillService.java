package com.EcommerceWeb.Service;

import com.EcommerceWeb.DTO.BillDTO;
import com.EcommerceWeb.Entity.BillDetailEntity;
import com.EcommerceWeb.Entity.BillEntity;
import com.EcommerceWeb.Entity.UserEntity;

import java.util.List;

public interface BillService {
    BillEntity save(BillDTO bill, UserEntity user);
    List<BillDTO> findAll();
    BillEntity findById(Long id);
    BillEntity completeBill(BillDTO billDTO);
    BillDTO searchBill(String billCode);
}
