package com.fukai.installment.service;

import com.fukai.installment.bean.InstallmentEntity;
import com.fukai.installment.bean.InstallmentInfoEntity;
import com.fukai.installment.bean.User;
import com.fukai.installment.bean.pojo.UserList;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 22:51
 */
public interface UserService {
    Map<String,Object> save(User user, InstallmentEntity installmentEntity) throws Exception;
    void deleteUser(User user);
    List<UserList> selectUserList(String keyWord, Pageable request);
    List<InstallmentInfoEntity> selectInstallmentInfoList(String installId);
    List<InstallmentInfoEntity> selectInstallmentInfoList2(String installId);

    User findByMobilePhoneAndPassword(String mobilePhone, String password);
    Map<String,Object> editRepayState(String installmentInfoId,String state) throws Exception;
    InstallmentEntity selectInstallmentListByUserId(String userId);
    User queryUser(String id);

    User findByMobile(String mobilePhone);

    InstallmentEntity findOne(String id);

    int selectUserListCount(String keyWord);
}
