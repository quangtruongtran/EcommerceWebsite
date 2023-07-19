package com.EcommerceWeb.Service.Impl;

import com.EcommerceWeb.Converter.ProductConverter;
import com.EcommerceWeb.CustomRepository.ProductRepositoryCustom;
import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Entity.CategoryEntity;
import com.EcommerceWeb.Entity.ProductEntity;
import com.EcommerceWeb.Repository.BranchRepository;
import com.EcommerceWeb.Repository.CategoryRepository;
import com.EcommerceWeb.Repository.ProductRepository;
import com.EcommerceWeb.Service.ProductService;
import com.EcommerceWeb.Utils.ImageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.data.domain.Pageable;


import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Set;
import java.util.function.Function;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private BranchRepository branchRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    @Autowired
    private ProductRepositoryCustom productRepositoryCustom;

    @Autowired
    private ImageUtil imageUtil;
    @Override
    public List<ProductDTO> findAll() {
        List<ProductDTO> result = new ArrayList<>();
        for (ProductEntity item: productRepository.findAll()) {
            result.add(ProductConverter.EntitytoDTO(item));
        }
        return result;
    }

    @Override
    public ProductEntity save(MultipartFile image, ProductDTO productDTO) {
  try {
      if(productDTO.getId() == null){
          ProductEntity product = ProductConverter.DTOtoEntity(productDTO);


          if(image.getOriginalFilename().isEmpty()){
              product.setProductImage(null);
          }
          else {
              product.setProductImageName(image.getOriginalFilename());
              imageUtil.uploadImage(image);
              product.setProductImage(Base64.getEncoder().encodeToString(image.getBytes()));
          }

          product.setProductActive(true);
          product.setProductHot(true);
          product.setCategory(categoryRepository.findByCategoryCode(productDTO.getCategoryCode()));
          product.setBranch(branchRepository.findByBranchCode(productDTO.getBranchCode()));
          return productRepository.save(product);
      } else {
          ProductEntity product = productRepository.findById(productDTO.getId()).get();
          product.setProductName(productDTO.getProductName());
          product.setProductTitle(productDTO.getProductTitle());
          product.setProductDescription(productDTO.getProductDescription());
          product.setProductDetail(productDTO.getProductDetail());
          product.setProductPrice(productDTO.getProductPrice().stripTrailingZeros());
          product.setProductQuantity(productDTO.getProductQuantity());
          product.setProductActive(product.getProductActive());
          product.setProductHot(product.getProductHot());
          product.setCategory(categoryRepository.findByCategoryCode(productDTO.getCategoryCode()));
          product.setBranch(branchRepository.findByBranchCode(productDTO.getBranchCode()));
          if(image.getOriginalFilename().isEmpty()){
              product.setProductImageName(product.getProductImageName());
              product.setProductImage(product.getProductImage());
          }
          else {
              imageUtil.deleteImage(product.getProductImageName());
              product.setProductImageName(image.getOriginalFilename());
              imageUtil.uploadImage(image);
              product.setProductImage(Base64.getEncoder().encodeToString(image.getBytes()));
          }
          return productRepository.save(product);
      }
  } catch (Exception e){
      System.out.println(e.getMessage());
      return null;
  }
    }

    @Override
    public ProductEntity findByProductName(String productName) {
        return productRepository.findByProductName(productName);
    }

    @Override
    public ProductDTO findById(Long id) {
        return ProductConverter.EntitytoDTO(productRepository.findById(id).get());
    }

    @Override
    public void deleteProduct(Long id) {
        ProductEntity product = productRepository.findById(id).get();
        imageUtil.deleteImage(product.getProductImageName());
        productRepository.deleteById(id);
    }

    @Override
    public void disableProduct(Long id) {
        ProductEntity product = productRepository.findById(id).get();
        product.setProductActive(false);
        productRepository.save(product);
    }

    @Override
    public void enableProduct(Long id) {
        ProductEntity product = productRepository.findById(id).get();
        product.setProductActive(true);
        productRepository.save(product);
    }

    @Override
    public void setHot(Long id) {
        ProductEntity product = productRepository.findById(id).get();
        product.setProductHot(true);
        productRepository.save(product);
    }

    @Override
    public void cancelHotProduct(Long id) {
        ProductEntity product = productRepository.findById(id).get();
        product.setProductHot(false);
        productRepository.save(product);
    }

    @Override
    public Page<ProductDTO> find(Integer page) {

        Pageable pageable = PageRequest.of(page, 4);
        Page<ProductEntity> products = productRepository.findAll(pageable);
        Page<ProductDTO> result = products.map(new Function<ProductEntity, ProductDTO>() {
            @Override
            public ProductDTO apply(ProductEntity entity) {
                ProductDTO dto = ProductConverter.EntitytoDTO(entity);
                return dto;
            }
        });
        return result;
    }

    @Override
    public Integer getTotalPage() {
        return ((productRepository.findAll().size())/5) + 1;
    }

    @Override
    public Page<ProductDTO> searchProduct(String name, Pageable pageable) {
        Page<ProductEntity> entities = productRepository.searchProduct(name,pageable);
        Page<ProductDTO> result = entities.map(new Function<ProductEntity, ProductDTO>() {
            @Override
            public ProductDTO apply(ProductEntity entity) {
                ProductDTO dto = ProductConverter.EntitytoDTO(entity);
                return dto;
            }
        });
        return result;
    }

    @Override
    public Page<ProductDTO> getProductHot(Pageable pageable) {
        Page<ProductEntity> entities = productRepository.getProductHot(pageable);
        Page<ProductDTO> result = entities.map(new Function<ProductEntity, ProductDTO>() {
            @Override
            public ProductDTO apply(ProductEntity entity) {
                ProductDTO dto = ProductConverter.EntitytoDTO(entity);
                return dto;
            }
        });
        return result;
    }

    @Override
    public Page<ProductDTO> findProductByCategory(Long categoryId, Pageable pageable) {
        Page<ProductEntity> entities = productRepository.findProductByCategory(categoryId,pageable);
        Page<ProductDTO> result = entities.map(new Function<ProductEntity, ProductDTO>() {
            @Override
            public ProductDTO apply(ProductEntity entity) {
                ProductDTO dto = ProductConverter.EntitytoDTO(entity);
                return dto;
            }
        });
        return result;
    }

    @Override
    public Set<ProductDTO> productFilter(Integer price, String branch, Long categoryId, Integer offset) {
        Set<ProductDTO> results = null;
        if(price != null){
            if(price == 1){
                results = productRepositoryCustom.productFilter(0, 5000000, branch, categoryId, offset);
            } else if(price == 2){
                results = productRepositoryCustom.productFilter(5000000, 10000000, branch, categoryId, offset);
            } else if(price == 3){
                results = productRepositoryCustom.productFilter(10000000, 15000000, branch, categoryId, offset);
            }else if(price == 4){
                results = productRepositoryCustom.productFilter(15000000, 20000000, branch, categoryId, offset);
            }else if(price == 5){
                results = productRepositoryCustom.productFilter(20000000, 25000000, branch, categoryId, offset);
            }else{
                results = productRepositoryCustom.productFilter(25000000, 30000000, branch, categoryId, offset);
            }
        } else {
            results = productRepositoryCustom.productFilter(null, null, branch, categoryId, offset);
        }
        return results;
    }

    @Override
    public Integer productFilterSize(Integer price, String branch, Long categoryId) {
        Integer results;
        if(price != null){
            if(price == 1){
                results = productRepositoryCustom.productFilterSize(0, 5000000, branch, categoryId);
            } else if(price == 2){
                results = productRepositoryCustom.productFilterSize(5000000, 10000000, branch, categoryId);
            } else if(price == 3){
                results = productRepositoryCustom.productFilterSize(10000000, 15000000, branch, categoryId);
            }else if(price == 4){
                results = productRepositoryCustom.productFilterSize(15000000, 20000000, branch, categoryId);
            }else if(price == 5){
                results = productRepositoryCustom.productFilterSize(20000000, 25000000, branch, categoryId);
            }else{
                results = productRepositoryCustom.productFilterSize(25000000, 30000000, branch, categoryId);
            }
        } else {
            results = productRepositoryCustom.productFilterSize(null, null, branch, categoryId);
        }

        return results;
    }

    @Override
    public List<ProductDTO> relatedProduct(String categoryCode, String branch) {
        List<ProductDTO> result = new ArrayList<>();
        for (ProductEntity item : productRepository.relatedProduct(categoryCode, branch)) {
            result.add(ProductConverter.EntitytoDTO(item));
        }
        return result;
    }

}

