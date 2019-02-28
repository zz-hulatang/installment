package com.fukai.installment.controller;

import com.fukai.installment.bean.InstallmentEntity;
import com.fukai.installment.bean.InstallmentInfoEntity;
import com.fukai.installment.bean.User;
import com.fukai.installment.bean.pojo.User4Creat;
import com.fukai.installment.bean.pojo.UserList;
import com.fukai.installment.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

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
     * @param bean
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public Map<String, Object> addUser(@RequestBody User4Creat bean) throws Exception{
        Map<String,Object> result = new HashMap<String,Object>();

        User user1 = userService.findByMobile(bean.getMobilePhone());
        if(user1 != null){
            result.put("retCode","500");
            result.put("retMsg","该手机号已经存在！");
            return result;
        }

        String userId = UUID.randomUUID().toString();
        User user = new User();
        user.setId(userId);
        user.setPassword("0000");
        user.setName(bean.getName());
        user.setUserType("0");
        user.setCreateTime(new Date());
        user.setIdCard(bean.getIdCard());
        user.setMobilePhone(bean.getMobilePhone());

        InstallmentEntity installmentEntity = new InstallmentEntity();
        String id1 = UUID.randomUUID().toString();
        installmentEntity.setId(id1);
        installmentEntity.setUserId(userId);
        installmentEntity.setInstallmentAmount(bean.getInstallmentAmount());
        installmentEntity.setInterestRate(bean.getInterestRate());
        installmentEntity.setRepayNumber(bean.getRepayNumber());
        installmentEntity.setRepayCardNumber(bean.getRepayCardNumber());
        installmentEntity.setRepayDate(bean.getRepayDate());
        installmentEntity.setProfileNumber(bean.getProfileNumber());
        installmentEntity.setRepayType(bean.getRepayType());
        try {
            result = userService.save(user, installmentEntity);
        }catch (Exception e){
            result.put("retCode","500");
            result.put("retMsg","创建用户失败！");
        }
        return result;
    }

    @RequestMapping(value = "/edit",method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public Map<String, Object> editUser(@RequestBody User4Creat bean) throws Exception{
        Map<String,Object> result = new HashMap<String,Object>();

        User user1 = userService.findByMobile(bean.getMobilePhone());
        User user = userService.queryUser(bean.getUserId());
        if(user1 != null && !StringUtils.equals(user1.getMobilePhone(),user.getMobilePhone())){
            result.put("retCode","500");
            result.put("retMsg","该手机号已经存在！");
            return result;
        }

        user.setName(bean.getName());
        user.setCreateTime(new Date());
        user.setIdCard(bean.getIdCard());
        user.setMobilePhone(bean.getMobilePhone());

        InstallmentEntity installmentEntity = userService.findOne(bean.getInstallmentEntityId());


        if(installmentEntity.getInterestRate() != bean.getInterestRate()
                || installmentEntity.getInstallmentAmount() != bean.getInstallmentAmount()
                || installmentEntity.getRepayNumber() != bean.getRepayNumber()){
            installmentEntity.setInstallmentAmount(bean.getInstallmentAmount());
            installmentEntity.setInterestRate(bean.getInterestRate());
            installmentEntity.setRepayNumber(bean.getRepayNumber());
            installmentEntity.setRepayCardNumber(bean.getRepayCardNumber());
            installmentEntity.setRepayDate(bean.getRepayDate());
            installmentEntity.setProfileNumber(bean.getProfileNumber());
            installmentEntity.setRepayType(bean.getRepayType());
            //重新计算
            try {
                userService.deleteInfo(installmentEntity.getId());
                result = userService.save(user, installmentEntity);
            }catch (Exception e){
                result.put("retCode","500");
                result.put("retMsg","创建修改失败！");
            }

        }else{
            try {
                result = userService.save2(user, installmentEntity);
            }catch (Exception e){
                result.put("retCode","500");
                result.put("retMsg","修改用户失败！");
            }
        }


        return result;
    }

    /**
     * 查询用户列表
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/queryUser",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> queryUserList(String keyWord, int page, int size) throws Exception{
        Map<String,Object> map = new HashMap<>();
        int count = userService.selectUserListCount(keyWord);
        map.put("count",count);
        Pageable request = new PageRequest(page-1,size);
        List<UserList> userList = userService.selectUserList(keyWord,request);
        map.put("userList",userList);
        return map;
    }

    /**
     * 查询还款详情app
     * @param installId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/queryInstallmentInfo",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> queryInstallmentList(String installId) throws Exception{
        Map<String,Object> map = new HashMap<>();
        InstallmentEntity installmentEntity = userService.findOne(installId);
        map.put("count",installmentEntity.getRepayNumber());
        List<InstallmentInfoEntity> infoList = userService.selectInstallmentInfoList(installId);
        map.put("data",infoList);
        return map;
    }

    /**
     * 查询还款详情app
     * @param installId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/queryInstallmentInfo2",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> queryInstallmentList2(String installId) throws Exception{
        Map<String,Object> map = new HashMap<>();
        InstallmentEntity installmentEntity = userService.findOne(installId);
        map.put("count",installmentEntity.getRepayNumber());
        List<InstallmentInfoEntity> infoList = userService.selectInstallmentInfoList2(installId);
        map.put("data",infoList);
        return map;
    }

    /**
     * 查询贷款信息主表 app调用
     * @param userId
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/queryInstallment",method = RequestMethod.GET)
    @ResponseBody
    public InstallmentEntity queryInstallment(String userId) throws Exception{
        InstallmentEntity installmentEntity = userService.selectInstallmentListByUserId(userId);
        return installmentEntity;
    }

    /**
     * 修改还款状态
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/editState",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> editRepayState(String installmentInfoId, String state){
        Map<String,Object> result = new HashMap<String,Object>();
        try {
            result = userService.editRepayState(installmentInfoId, state);
        }catch (Exception e){
            result.put("retCode","500");
            result.put("retMsg","修改还款状态失败！");
        }
        return result;
    }

    /**
     * 查询用户信息 app调用
     * @param id
     * @return
     */
    @RequestMapping(value = "/queryUser4app",method = RequestMethod.GET)
    @ResponseBody
    public User queryUser(String id) {
        return userService.queryUser(id);
    }

    @RequestMapping(value = "/deleteInfo",method = RequestMethod.GET)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public Map<String,String> deleteInfo(String id){
        Map<String,String> result = new HashMap<>();
        try{
            userService.deleteInfo(id);
            result.put("retCode","200");
            result.put("retMsg","删除成功！");
        }catch (Exception e){
            result.put("retCode","500");
            result.put("retMsg","删除失败！");
        }
        return result;
    }

    @RequestMapping(value = "/password/{userId}",method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.OK)
    @ResponseBody
    public Map<String,String> deleteInfo(@PathVariable String userId,@RequestBody Map<String,String> map){
        Map<String,String> result = new HashMap<>();
        User user = userService.queryUser(userId);
        if(!StringUtils.equals(user.getPassword(),map.get("oldPass"))){
            result.put("retCode","500");
            result.put("retMsg","修改密码失败，旧密码输入错误！");
            return result;
        }
        try{
            userService.updatePass(userId,map.get("newPass"));
            result.put("retCode","200");
            result.put("retMsg","修改密码成功！");
        }catch (Exception e){
            result.put("retCode","500");
            result.put("retMsg","修改密码失败！");
        }
        return result;
    }

}
