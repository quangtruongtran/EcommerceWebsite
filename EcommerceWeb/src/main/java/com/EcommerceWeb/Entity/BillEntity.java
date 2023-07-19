package com.EcommerceWeb.Entity;

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
@Entity
@Table(name = "bill", uniqueConstraints = @UniqueConstraint(columnNames = "bill_code"))
public class BillEntity extends AbstractClass{

    @Column(name = "bill_code")
    private String billCode;

    @Column(name = "bill_order_date")
    private Date billOrderDate;

    @Column(columnDefinition = "DATE")
    @Temporal(TemporalType.DATE)
//    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date billDeliveryDate;

    @Column(name = "bill_total_price")
    private BigDecimal billTotalPrice;

    @Column(name = "bill_address")
    private String billAddress;

    @Column(name = "bill_phone")
    private String billPhone;


    @Column(columnDefinition = "TINYINT(1)", name = "bill_order_status")
    private Boolean billOrderStatus;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private UserEntity user;

    @OneToMany(mappedBy = "bill",cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
    private List<BillDetailEntity> billDetails = new ArrayList<>();

}
