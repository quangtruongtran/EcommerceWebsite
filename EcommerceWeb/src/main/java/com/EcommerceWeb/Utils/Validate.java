package com.EcommerceWeb.Utils;

import com.EcommerceWeb.DTO.CategoryDTO;
import com.EcommerceWeb.DTO.ProductDTO;
import com.EcommerceWeb.DTO.UserDTO;

public class Validate {
    public static boolean CategoryValidate(CategoryDTO categoryDTO){
        if(categoryDTO.getCategoryCode().isEmpty() || categoryDTO.getCategoryName().isEmpty()){
            return false;
        }
        return true;
    }

    public static boolean ProductValidate(ProductDTO productDTO){
        if(productDTO.getProductName().isEmpty() || productDTO.getCategoryCode().isEmpty() || productDTO.getBranchCode().isEmpty()){
            return false;
        }
        return true;
    }

    public static boolean UserValidate(UserDTO userDTO){
        if(userDTO.getUserName().isEmpty() || userDTO.getUserPassWord().isEmpty() || userDTO.getUserPassWordRepeat().isEmpty()
        || userDTO.getUserEmail().isEmpty() || userDTO.getUserPhone().isEmpty()
        ){
            return false;
        }
        return true;
    }
}
