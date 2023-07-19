package com.EcommerceWeb.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "category", uniqueConstraints = @UniqueConstraint(columnNames = "category_code"))
public class CategoryEntity extends AbstractClass {

    @Column(name = "category_code")
    private String categoryCode;

    @Column(name = "category_name")
    private String categoryName;

    @Column(columnDefinition = "TINYINT(1)", name = "category_active")
    private Boolean categoryActive;

    @OneToMany(mappedBy="category", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    private List<ProductEntity> products;
}
