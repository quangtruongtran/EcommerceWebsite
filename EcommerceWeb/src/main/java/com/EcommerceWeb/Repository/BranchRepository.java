package com.EcommerceWeb.Repository;

import com.EcommerceWeb.Entity.BranchEntity;
import com.EcommerceWeb.Entity.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BranchRepository extends JpaRepository<BranchEntity, Long> {
    BranchEntity findByBranchCode(String branchCode);
}
