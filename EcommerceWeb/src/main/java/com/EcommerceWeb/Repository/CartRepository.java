package com.EcommerceWeb.Repository;

import com.EcommerceWeb.Entity.CartEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartRepository extends JpaRepository<CartEntity, Long> {
}
