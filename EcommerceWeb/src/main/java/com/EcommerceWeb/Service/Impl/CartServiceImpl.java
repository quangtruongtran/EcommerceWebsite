package com.EcommerceWeb.Service.Impl;


import com.EcommerceWeb.Entity.CartEntity;
import com.EcommerceWeb.Entity.CartItemEntity;
import com.EcommerceWeb.Entity.ProductEntity;
import com.EcommerceWeb.Entity.UserEntity;
import com.EcommerceWeb.Repository.CartItemRepository;
import com.EcommerceWeb.Repository.CartRepository;
import com.EcommerceWeb.Repository.ProductRepository;
import com.EcommerceWeb.Repository.UserRepository;
import com.EcommerceWeb.Service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class CartServiceImpl implements CartService {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    @Override
    public Integer addToCart(Integer quantity, Long productId, UserEntity user) {

        CartEntity cart = user.getCart();
        if(cart == null){
            cart = new CartEntity();
        }
        ProductEntity product = productRepository.findById(productId).get();
        List<CartItemEntity> cartItems = cart.getCartItems();
        CartItemEntity cartItem = findItemInCartItems(cartItems,productId);
        if(cartItems.size() == 0){
            cartItems = new ArrayList<>();
            CartItemEntity cartItemNew = new CartItemEntity();
            cartItemNew.setCartQuantity(quantity);
            cartItemNew.setCartTotalPrice(calculateTotalPrices(quantity,product.getProductPrice()));
            cartItemNew.setProduct(product);
            cartItemNew.setCart(cart);
            cartItems.add(cartItemNew);
            cartItemRepository.save(cartItemNew);
        } else {
                if(cartItem != null){
                    cartItem.setCartQuantity(cartItem.getCartQuantity() + quantity);
                    cartItem.setCartTotalPrice(calculateTotalPrices(quantity,product.getProductPrice()).add(cartItem.getCartTotalPrice()));
                    cartItemRepository.save(cartItem);
            }
            else {
                    cartItem = new CartItemEntity();
                    cartItem.setCartQuantity(quantity);
                    cartItem.setCartTotalPrice(calculateTotalPrices(quantity,product.getProductPrice()));
                    cartItem.setProduct(product);
                    cartItem.setCart(cart);
                    cartItems.add(cartItem);
                    cartItemRepository.save(cartItem);
            }
        }
        cart.setTotalCartItems(getTotalCartItems(cartItems));
        cart.setCartTotalPrice(getCartTotalPrices(cartItems));
        cart.setUser(user);
        cartRepository.save(cart);
        return getTotalCartItems(cartItems);
    }

    @Override
    public Integer updateCart(Integer quantity, Long productId, UserEntity user) {
        if(productRepository.findById(productId).get().getProductQuantity() < quantity){
            return null;
        }
        CartEntity cart = user.getCart();
        ProductEntity product = productRepository.findById(productId).get();
        List<CartItemEntity> cartItems = cart.getCartItems();
        CartItemEntity cartItem = findItemInCartItems(cartItems,productId);
        cartItem.setCartQuantity(quantity);
        cartItem.setCartTotalPrice(calculateTotalPrices(quantity,product.getProductPrice()));
        cartItemRepository.save(cartItem);
        cart.setTotalCartItems(getTotalCartItems(cartItems));
        cart.setCartTotalPrice(getCartTotalPrices(cartItems));
        cartRepository.save(cart);
        return getTotalCartItems(cartItems);
    }

    @Override
    public Integer deleteItemInCart(Long id, UserEntity user) {
        CartEntity cart = user.getCart();
        ProductEntity product = productRepository.findById(id).get();
        List<CartItemEntity> cartItems = cart.getCartItems();
        cartItems.removeIf(item -> item.getProduct().getId() == id);
        if(cartItems.size() == 0){
            cartRepository.delete(cart);
            return 0;
        } else {
            cart.setCartItems(cartItems);
            cart.setTotalCartItems(getTotalCartItems(cartItems));
            cart.setCartTotalPrice(getCartTotalPrices(cartItems));
            cartRepository.save(cart);
            return getTotalCartItems(cartItems);
        }
    }


    public CartItemEntity findItemInCartItems(List<CartItemEntity> cartItems, Long productId){
        for (CartItemEntity item: cartItems) {
            if(item.getProduct().getId() == productId){
                return item;
            }
        }
        return null;
    }

    public static BigDecimal calculateTotalPrices(Integer quantity, BigDecimal price){
        BigDecimal cartQuantity = new BigDecimal(quantity);
        BigDecimal cartTotalPrices = price.multiply(cartQuantity);
        return cartTotalPrices;
    }

    public static Integer getTotalCartItems(List<CartItemEntity> cartItems){
        Integer total = 0;
        for (CartItemEntity item:cartItems) {
            total += item.getCartQuantity();
        }
        return total;
    }

    public BigDecimal getCartTotalPrices(List<CartItemEntity> cartItems){
        BigDecimal total = new BigDecimal("0");
        for (CartItemEntity item: cartItems) {
            total = total.add(item.getCartTotalPrice());
        }
        return total;
    }
}
