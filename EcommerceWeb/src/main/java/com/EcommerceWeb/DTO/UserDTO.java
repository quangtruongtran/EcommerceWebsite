package com.EcommerceWeb.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private Long id;
    private String userName;
    private String userFullName;
    private String userPassWord;
    private String resetPasswordToken;
    private String userPassWordRepeat;
    private String userEmail;
    private String userAddress;
    private String userPhone;
    private String userImage;
    private List<String> roleOfUser = new ArrayList<>();
}
