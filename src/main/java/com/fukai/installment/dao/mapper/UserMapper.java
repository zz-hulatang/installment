package com.fukai.installment.dao.mapper;

import com.fukai.installment.bean.pojo.UserList;
import com.fukai.installment.dao.provider.UserProvider;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-26 19:07
 */
@Component
@Mapper
public interface UserMapper {
    @SelectProvider(type = UserProvider.class,method = "getUserList")
    List<UserList> getUserList(Map<String,Object> map);

    @SelectProvider(type = UserProvider.class,method = "selectUserListCount")
    int selectUserListCount(String keyWord);

    @Update(value = "update installmentInfo set repayState = 1 where repayState = 0 and repayTime < SYSDATE()")
    void repayStateJob();
}
