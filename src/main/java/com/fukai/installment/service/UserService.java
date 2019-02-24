package com.fukai.installment.service;

import com.fukai.installment.bean.InstallmentEntity;
import com.fukai.installment.bean.InstallmentInfoEntity;
import com.fukai.installment.bean.User;

import java.util.List;
import java.util.Map;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 22:51
 */
public interface UserService {
    Map<String,Object> save(User user, InstallmentEntity installmentEntity) throws Exception;
    void deleteUser(User user);
    List<User> selectUserList();
    List<InstallmentInfoEntity> selectInstallmentInfoList(String installId);

    User findByMobilePhoneAndPassword(String mobilePhone, String password);
    Map<String,Object> editRepayState(String installmentInfoId,String state) throws Exception;
}
