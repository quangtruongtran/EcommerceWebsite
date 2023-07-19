package com.EcommerceWeb.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "product", uniqueConstraints = @UniqueConstraint(columnNames = "product_name"))
public class ProductEntity extends AbstractClass {
    @Column(name = "product_name")
    private String productName;

    @Column(name = "product_title")
    private String productTitle;

    @Column(name = "product_description", length = 500)
    private String productDescription;

    @Column(name = "product_detail", columnDefinition="TEXT")
    private String productDetail;

    @Column(name = "product_price")
    private BigDecimal productPrice;

    @Column(name = "product_quantity")
    private Integer productQuantity;

    @Column(name = "product_image_name")
    private String productImageName;

    @Column(name = "product_image")
    @Lob
    private String productImage;

    @Column(columnDefinition = "TINYINT(1)", name = "product_active")
    private Boolean productActive;

    @Column(columnDefinition = "TINYINT(1)", name = "product_hot")
    private Boolean productHot;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryEntity category;

    @OneToMany(mappedBy="product", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    private List<CartItemEntity> cartItems;

    @OneToMany(mappedBy="product", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    private List<BillDetailEntity> billDetails;

    @ManyToOne
    @JoinColumn(name = "branch_id")
    private BranchEntity branch;


}
