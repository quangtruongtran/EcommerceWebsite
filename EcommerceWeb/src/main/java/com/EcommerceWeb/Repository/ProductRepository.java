package com.EcommerceWeb.Repository;

import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Entity.ProductEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
    ProductEntity findByProductName(String productName);

    @Query(value = "Select * from product where product_name like %:param1%", nativeQuery = true,
            countQuery = "Select * from product where product_name like %:param1%")
    Page<ProductEntity> searchProduct(@Param("param1") String name, Pageable pageable);

    @Query(value = "Select * from product where product_hot=TRUE",
            countQuery = "Select * from product where product_hot=TRUE" ,nativeQuery = true)
    Page<ProductEntity> getProductHot(Pageable pageable);

    @Query(value = "Select * from product where category_id = ?1",
            countQuery = "Select * from product where category_id = ?1" ,nativeQuery = true)
    Page<ProductEntity> findProductByCategory(Long categoryId,Pageable pageable);

    @Query(value = "Select * from product as p left join category as c on p.category_id = c.id left join branch as b" +
            " on p.branch_id = b.id where category_code = ?1 and branch_code = ?2 ", nativeQuery = true)
    List<ProductEntity> relatedProduct(String categoryCode, String branch);
}
