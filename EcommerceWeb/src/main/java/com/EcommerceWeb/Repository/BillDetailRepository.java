package com.EcommerceWeb.Repository;

import com.EcommerceWeb.Entity.BillDetailEntity;
import com.EcommerceWeb.Entity.BillEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface BillDetailRepository extends JpaRepository<BillDetailEntity, Long> {
}
