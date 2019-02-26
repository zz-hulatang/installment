package com.fukai.installment.dao;

import com.fukai.installment.bean.InstallmentInfoEntity;
import com.fukai.installment.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @Author: niul
 * @Date: 2019-02-22
 */
public interface InstallmentInfoRepository extends JpaRepository<InstallmentInfoEntity, String> {

    List<InstallmentInfoEntity> findByInstallIdOrderByRepayTimeAsc(String installId);
}
