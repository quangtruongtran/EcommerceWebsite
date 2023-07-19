package com.EcommerceWeb.Converter;


import com.EcommerceWeb.DTO.UserDTO;
import com.EcommerceWeb.Entity.RoleEntity;
import com.EcommerceWeb.Entity.UserEntity;

public class UserConverter extends Converter{
    public static UserEntity DTOtoEntity(UserDTO userDTO) {
        UserEntity obj = new UserEntity();
        obj = modelMapper.map(userDTO, UserEntity.class);
        return obj;
    }

    public static UserDTO EntitytoDTO(UserEntity userEntity) {
        UserDTO obj = modelMapper.map(userEntity, UserDTO.class);
        for (RoleEntity item: userEntity.getRoles()) {
            obj.getRoleOfUser().add(item.getRoleName());
        }
        obj.setUserImage(userEntity.getUserImage());
        return obj;
    }
}
