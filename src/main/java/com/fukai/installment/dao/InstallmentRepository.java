package com.fukai.installment.dao;

import com.fukai.installment.bean.InstallmentEntity;
import com.fukai.installment.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: niul
 * @Date: 2019-02-22
 */
public interface InstallmentRepository extends JpaRepository<InstallmentEntity, String> {
    InstallmentEntity findbyUserId(String userId);
}
