package com.EcommerceWeb.DTO;

import com.EcommerceWeb.Entity.BillDetailEntity;
import com.EcommerceWeb.Entity.UserEntity;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BillDTO {
    private Long id;
    private String billCode;
    private Date billOrderDate;
    @DateTimeFormat(pattern= "yyyy-MM-dd")
    private Date billDeliveryDate;
    private BigDecimal billTotalPrice;
    private String billAddress;
    private Boolean billOrderStatus;
    private String billUserName;
    private String billUserFullName;
    private String billPhone;
}
