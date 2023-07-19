package com.EcommerceWeb.Repository;

import com.EcommerceWeb.Entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<RoleEntity, Long> {
    RoleEntity findByRoleCode(String roleCode);
}
