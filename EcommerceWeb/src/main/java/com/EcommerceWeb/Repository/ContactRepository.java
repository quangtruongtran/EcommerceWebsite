package com.EcommerceWeb.Repository;

import com.EcommerceWeb.Entity.ContactEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ContactRepository extends JpaRepository<ContactEntity, Long> {
}
