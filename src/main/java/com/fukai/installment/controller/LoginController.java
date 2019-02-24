package com.fukai.installment.controller;

import com.fukai.installment.bean.User;
import com.fukai.installment.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: luoxiaozhu
 * @Date: 2019-02-21 21:51
 */
@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public Object login(@RequestBody Map<String, String> map){
        String mobilePhone = map.get("mobilePhone");
        String password = map.get("password");
        User user = userService.findByMobilePhoneAndPassword(mobilePhone,password);
        Map<String,Object> objectMap = new HashMap<>();
        if(user != null){
            objectMap.put("success","success");
            objectMap.put("user",user);
        }else{
            objectMap.put("error","手机号或密码错误");
        }
        return objectMap;
    }

    @RequestMapping("/success")
    public String success(){
        return "success";
    }

}
