package com.EcommerceWeb.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "cartitem")
public class CartItemEntity extends AbstractClass {

    @Column(name = "cart_quantity")
    private Integer cartQuantity;

    @Column(name = "cart_total_price")
    private BigDecimal cartTotalPrice;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "cart_id")
    private CartEntity cart;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private ProductEntity product;


}
