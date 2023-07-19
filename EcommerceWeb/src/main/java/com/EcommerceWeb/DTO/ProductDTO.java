package com.EcommerceWeb.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.math.BigDecimal;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {

    private Long id;

    private String productName;

    private String productTitle;

    private String productDescription;

    private String productDetail;

    private BigDecimal productPrice;

    private String productImageName;

    private Integer productQuantity;

    private String image;

    private Boolean productActive;

    private Boolean productHot;

    private String categoryName;

    private String categoryCode;

    private String branchName;

    private String branchCode;
}
