package com.EcommerceWeb.Service;

import com.EcommerceWeb.Entity.CartItemEntity;

public interface CartItemService {
    CartItemEntity update(Long id, Integer quantity);
}
