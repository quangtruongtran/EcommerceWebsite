package com.EcommerceWeb.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "user", uniqueConstraints = @UniqueConstraint(columnNames = {"user_name"}))
public class UserEntity extends AbstractClass{

    @Column(name = "user_full_name")
    private String userFullName;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "user_password")
    private String userPassWord;

    @Column(name = "reset_password_token")
    private String resetPasswordToken;

    @Column(name = "user_email")
    private String userEmail;

    @Column(name = "user_address")
    private String userAddress;

    @Column(name = "user_phone")
    private String userPhone;

    @Column(name = "user_image")
    @Lob
    private String userImage;

    @Column(name = "user_image_name")
    private String userImageName;

    @OneToOne(mappedBy = "user", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    private CartEntity cart;

    @OneToMany(mappedBy = "user",cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
    private List<BillEntity> bills = new ArrayList<>();

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<RoleEntity> roles = new ArrayList<>();
}
