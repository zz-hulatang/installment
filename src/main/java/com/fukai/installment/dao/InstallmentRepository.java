package com.fukai.installment.dao;

import com.fukai.installment.bean.InstallmentEntity;
import com.fukai.installment.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * @Author: niul
 * @Date: 2019-02-22
 */
public interface InstallmentRepository extends JpaRepository<InstallmentEntity, String> {
    InstallmentEntity findByUserId(String userId);
}
