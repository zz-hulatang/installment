package com.fukai.installment.dao;

import com.fukai.installment.bean.InstallmentInfoEntity;
import com.fukai.installment.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Author: niul
 * @Date: 2019-02-22
 */
public interface InstallmentInfoRepository extends JpaRepository<InstallmentInfoEntity, String> {

    List<InstallmentInfoEntity> findByInstallIdOrderByRepayTimeAsc(String installId);

    @Modifying
    @Transactional
    @Query(value = "delete from installmentInfo where installId = ?1",nativeQuery = true)
    void deleteByInstallId(String infoId);

    @Modifying
    @Transactional
    @Query(value = "update installmentInfo set repayState = 1 where repayState = 0 and repayTime < SYSDATE()",nativeQuery = true)
    void repayStateJob();
}
