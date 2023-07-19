package com.EcommerceWeb.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "contact")
public class ContactEntity extends AbstractClass {

    @Column(name = "contact_customer_name")
    private String contactCustomerName;

    @Column(name = "contact_customer_phone")
    private String contactCustomerPhone;

    @Column(name = "contact_customer_email")
    private String contactCustomerEmail;

    @Column(name = "contact_subject")
    private String contactSubject;

    @Column(name = "contact_content", columnDefinition = "TEXT")
    private String contactContent;
}
