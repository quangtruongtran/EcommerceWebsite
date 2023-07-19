package com.EcommerceWeb.Repository;

import com.EcommerceWeb.Entity.BillEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BillRepository extends JpaRepository<BillEntity, Long> {
    BillEntity findByBillCode(String billCode);
    @Query(value = "SELECT * FROM ecommerce.bill where month(bill_order_date) = month(CURDATE())", nativeQuery = true)
    List<BillEntity> getAllBillInMonth();

}
