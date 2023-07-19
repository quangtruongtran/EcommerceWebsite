package com.EcommerceWeb.Repository;

import com.EcommerceWeb.Entity.CartItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CartItemRepository extends JpaRepository<CartItemEntity, Long> {
}
