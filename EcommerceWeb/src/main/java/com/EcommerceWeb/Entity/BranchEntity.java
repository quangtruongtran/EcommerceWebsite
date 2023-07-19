package com.EcommerceWeb.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "branch")
public class BranchEntity extends AbstractClass {

    @Column(name = "branch_code")
    private String branchCode;

    @Column(name = "branch_name")
    private String branchName;

    @OneToMany(mappedBy = "branch",cascade = {CascadeType.ALL}, fetch = FetchType.LAZY)
    private List<ProductEntity> products = new ArrayList<>();
}
