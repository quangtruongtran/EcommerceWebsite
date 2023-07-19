package com.EcommerceWeb.CustomRepository;

import com.EcommerceWeb.Converter.ProductConverter;
import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.Entity.ProductEntity;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository
public class ProductRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public StringBuilder buildJoinClause(String branch) {
        StringBuilder joinquery = new StringBuilder();
        if(branch!=null && !branch.isEmpty()) {
            joinquery.append(" left join branch as b on p.branch_id = b.id");
        }
        return joinquery;
    }

    public StringBuilder buildWhereClause(Integer priceFrom,  Integer priceTo, String branch) {
        StringBuilder joinquery = new StringBuilder(" where 1=1");
        if(priceFrom != null && priceTo != null) {
            joinquery.append(" and product_price between "+priceFrom+" and "+priceTo+"");
        }
        if(branch!=null && !branch.isEmpty()) {
            joinquery.append(" and branch_name = '"+branch+"'");
        }
        return joinquery;
    }

    public Set<ProductDTO> productFilter(Integer priceFrom, Integer priceTo, String branch, Long categoryId, Integer offset){
        Query query = entityManager.createNativeQuery("Select * from product as p" + buildJoinClause(branch)
                + buildWhereClause(priceFrom,priceTo,branch) + " and category_id = "+categoryId+" limit "+offset+",6 ", ProductEntity.class);
        List<ProductEntity> list = query.getResultList();
        Set<ProductDTO> result = new HashSet<>();
        for (ProductEntity product : list) {
            result.add(ProductConverter.EntitytoDTO(product));
        }
        return result;
    }

    public Integer productFilterSize(Integer priceFrom, Integer priceTo, String branch, Long categoryId){
        Query query = entityManager.createNativeQuery("Select * from product as p" + buildJoinClause(branch)
                + buildWhereClause(priceFrom,priceTo,branch) + " and category_id = "+categoryId+"", ProductEntity.class);
        List<ProductEntity> list = query.getResultList();
        return list.size();
    }
}
