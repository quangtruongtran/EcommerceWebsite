package com.EcommerceWeb.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ContactDTO {
    private Long id;

    private String contactCustomerName;

    private String contactCustomerPhone;

    private String contactCustomerEmail;

    private String contactSubject;

    private String contactContent;
}
