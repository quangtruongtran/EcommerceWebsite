package com.EcommerceWeb.Repository;

import com.EcommerceWeb.Entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<UserEntity, Long> {

    UserEntity findByUserName(String userName);
    UserEntity findByUserPassWord(String userPass);
    @Query(value = "Select * from user as u left join user_role as ur on u.id = ur.user_id where role_id = 2", nativeQuery = true)
    Page<UserEntity> findUser(Pageable pageable);
    @Query(value = "Select count(*) from user as u left join user_role as ur on u.id = ur.user_id where role_id = 2", nativeQuery = true)
    Integer getCount();
    UserEntity findByUserEmail(String userEmail);
    UserEntity findByResetPasswordToken(String token);
}
