package com.fukai.installment.dao;

import com.fukai.installment.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 22:54
 */
public interface UserRepository extends JpaRepository<User, String> {

    User findByMobilePhoneAndPassword(String mobilePhone, String password);

    User findByMobilePhone(String mobilePhone);

    @Modifying
    @Transactional
    @Query(value = "update user set password = ?2 where id = ?1",nativeQuery = true)
    void updatePass(String userId, String newPass);
}
