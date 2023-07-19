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
public class StatisticDTO {
    private Integer sales;
    private BigDecimal revenue;
    private Integer numberOfProducts;
    private Integer numberOfUsers;

}
