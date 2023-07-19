package com.EcommerceWeb.Service.Impl;

import com.EcommerceWeb.Entity.CartItemEntity;
import com.EcommerceWeb.Repository.CartItemRepository;
import com.EcommerceWeb.Service.CartItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CartItemServiceImpl implements CartItemService {

    @Autowired
    private CartItemRepository cartItemRepository;

    @Override
    public CartItemEntity update(Long id, Integer quantity) {
        CartItemEntity cartItem = cartItemRepository.findById(id).get();
        cartItem.setCartQuantity(quantity);
        cartItem.setCartTotalPrice(CartServiceImpl.calculateTotalPrices(quantity, cartItem.getProduct().getProductPrice()));
        return cartItemRepository.save(cartItem);
    }
}
