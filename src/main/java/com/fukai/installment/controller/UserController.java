package com.fukai.installment.controller;

import com.fukai.installment.bean.InstallmentEntity;
import com.fukai.installment.bean.InstallmentInfoEntity;
import com.fukai.installment.bean.User;
import com.fukai.installment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 21:51
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 添加用户
     * @param user
     * @param installmentEntity
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    @ResponseBody
    public Map<String, Object> addUser(@RequestBody User user,@RequestBody InstallmentEntity installmentEntity) throws Exception{
        Map<String,Object> result = new HashMap<String,Object>();
        String id = UUID.randomUUID().toString();
        user.setId(id);
        String id1 = UUID.randomUUID().toString();
        installmentEntity.setId(id1);
        try {
            result = userService.save(user, installmentEntity);
        }catch (Exception e){
            result.put("retCode","500");
            result.put("retMsg","创建用户失败！");
        }
        return result;
    }

    /**
     * 查询用户列表
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/queryUser",method = RequestMethod.POST)
    @ResponseBody
    public List<User> queryUserList() throws Exception{
        List<User> userList = userService.selectUserList();
        return userList;
    }

    /**
     * 查询还款详情
     * @param installId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/queryInstallmentInfo",method = RequestMethod.POST)
    @ResponseBody
    public List<InstallmentInfoEntity> queryInstallmentList(String installId) throws Exception{
        List<InstallmentInfoEntity> infoList = userService.selectInstallmentInfoList(installId);
        return infoList;
    }

    /**
     * 修改还款状态
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/editState",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> editRepayState(String installmentInfoId, String state){
        Map<String,Object> result = new HashMap<String,Object>();
        try {
            result = userService.editRepayState(installmentInfoId, state);
        }catch (Exception e){
            result.put("retCode","500");
            result.put("retMsg","修改还款状态失败失败！");
        }
        return result;
    }
}
