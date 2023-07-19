package com.EcommerceWeb.Service;

import com.EcommerceWeb.Entity.ProductEntity;
import com.EcommerceWeb.Entity.UserEntity;

public interface CartService {

    Integer addToCart(Integer quantity, Long productId, UserEntity user);
    Integer updateCart(Integer quantity, Long productId, UserEntity user);
    Integer deleteItemInCart(Long id, UserEntity user);
}
