package com.fukai.installment.dao;

import com.fukai.installment.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 22:54
 */
public interface UserRepository extends JpaRepository<User, String> {

    User findByMobilePhoneAndPassword(String mobilePhone, String password);

    User findByMobilePhone(String mobilePhone);
}
