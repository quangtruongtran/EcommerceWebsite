package com.EcommerceWeb.Service;

import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Entity.ProductEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Set;

public interface ProductService {
    List<ProductDTO> findAll();
    ProductEntity save(MultipartFile imageProduct, ProductDTO productDTO);
    ProductEntity findByProductName(String productName);
    ProductDTO findById(Long id);
    void deleteProduct(Long id);
    void disableProduct(Long id);
    void enableProduct(Long id);
    void setHot(Long id);
    void cancelHotProduct(Long id);
    Page<ProductDTO> find(Integer page);
    Integer getTotalPage();
    Page<ProductDTO> searchProduct(String name, Pageable  pageable);
    Page<ProductDTO> getProductHot(Pageable pageable);
    Page<ProductDTO> findProductByCategory(Long categoryId,Pageable pageable);
    Set<ProductDTO> productFilter(Integer price, String branch, Long categoryId, Integer offset);
    Integer productFilterSize(Integer price, String branch, Long categoryId);
    List<ProductDTO> relatedProduct(String categoryCode, String branch);
}
