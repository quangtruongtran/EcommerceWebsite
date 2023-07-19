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
@Table(name = "bill_detail")
public class BillDetailEntity extends AbstractClass {

    @Column(name = "bill_detail_quantity")
    private Integer billDetailQuantity;

    @Column(name = "bill_detail_product_price")
    private BigDecimal billDetailProductPrice;

    @Column(name = "bill_detail_total_price")
    private BigDecimal billDetailTotalPrice;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinColumn(name = "bill_id")
    private BillEntity bill;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private ProductEntity product;
}
