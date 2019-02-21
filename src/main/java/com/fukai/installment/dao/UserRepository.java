package com.fukai.installment.dao;

import com.fukai.installment.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 22:54
 */
public interface UserRepository extends JpaRepository<User, String> {

}
